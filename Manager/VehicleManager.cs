using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class VehicleManager
    {
        public string SaveVehicle(Entity.Vehicle vehicle)
        {
            DataManager dataManager = new DataManager();

            string isExecuted = "@no@";
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@RegNo" ,SqlDbType.VarChar, 50, vehicle.RegNo),
                            dataManager.MakeInParam("@RegDate" ,SqlDbType.VarChar, 50, vehicle.RegDate),
                            dataManager.MakeInParam("@ModelTypeId" ,SqlDbType.Int, 0, vehicle.ModelTypeId),
                            dataManager.MakeInParam("@FuelType" ,SqlDbType.VarChar, 50, vehicle.FuelType),
                            dataManager.MakeInParam("@Owner" ,SqlDbType.VarChar, 50, vehicle.Owner),
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, vehicle.UserId),
                            dataManager.MakeInParam("@HandOverDate" ,SqlDbType.VarChar, 50, vehicle.HandOverDate),
                            dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, vehicle.HandOverType),
                            dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, vehicle.LocationId),
                            dataManager.MakeInParam("@SupplierName" ,SqlDbType.VarChar, 50, vehicle.SupplierName),
                            dataManager.MakeInParam("@SupplierAddress" ,SqlDbType.VarChar, 50, vehicle.SupplierAddress),
                            dataManager.MakeInParam("@VehicleType" ,SqlDbType.VarChar, 50, vehicle.VehicleType),
                            dataManager.MakeInParam("@PurchasePrice" ,SqlDbType.Decimal, 0, vehicle.PurchasePrice),
                            dataManager.MakeInParam("@EngineNo" ,SqlDbType.VarChar, 50, vehicle.EngineNo),
                            dataManager.MakeInParam("@ChechisNo" ,SqlDbType.VarChar, 50, vehicle.ChechisNo),
                            dataManager.MakeInParam("@VehicleColor" ,SqlDbType.VarChar, 50, vehicle.VehicleColor),
                            dataManager.MakeInParam("@EngineCapacity" ,SqlDbType.VarChar, 50, vehicle.EngineCapacity),
                            dataManager.MakeInParam("@TireSize" ,SqlDbType.VarChar, 50, vehicle.TireSize),
                            dataManager.MakeInParam("@FitnessDate" ,SqlDbType.VarChar, 50, vehicle.FitnessDate),
                            dataManager.MakeInParam("@TaxDate" ,SqlDbType.VarChar, 50, vehicle.TaxDate),
                            dataManager.MakeInParam("@InsuranceDate" ,SqlDbType.VarChar, 50, vehicle.InsuranceDate),
                            dataManager.MakeInParam("@RoadPermitDate" ,SqlDbType.VarChar, 50, vehicle.RoadPermitDate),

                            dataManager.MakeInParam("@Remarks" ,SqlDbType.VarChar, 50, vehicle.Remarks),
                            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, vehicle.Status),
                            dataManager.MakeInParam("@CreateBy" ,SqlDbType.VarChar, 50, vehicle.CreateBy)
                        };


                //SqlParameter[] parameterTrans =
                //        {                     
                            
                //            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, vehicle.UserId),
                //            dataManager.MakeInParam("@RegNo" ,SqlDbType.VarChar, 50, vehicle.RegNo),
                //            dataManager.MakeInParam("@HandOverDate" ,SqlDbType.Date, 0, vehicle.HandOverDate),
                //            dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, vehicle.HandOverType),
                //            dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, vehicle.LocationId),
                //            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, vehicle.Status),
                //            dataManager.MakeInParam("@CreateBy" ,SqlDbType.VarChar, 50, vehicle.CreateBy)
                //        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("INSERT INTO [Vehicles]([RegNo],[RegDate],[ModelTypeId],[FuelType],[Owner],[UserId],[HandOverDate],[HandOverType],[LocationId],[SupplierName],[SupplierAddress],[VehicleType],[PurchasePrice], [EngineNo], [ChechisNo], [VehicleColor], [EngineCapacity], [TireSize], [FitnessDate], [TaxDate], [InsuranceDate], [RoadPermitDate],[Remarks],[Status],[CreateDate],[CreateBy])VALUES(@RegNo,@RegDate,@ModelTypeId,@FuelType,@Owner, @UserId,@HandOverDate,@HandOverType,@LocationId,@SupplierName,@SupplierAddress,@VehicleType,@PurchasePrice, @EngineNo, @ChechisNo, @VehicleColor, @EngineCapacity, @TireSize, @FitnessDate, @TaxDate, @InsuranceDate, @RoadPermitDate,@Remarks,@Status,GETDATE(),@CreateBy);INSERT INTO [Transactions]([UserId],[RegNo],[HandOverDate],[HandOverType],[LocationId],[Status],[CreateDate],[CreateBy])VALUES(@UserId,@RegNo,@HandOverDate,@HandOverType,@LocationId,@Status,GETDATE(),@CreateBy);", parameters);
                //dataManager.ExecuteProc("INSERT INTO [Transactions]([UserId],[RegNo],[HandOverDate],[HandOverType],[LocationId],[Status],[CreateDate],[CreateBy])VALUES(@UserId,@RegNo,@HandOverDate,@HandOverType,@LocationId,@Status,GETDATE(),@CreateBy);", parameterTrans);
                dataManager.CommitTransaction();

                isExecuted = "@yes@";
            }
            catch (Exception ex)
            {
                dataManager.RollbackTransaction();
                isExecuted = ex.Message.ToString();
            }
            finally
            {
                dataManager.CloseConnection();
            }
            return isExecuted;
        }

        public string UpdateVehicle(Entity.Vehicle vehicle)
        {
            DataManager dataManager = new DataManager();

            string isExecuted = "@no@";
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@VehicleId" ,SqlDbType.Int, 0, vehicle.VehicleId),
                            dataManager.MakeInParam("@RegNo" ,SqlDbType.VarChar, 50, vehicle.RegNo),
                            dataManager.MakeInParam("@RegDate" ,SqlDbType.VarChar, 50, vehicle.RegDate),
                            dataManager.MakeInParam("@ModelTypeId" ,SqlDbType.Int, 0, vehicle.ModelTypeId),
                            dataManager.MakeInParam("@FuelType" ,SqlDbType.VarChar, 50, vehicle.FuelType),
                            dataManager.MakeInParam("@Owner" ,SqlDbType.VarChar, 50, vehicle.Owner),
                            //dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, vehicle.UserId),
                            //dataManager.MakeInParam("@HandOverDate" ,SqlDbType.Date, 0, vehicle.HandOverDate),
                            //dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, vehicle.HandOverType),
                            //dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, vehicle.LocationId),
                            dataManager.MakeInParam("@SupplierName" ,SqlDbType.VarChar, 50, vehicle.SupplierName),
                            dataManager.MakeInParam("@SupplierAddress" ,SqlDbType.VarChar, 50, vehicle.SupplierAddress),
                            dataManager.MakeInParam("@VehicleType" ,SqlDbType.VarChar, 50, vehicle.VehicleType),
                            dataManager.MakeInParam("@PurchasePrice" ,SqlDbType.Decimal, 0, vehicle.PurchasePrice),
                            dataManager.MakeInParam("@EngineNo" ,SqlDbType.VarChar, 50, vehicle.EngineNo),
                            dataManager.MakeInParam("@ChechisNo" ,SqlDbType.VarChar, 50, vehicle.ChechisNo),
                            dataManager.MakeInParam("@VehicleColor" ,SqlDbType.VarChar, 50, vehicle.VehicleColor),
                            dataManager.MakeInParam("@EngineCapacity" ,SqlDbType.VarChar, 50, vehicle.EngineCapacity),
                            dataManager.MakeInParam("@TireSize" ,SqlDbType.VarChar, 50, vehicle.TireSize),
                            dataManager.MakeInParam("@FitnessDate" ,SqlDbType.VarChar, 50, vehicle.FitnessDate),
                            dataManager.MakeInParam("@TaxDate" ,SqlDbType.VarChar, 50, vehicle.TaxDate),
                            dataManager.MakeInParam("@InsuranceDate" ,SqlDbType.VarChar, 50, vehicle.InsuranceDate),
                            dataManager.MakeInParam("@RoadPermitDate" ,SqlDbType.VarChar, 50, vehicle.RoadPermitDate),

                            dataManager.MakeInParam("@Remarks" ,SqlDbType.VarChar, 50, vehicle.Remarks),
                            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, vehicle.Status),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, vehicle.UpdateBy)
                        };

                dataManager.BeginTransaction();
               
                dataManager.ExecuteProc("UPDATE [Vehicles] SET [RegNo] = @RegNo,[RegDate] = @RegDate,[ModelTypeId] = @ModelTypeId,[FuelType] = @FuelType,[Owner] = @Owner,[SupplierName]= @SupplierName,[SupplierAddress] = @SupplierAddress,[VehicleType] = @VehicleType,[PurchasePrice] = @PurchasePrice,[EngineNo]=@EngineNo, [ChechisNo]=@ChechisNo, [VehicleColor]=@VehicleColor, [EngineCapacity]=@EngineCapacity, [TireSize]=@TireSize, [FitnessDate]=@FitnessDate, [TaxDate]=@TaxDate, [InsuranceDate]=@InsuranceDate, [RoadPermitDate]=@RoadPermitDate,[Remarks] = @Remarks,[Status] = @Status,[UpdateDate] = GETDATE(), [UpdateBy] = @UpdateBy WHERE [VehicleId] = @VehicleId;", parameters);

                dataManager.CommitTransaction();

                isExecuted = "@yes@";
            }
            catch (Exception ex)
            {
                dataManager.RollbackTransaction();
                isExecuted = ex.Message.ToString();
            }
            finally
            {
                dataManager.CloseConnection();
            }
            return isExecuted;
        }

        public bool VacantVehicle(Entity.Vehicle vehicle)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@VehicleId" ,SqlDbType.Int, 0, vehicle.VehicleId),
                            dataManager.MakeInParam("@RegNo" ,SqlDbType.VarChar, 50, vehicle.RegNo),
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, vehicle.UserId),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, vehicle.UpdateBy)
                          
                        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("UPDATE [Vehicles] SET [UserId]=0,[HandOverDate]=null,[HandOverType]='0',[LocationId]=0,[Status] = 'In Hand',[UpdateDate] = GETDATE(), [UpdateBy] = @UpdateBy WHERE [VehicleId] = @VehicleId;UPDATE [Transactions] SET [ToDate] = Getdate(),[UpdateDate] = GETDATE(), [UpdateBy] = @UpdateBy WHERE [UserId]=@UserId and [RegNo]=@RegNo;", parameters);
                
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
        public bool HandoverVehicle(Entity.Vehicle vehicle)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@VehicleId" ,SqlDbType.Int, 0, vehicle.VehicleId),
                            dataManager.MakeInParam("@RegNo" ,SqlDbType.VarChar, 50, vehicle.RegNo),
                            dataManager.MakeInParam("@UserId" ,SqlDbType.Int, 0, vehicle.UserId),
                            dataManager.MakeInParam("@HandOverDate" ,SqlDbType.Date, 0, vehicle.HandOverDate),
                            dataManager.MakeInParam("@HandOverType" ,SqlDbType.VarChar, 50, vehicle.HandOverType),
                            dataManager.MakeInParam("@LocationId" ,SqlDbType.Int, 0, vehicle.LocationId),
                            dataManager.MakeInParam("@Status" ,SqlDbType.VarChar, 50, vehicle.Status),
                            dataManager.MakeInParam("@UpdateBy" ,SqlDbType.VarChar, 50, vehicle.UpdateBy)
                          
                        };

                dataManager.BeginTransaction();

                dataManager.ExecuteProc("UPDATE [Vehicles] SET [UserId]=@UserId,[HandOverDate]=@HandOverDate,[HandOverType]=@HandOverType,[LocationId]=@LocationId,[Status] = @Status,[UpdateDate] = GETDATE(), [UpdateBy] = @UpdateBy WHERE [VehicleId] = @VehicleId;INSERT INTO [Transactions]([UserId],[RegNo],[HandOverDate],[HandOverType],[LocationId],[Status],[CreateDate],[CreateBy])VALUES(@UserId,@RegNo,@HandOverDate,@HandOverType,@LocationId,@Status,GETDATE(),@UpdateBy);", parameters);

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
                query = "SELECT 0 AS [VehicleId], '[Select Vehicle]' AS [Vehicle] UNION SELECT [VehicleId], [RegNo] + ' - ' + CONVERT(VARCHAR, [RegDate], 103) + ' - ' + m.[ModelType] AS Vehicle FROM [Vehicles] v left outer join ModelType m on v.ModelTypeId=m.ModelTypeId WHERE [Status] = 'In Hand'";
            else
                query = "SELECT 0 AS [VehicleId], '[Select Vehicle]' AS [Vehicle] UNION SELECT [VehicleId], [RegNo] + ' - ' + CONVERT(VARCHAR, [RegDate], 103) + ' - ' + m.[ModelType] AS Vehicle FROM [Vehicles] v left outer join ModelType m on v.ModelTypeId=m.ModelTypeId WHERE ([Status] = 'In Hand' OR [VehicleId] = " + vehicleId.ToString() + ")";
            return dataManager.GetDataTable(query);
        }

        //public DataTable GetVehiclesAllData(int vehicleId)
        //{
        //    DataManager dataManager = new DataManager();
        //    string query = string.Empty;
        //    query = " SELECT VehicleId, RegNo, RegDate, ModelType, FuelType, Owner, SupplierName, SupplierAddress, VehicleType, PurchasePrice, EngineNo, ChechisNo, VehicleColor, EngineCapacity, TireSize, FitnessDate, TaxDate, InsuranceDate, RoadPermitDate, Remarks, Status, CreateDate, CreateBy, UpdateDate, UpdateBy FROM [Vehicles] WHERE [VehicleId] = " + vehicleId.ToString() + "";
        //    return dataManager.GetDataTable(query);
        //}

        public DataTable GetVehicleTable(string query)
        {
            DataManager dataManager = new DataManager();

            return dataManager.GetDataTable(query);
        }

       

        public DataSet GetSelectedVehicleData(int vehicleId)
        {
            string query = string.Empty;
            DataManager dataManager = new DataManager();
            query = "SELECT v.VehicleId, v.RegNo, CONVERT(varchar, v.RegDate, 101) AS RegDate, isnull(v.ModelTypeid,0) as ModelTypeId, v.FuelType, v.Owner,isnull(v.userid,0) AS UserName,CONVERT(varchar, v.HandOverDate, 101) AS HandOverDate, isnull(v.HandOverType,'0') as HandOverType, isnull(v.locationId,0) as LocationName, v.SupplierName, v.SupplierAddress, v.VehicleType, v.PurchasePrice,v.EngineNo, v.ChechisNo, v.VehicleColor, v.EngineCapacity, v.TireSize, CONVERT(varchar, v.FitnessDate, 101) AS FitnessDate, CONVERT(varchar, v.TaxDate, 101) AS TaxDate, CONVERT(varchar, v.InsuranceDate, 101) AS InsuranceDate, CONVERT(varchar, v.RoadPermitDate, 101) AS RoadPermitDate, v.Remarks, v.Status,v.CreateDate, v.CreateBy, v.UpdateDate, v.UpdateBy FROM Vehicles AS v  WHERE v.[VehicleId] = " + vehicleId.ToString() + ";";
            return dataManager.GetDataSet(query);
        }
    }
}