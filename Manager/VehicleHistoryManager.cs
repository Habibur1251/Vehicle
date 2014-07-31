using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class VehicleHistoryManager
    {
        public bool SaveTransaction(Entity.VehicleHistory VehicleHistory)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                string query;

                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@TransactionId" ,SqlDbType.BigInt, 0, VehicleHistory.TransactionId),
                            dataManager.MakeInParam("@VehicleId" ,SqlDbType.Int, 0, VehicleHistory.VehicleId),
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, VehicleHistory.UserId),
                            dataManager.MakeInParam("@HandOverDate" ,SqlDbType.Date, 0, VehicleHistory.HandOverDate),
                            dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, VehicleHistory.HandOverType),
                            dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, VehicleHistory.LocationId),
                            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, VehicleHistory.Status),
                            dataManager.MakeInParam("@CreateBy" ,SqlDbType.VarChar, 50, VehicleHistory.CreateBy) 
                        };
                dataManager.BeginTransaction();
                query = "INSERT INTO [Transactions]([UserId],[VehicleId],[HandOverDate],[HandOverType],[LocationId],[Status],[CreateDate],[CreateBy])VALUES(@UserId,@VehicleId,@HandOverDate,@HandOverType,@LocationId,@Status,GETDATE(),@CreateBy);UPDATE [Vehicles] SET [Status] = @Status,[UpdateBy] = @CreateBy,[UpdateDate] = GETDATE() WHERE [VehicleId] = @VehicleId;";
                dataManager.ExecuteProc(query, parameters);


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

        public bool UpdateTransaction(Entity.VehicleHistory VehicleHistory)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                string query;

                dataManager.BeginTransaction();

                SqlParameter[] parameters = SetParametersForUpdateTransaction(VehicleHistory, dataManager);

                if (VehicleHistory.ToDate == DateTime.MinValue)
                    query = "UPDATE [Transactions] SET [UserId] = @UserId,[VehicleId] = @VehicleId,[HandOverDate] = @HandOverDate,[HandOverType] = @HandOverType,[LocationId] = @LocationId,[Status] = @Status,[UpdateBy] = @UpdateBy,[UpdateDate] = GETDATE() WHERE [TransactionId] = @TransactionId;UPDATE [Vehicles] SET [Status] = @Status,[UpdateBy] = @UpdateBy,[UpdateDate] = GETDATE() WHERE [VehicleId] = @VehicleId;";
                else
                    query = "UPDATE [Transactions] SET [UserId] = @UserId,[VehicleId] = @VehicleId,[HandOverDate] = @HandOverDate,[ToDate] = @ToDate,[HandOverType] = @HandOverType,[LocationId] = @LocationId,[Status] = @Status,[UpdateBy] = @UpdateBy,[UpdateDate] = GETDATE() WHERE [TransactionId] = @TransactionId;UPDATE [Vehicles] SET [Status] = @Status,[UpdateBy] = @UpdateBy,[UpdateDate] = GETDATE() WHERE [VehicleId] = @VehicleId;";
                
                if (VehicleHistory.PreviousVehicleId != VehicleHistory.VehicleId)
                    query = query + "UPDATE [Vehicles] SET [Status] = 'In Hand',[UpdateBy] = @UpdateBy,[UpdateDate] = GETDATE() WHERE [VehicleId] = @PreviousVehicleId;";

                dataManager.ExecuteProc(query, parameters);
                
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

        private static SqlParameter[] SetParametersForUpdateTransaction(Entity.VehicleHistory VehicleHistory, DataManager dataManager)
        {
            SqlParameter[] parameters;

            if (VehicleHistory.ToDate == DateTime.MinValue)
            {
                SqlParameter[] parameters1 =
                        {                     
                            dataManager.MakeInParam("@TransactionId" ,SqlDbType.BigInt, 0, VehicleHistory.TransactionId),
                            dataManager.MakeInParam("@VehicleId" ,SqlDbType.Int, 0, VehicleHistory.VehicleId),
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, VehicleHistory.UserId),
                            dataManager.MakeInParam("@HandOverDate" ,SqlDbType.Date, 0, VehicleHistory.HandOverDate),
                            dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, VehicleHistory.HandOverType),
                            dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, VehicleHistory.LocationId),
                            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, VehicleHistory.Status),
                            dataManager.MakeInParam("@PreviousVehicleId" ,SqlDbType.Int, 0, VehicleHistory.PreviousVehicleId),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, VehicleHistory.UpdateBy)
                        };
                parameters = parameters1;
            }
            else
            {
                SqlParameter[] parameters2 =
                        {                     
                            dataManager.MakeInParam("@TransactionId" ,SqlDbType.BigInt, 0, VehicleHistory.TransactionId),
                            dataManager.MakeInParam("@VehicleId" ,SqlDbType.Int, 0, VehicleHistory.VehicleId),
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, VehicleHistory.UserId),
                            dataManager.MakeInParam("@HandOverDate" ,SqlDbType.Date, 0, VehicleHistory.HandOverDate),
                            dataManager.MakeInParam("@ToDate" ,SqlDbType.Date, 0, VehicleHistory.ToDate),
                            dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, VehicleHistory.HandOverType),
                            dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, VehicleHistory.LocationId),
                            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, VehicleHistory.Status),
                            dataManager.MakeInParam("@PreviousVehicleId" ,SqlDbType.Int, 0, VehicleHistory.PreviousVehicleId),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, VehicleHistory.UpdateBy)
                        };
                parameters = parameters2;
            }

            return parameters;
        }
    }
}