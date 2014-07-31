using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class ProfileManager
    {
        public bool SaveProfile(Guid userId, string fullName, int companyId, int departmentId, int designationId)
        {
            DataManager dataManager = new DataManager();

            bool isExecuted = false;
            try
            {
                SqlParameter[] parameters =
                        {                     
                            dataManager.MakeInParam("@UserId" ,SqlDbType.UniqueIdentifier, 0, userId),
                            dataManager.MakeInParam("@FullName" ,SqlDbType.VarChar, 50, fullName),
                            dataManager.MakeInParam("@CompanyId" ,SqlDbType.Int, 0, companyId),
                            dataManager.MakeInParam("@DepartmentId" ,SqlDbType.Int,0, departmentId),
                            dataManager.MakeInParam("@DesignationId" ,SqlDbType.Int, 0, designationId)
                            
                        };

                dataManager.BeginTransaction();
                dataManager.ExecuteProc("INSERT INTO UserProfiles (UserId,FullName,CompanyId,DepartmentId,DesignationId) VALUES (@UserId,@FullName,@CompanyId,@DepartmentId,@DesignationId);", parameters);
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