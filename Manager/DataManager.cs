using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class DataManager
    {
        #region Private Member Variables

        private SqlConnection sqlConnection;
        private SqlTransaction sqlTransaction;
        private string connectionString;

        #endregion

        #region Constructors

        public DataManager()
        {
            connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ToString();
            sqlConnection = new SqlConnection(connectionString);
        }

        #endregion

        private void OpenConnection()
        {
            if (sqlConnection != null)
            {
                if (sqlConnection.State != ConnectionState.Open)
                    sqlConnection.Open();
            }
        }

        public void CloseConnection()
        {
            if (sqlConnection != null)
            {
                sqlConnection.Close();
            }
        }

        public void BeginTransaction()
        {
            this.OpenConnection();
            if (sqlTransaction == null)
                sqlTransaction = sqlConnection.BeginTransaction();
        }

        public void CommitTransaction()
        {
            if (sqlTransaction != null)
                sqlTransaction.Commit();
        }

        public void RollbackTransaction()
        {
            if (sqlTransaction != null)
                sqlTransaction.Rollback();
        }

        public DataTable GetDataTable(string query)
        {

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, sqlConnection);
            DataTable dataTable = new DataTable();

            int rows = sqlDataAdapter.Fill(dataTable);

            return dataTable;
        }


        public DataTable GetDataTable(string query, SqlParameter[] parameters)
        {
            SqlCommand sqlCommand = CreateCommand(query, parameters);
            sqlCommand.Connection = sqlConnection;

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();

            int rows = sqlDataAdapter.Fill(dataTable);

            return dataTable;
        }

        public DataSet GetDataSet(string query)
        {
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(query, sqlConnection);
            DataSet dataSet = new DataSet();

            sqlDataAdapter.Fill(dataSet);

            return dataSet;
        }

        public DataSet GetDataSet(string query, SqlParameter[] parameters)
        {
            SqlCommand sqlCommand = CreateCommand(query, parameters);
            sqlCommand.Connection = sqlConnection;

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataSet dataSet = new DataSet();

            sqlDataAdapter.Fill(dataSet);

            return dataSet;
        }

        private SqlCommand CreateCommand(string query, SqlParameter[] parameters)
        {
            SqlCommand sqlCommand;

            if (sqlTransaction == null)
                sqlCommand = new SqlCommand(query, sqlConnection);
            else
                sqlCommand = new SqlCommand(query, sqlConnection, sqlTransaction);

            sqlCommand.CommandType = CommandType.Text;

            // add proc parameters
            if (parameters != null)
            {
                foreach (SqlParameter parameter in parameters)
                    sqlCommand.Parameters.Add(parameter);
            }

            // return param
            sqlCommand.Parameters.Add(
                new SqlParameter("ReturnValue", SqlDbType.Int, 4,
                ParameterDirection.ReturnValue, false, 0, 0,
                string.Empty, DataRowVersion.Default, null));

            return sqlCommand;
        }

        public int RunProc(string query)
        {
            SqlCommand cmd = CreateCommand(query, null);
            cmd.ExecuteNonQuery();

            this.CloseConnection();
            return (int)cmd.Parameters["ReturnValue"].Value;
        }

        public string RunProcedure(string query)
        {
            SqlCommand cmd = CreateCommand(query, null);
            cmd.ExecuteNonQuery();

            this.CloseConnection();
            return (string)cmd.Parameters["@returnParam"].Value;
        }

        public int RunQuery(string query)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection, sqlTransaction);
            return sqlCommand.ExecuteNonQuery();
        }

        public int ExecuteProc(string query, SqlParameter[] parameters)
        {
            SqlCommand sqlCommand = CreateCommand(query, parameters);
            return sqlCommand.ExecuteNonQuery();
        }

        public bool IsExist(string query)
        {
            bool returnValue = false;
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection, sqlTransaction);
            object result = sqlCommand.ExecuteScalar();
            if (result == null)
                returnValue = false;
            else
                returnValue = true;
            return returnValue;
        }

        public object ExecuteScalar(string query)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            this.OpenConnection();
            return sqlCommand.ExecuteScalar();
        }

        public object ExecuteScalar2(string query)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection, sqlTransaction);
            return sqlCommand.ExecuteScalar();
        }

        /// &ltsummary>
        /// Run stored procedure.
        /// </summary>
        /// &ltparam name="query">Name of stored procedure.</param>
        /// &ltparam name="prams">Stored procedure params.</param>
        /// &ltreturns>Stored procedure return value.</returns>
        public int RunProc(string query, SqlParameter[] prams)
        {
            int returnValue = 0;
            try
            {
                this.BeginTransaction();

                SqlCommand cmd = CreateCommand(query, prams);
                cmd.ExecuteNonQuery();

                this.CommitTransaction();

                returnValue = (int)cmd.Parameters["ReturnValue"].Value;
            }
            catch (SqlException ex)
            {
                this.RollbackTransaction();
            }
            finally
            {
                this.CloseConnection();
            }
            return returnValue;
        }

        /// &ltsummary>
        /// Run stored procedure.
        /// </summary>
        /// &ltparam name="query">Name of stored procedure.</param>
        /// &ltparam name="prams">Stored procedure params.</param>
        /// &ltreturns>Stored procedure return value.</returns>
        public string RunProcedure(string query, SqlParameter[] prams)
        {
            string returnValue = string.Empty;
            try
            {
                this.BeginTransaction();

                SqlCommand cmd = CreateCommand(query, prams);
                cmd.ExecuteNonQuery();

                this.CommitTransaction();

                returnValue = (string)cmd.Parameters["@return_param"].Value;
            }
            catch (SqlException ex)
            {
                this.RollbackTransaction();
            }
            finally
            {
                this.CloseConnection();
            }
            return returnValue;
        }

        /// &ltsummary>
        /// Run stored procedure.
        /// </summary>
        /// &ltparam name="query">Name of stored procedure.</param>
        /// &ltparam name="dataReader">Return result of procedure.</param>
        public void RunProc(string query, out SqlDataReader dataReader)
        {
            this.OpenConnection();
            SqlCommand cmd = CreateCommand(query, null);
            dataReader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        /// &ltsummary>
        /// Run stored procedure.
        /// </summary>
        /// &ltparam name="query">Name of stored procedure.</param>
        /// &ltparam name="prams">Stored procedure params.</param>
        /// &ltparam name="dataReader">Return result of procedure.</param>
        public SqlDataReader ExecuteReader(string query, SqlParameter[] prams)
        {
            this.OpenConnection();
            SqlCommand cmd = CreateCommand(query, prams);
            return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value)
        {
            return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
        }

        public SqlParameter MakeOutParam(string ParamName, SqlDbType DbType, int Size)
        {
            return MakeParam(ParamName, DbType, Size, ParameterDirection.Output, null);
        }

        public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size,
         ParameterDirection direction, object value)
        {
            SqlParameter param;

            if (Size > 0)
                param = new SqlParameter(ParamName, DbType, Size);
            else
                param = new SqlParameter(ParamName, DbType);

            param.Direction = direction;
            if (!(direction == ParameterDirection.Output && value == null))
                param.Value = value;

            return param;
        }
    }
}