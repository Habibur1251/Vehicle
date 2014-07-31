using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleMaintenanceSystem
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Request.IsAuthenticated && Page.User.IsInRole("Admin"))
            {
          
            }
            else if (Request.IsAuthenticated && Page.User.IsInRole("Vehicle & Motorcycle Users"))
            {
                NavigationMenu.Items.RemoveAt(1);
                NavigationMenu.Items.RemoveAt(1);
               
            }
            else if (Request.IsAuthenticated && Page.User.IsInRole("Vehicle Users"))
            {
                NavigationMenu.Items.RemoveAt(1);
                NavigationMenu.Items.RemoveAt(1);
                NavigationMenu.Items.RemoveAt(3);

            }
            else if (Request.IsAuthenticated && Page.User.IsInRole("Motorcycle Users"))
            {
                NavigationMenu.Items.RemoveAt(1);
                NavigationMenu.Items.RemoveAt(1);
                NavigationMenu.Items.RemoveAt(2);

            }
            else
            {
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
                NavigationMenu.Items.RemoveAt(0);
            }
                
        }
    }
       
 }

