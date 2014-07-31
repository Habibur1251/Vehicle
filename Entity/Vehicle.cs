using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VehicleMaintenanceSystem.Entity
{
    public class Vehicle
    {
        public int VehicleId
        {
            get;
            set;
        }
        public string RegNo
        {
            get;
            set;
        }
        public string RegDate
        {
            get;
            set;
        }
        public int ModelTypeId
        {
            get;
            set;
        }
        public string FuelType
        {
            get;
            set;
        }
        public string Owner
        {
            get;
            set;
        }
        public int UserId
        {
            get;
            set;
        }

        public string HandOverDate
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

        public string SupplierName
        {
            get;
            set;
        }
        public string SupplierAddress
        {
            get;
            set;
        }
        public string VehicleType
        {
            get;
            set;
        }
        public decimal PurchasePrice
        {
            get;
            set;
        }
        public string EngineNo
        {
            get;
            set;
        }
        public string ChechisNo
        {
            get;
            set;
        }
        public string VehicleColor
        {
            get;
            set;
        }
        public string EngineCapacity
        {
            get;
            set;
        }
        public string TireSize
        {
            get;
            set;
        }
        public string FitnessDate
        {
            get;
            set;
        }
        public string TaxDate
        {
            get;
            set;
        }
        public string InsuranceDate
        {
            get;
            set;
        }
        public string RoadPermitDate
        {
            get;
            set;
        }
        public string Remarks
        {
            get;
            set;
        }
        public string Status
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