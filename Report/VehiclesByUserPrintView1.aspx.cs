using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleMaintenanceSystem.Manager;

namespace VehicleMaintenanceSystem.Report
{
    public partial class VehiclesByUserPrintView : System.Web.UI.Page
    {
        private int counter = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            VehicleManager vehicleManager = new VehicleManager();
            string query =Convert.ToString(Context.Session["vehicle_query"]);
            VehicleListGridView.DataSource = vehicleManager.GetVehicleTable(query);
            VehicleListGridView.DataBind();

            

        }

        protected void VehicleListGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                counter++;
                ((Label)e.Row.FindControl("SL")).Text = counter.ToString();
            }
        }
    }
}