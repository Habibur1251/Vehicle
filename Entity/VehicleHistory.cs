using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleMaintenanceSystem.Entity
{
    public class VehicleHistory
    {
        public long TransactionId
        {
            get;
            set;
        }
        public int UserId
        {
            get;
            set;
        }
        public int VehicleId
        {
            get;
            set;
        }
        public DateTime HandOverDate
        {
            get;
            set;
        }
        public DateTime ToDate
        {
            get;
            set;
        }
        public string HandOverType
        {
            get;
            set;
        }
        public int LocationId
        {
            get;
            set;
        }
        public string Status
        {
            get;
            set;
        }
        public int PreviousVehicleId
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