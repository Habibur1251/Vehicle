using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class VehicleModelManager
    {
        public bool SaveModelType(Entity.VehicleModelType VehicleModel)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@ModelTypeId" ,SqlDbType.Int, 0, VehicleModel.ModelTypeId),
                            dataManager.MakeInParam("@ModelType" ,SqlDbType.VarChar, 100, VehicleModel.ModelType),
                            dataManager.MakeInParam("@VehicleType" ,SqlDbType.Int,0, VehicleModel.VehicleType),
                            dataManager.MakeInParam("@CreateBy" ,SqlDbType.VarChar, 50, VehicleModel.CreateBy)
                        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("INSERT INTO [ModelType] ([ModelType],[VehicleType],[CreateDate],[CreateBy])VALUES(@ModelType,@VehicleType,GETDATE(),@CreateBy);", parameters);
                
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

        public bool UpdateModelType(Entity.VehicleModelType VehicleModel)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@ModelTypeId" ,SqlDbType.Int, 0, VehicleModel.ModelTypeId),
                            dataManager.MakeInParam("@ModelType" ,SqlDbType.VarChar, 100, VehicleModel.ModelType),
                            dataManager.MakeInParam("@VehicleType" ,SqlDbType.Int,0, VehicleModel.VehicleType),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, VehicleModel.UpdateBy)
                        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("UPDATE [ModelType] SET [ModelType] = @ModelType,[VehicleType] = @VehicleType,[UpdateDate] = GETDATE(), [UpdateBy] = @UpdateBy WHERE [ModelTypeId] = @ModelTypeId;", parameters);

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

              

    }
}