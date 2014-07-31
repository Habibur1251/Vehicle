using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleMaintenanceSystem.Entity
{
    public class User
    {
        public int UserId
        {
            get;
            set;
        }
        public string UserCode
        {
            get;
            set;
        }
        public string UserName
        {
            get;
            set;
        }
        public string MobileNo
        {
            get;
            set;
        }

        public int CompanyId
        {
            get;
            set;
        }
        public int DepartmentId
        {
            get;
            set;
        }
        public int DesignationId
        {
            get;
            set;
        }

       
        public string CreateBy
        {
            get;
            set;
        }
        public string UpdateBy
        {
            get;
            set;
        }
    }
}