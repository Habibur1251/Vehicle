using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace VehicleMaintenanceSystem.Manager
{
    public class DefaultDataManager
    {
        public DataSet GetDefaultData()
        {
            DataManager dataManager = new DataManager();
            return dataManager.GetDataSet("");
        }
    }
}