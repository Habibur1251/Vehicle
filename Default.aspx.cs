using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleMaintenanceSystem
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Request.IsAuthenticated == false)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
            else
            {

                if (Request.QueryString["register"] == null)
                {
                    MessageLabel.Text = "Welcome to Vehicle Management System!";
                    
                }
                else
                {
                    if (Request.QueryString["register"] == "success")
                    {
                        MessageLabel.Text = "User Registered Successfully.";

                    }
                    else
                    {
                        MessageLabel.Text = "Failed to Register.";

                    }
                }
            }
        }
    }
}
