//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleMaintenanceSystem.Manager;
using System.Data;

namespace VehicleMaintenanceSystem.Report
{
    public partial class VehiclesByUser : System.Web.UI.Page
    {
        private int counter = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void VehicleListGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                counter++;
                ((Label)e.Row.FindControl("SL")).Text = counter.ToString();
            }
        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            this.GridConfig_Modalpopupextender.Show();
        }

        protected void Linkbutton1_Click(object sender, EventArgs e)
        {

        }

       

       
    }
}