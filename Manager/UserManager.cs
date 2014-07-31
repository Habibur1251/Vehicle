using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class UserManager
    {
        public bool SaveVehicleUser(Entity.User User)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@UserCode" ,SqlDbType.VarChar, 50, User.UserCode),
                            dataManager.MakeInParam("@UserName" ,SqlDbType.VarChar, 100, User.UserName),
                            dataManager.MakeInParam("@MobileNo" ,SqlDbType.VarChar, 50, User.MobileNo),
                            dataManager.MakeInParam("@CompanyId" ,SqlDbType.Int,0, User.CompanyId),
                            dataManager.MakeInParam("@DepartmentId" ,SqlDbType.Int,0, User.DepartmentId),
                            dataManager.MakeInParam("@DesignationId" ,SqlDbType.Int,0, User.DesignationId),
                            dataManager.MakeInParam("@CreateBy" ,SqlDbType.VarChar, 50, User.CreateBy)
                        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("INSERT INTO [User]([UserCode],[UserName],[MobileNo],[CompanyId],[DepartmentId],[DesignationId],CreateDate,[CreateBy])VALUES(@UserCode,@UserName,@MobileNo,@CompanyId,@DepartmentId,@DesignationId,GETDATE(),@CreateBy);", parameters);
                
                dataManager.CommitTransaction();

                isExecuted = true;
            }
            catch
            {
                dataManager.RollbackTransaction();
                isExecuted = false;
            }
            finally
            {
                dataManager.CloseConnection();
            }
            return isExecuted;
        }

        public bool UpdateVehicleUser(Entity.User User)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, User.UserId),
                            dataManager.MakeInParam("@UserCode" ,SqlDbType.VarChar, 50, User.UserCode),
                            dataManager.MakeInParam("@UserName" ,SqlDbType.VarChar, 100, User.UserName),
                            dataManager.MakeInParam("@MobileNo" ,SqlDbType.VarChar, 50, User.MobileNo),
                            dataManager.MakeInParam("@CompanyId" ,SqlDbType.Int,0, User.CompanyId),
                            dataManager.MakeInParam("@DepartmentId" ,SqlDbType.Int,0, User.DepartmentId),
                            dataManager.MakeInParam("@DesignationId" ,SqlDbType.Int,0, User.DesignationId),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, User.UpdateBy)
                        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("UPDATE [User] SET [UserCode] = @UserCode,[UserName] = @UserName,[MobileNo] = @MobileNo,[CompanyId] = @CompanyId,[DepartmentId] = @DepartmentId,[DesignationId] = @DesignationId,[UpdateDate] = GETDATE(), [UpdateBy] = @UpdateBy WHERE [UserId] = @UserId;", parameters);

                dataManager.CommitTransaction();

                isExecuted = true;
            }
            catch
            {
                dataManager.RollbackTransaction();
                isExecuted = false;
            }
            finally
            {
                dataManager.CloseConnection();
            }
            return isExecuted;
        }

        public DataTable GetVehicles(int vehicleId)
        {
            DataManager dataManager = new DataManager();
            string query = string.Empty;
            if (vehicleId == 0)
                query = "SELECT 0 AS [VehicleId], '[Select Vehicle]' AS [Vehicle] UNION SELECT [VehicleId], [RegNo] + ' - ' + CONVERT(VARCHAR, [RegDate], 103) + ' - ' + [ModelType] AS Vehicle FROM [Vehicles] WHERE [Status] = 'In Hand'";
            else
                query = "SELECT 0 AS [VehicleId], '[Select Vehicle]' AS [Vehicle] UNION SELECT [VehicleId], [RegNo] + ' - ' + CONVERT(VARCHAR, [RegDate], 103) + ' - ' + [ModelType] AS Vehicle FROM [Vehicles] WHERE ([Status] = 'In Hand' OR [VehicleId] = " + vehicleId.ToString() + ")";
            return dataManager.GetDataTable(query);
        }

        

    }
}