using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleMaintenanceSystem.Entity
{
    public class VehicleModelType
    {
        public int ModelTypeId
        {
            get;
            set;
        }
        public string ModelType
        {
            get;
            set;
        }
        public int VehicleType
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