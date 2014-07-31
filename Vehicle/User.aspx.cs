using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleMaintenanceSystem.Manager;
using System.Collections;

namespace VehicleMaintenanceSystem.Vehicle
{
    public partial class User : System.Web.UI.Page
    {
        
      
        
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["vehicle_type"] = "Vehicle & Motorcycle"; 

        }

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton editLinkButton = sender as LinkButton;
            GridViewRow vehicleGridViewRow = (GridViewRow)editLinkButton.NamingContainer;
           
            UserId.Value = VehicleGridView.DataKeys[vehicleGridViewRow.DataItemIndex].Value.ToString();
            UserCode.Text = vehicleGridViewRow.Cells[0].Text;
            UserName.Text = vehicleGridViewRow.Cells[1].Text;
            MobileNo.Text = vehicleGridViewRow.Cells[2].Text;
            ddlDesignation.SelectedValue = ddlDesignation.Items.FindByText(vehicleGridViewRow.Cells[3].Text).Value;
            ddlDepartment.SelectedValue = ddlDepartment.Items.FindByText(vehicleGridViewRow.Cells[4].Text).Value;
            ddlCompany.SelectedValue = ddlCompany.Items.FindByText(vehicleGridViewRow.Cells[5].Text).Value; 

            UserCode.Focus();

            this.VehicleUserModalPopupExtender.Show();
        }

        protected void AddLinkButton_Click(object sender, EventArgs e)
        {

            
            UserId.Value = string.Empty;
            UserCode.Text = "";
            UserName.Text = "";
            MobileNo.Text = "";
            ddlDesignation.SelectedValue = "0";
            ddlDepartment.SelectedValue = "0";
            ddlCompany.SelectedValue = "0";
            UserCode.Focus();
            
            

            this.VehicleUserModalPopupExtender.Show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Entity.User User = new Entity.User();

            User.UserId = UserId.Value == string.Empty ? 0 : Convert.ToInt32(UserId.Value);
            User.UserCode = UserCode.Text;
            User.UserName = UserName.Text;
            User.MobileNo = MobileNo.Text;
            User.CompanyId =Convert.ToInt32(ddlCompany.SelectedValue);
            User.DepartmentId = Convert.ToInt32(ddlDepartment.SelectedValue);
            User.DesignationId = Convert.ToInt32(ddlDesignation.SelectedValue);
           
            User.CreateBy = (Page.User.Identity).Name;
            User.UpdateBy = (Page.User.Identity).Name;

            UserManager vehicleUserManager = new UserManager();

            if (User.UserId == 0)
                vehicleUserManager.SaveVehicleUser(User);
            else
                vehicleUserManager.UpdateVehicleUser(User);

            VehicleGridView.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

           // gridcol = false;
            
            VehicleGridView.Columns[0].Visible = false;
            //VehicleGridView.FindControl("TextBox1").Visible=false ;
            //TextBox FullName = TextBox();
            //FullName = ((TextBox)VehicleGridView.FindControl("TextBox1"));
           
 
           
        }

        protected void HistoryLinkButton_Click(object sender, EventArgs e)
        {

            Session["page_type"] = "user";

            LinkButton editLinkButton = sender as LinkButton;
            GridViewRow vehicleGridViewRow = (GridViewRow)editLinkButton.NamingContainer;

           string  Userid = VehicleGridView.DataKeys[vehicleGridViewRow.DataItemIndex].Value.ToString();

           Response.Redirect("~/Vehicle/VehicleHistory.aspx?vehicle_id=" + Userid);
        }

        

        //protected void VehicleGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        string color = "";
        //        if (e.Row.Cells[19].Text == "Damaged")
        //            color = "#FED0D0"; // FFAA00
        //        else if (e.Row.Cells[19].Text == "In Hand")
        //            color = "#D4FF00";
        //        else if (e.Row.Cells[19].Text == "In Use")
        //            color = "#AAFFFF";
        //        else if (e.Row.Cells[19].Text == "Sold to User")
        //            color = "#FFD4FF";
        //        else if (e.Row.Cells[19].Text == "Sold to Customer")
        //            color = "#FFAA00";
        //        else
        //            color = "#FFFFFF";
        //        e.Row.BackColor = System.Drawing.Color.FromArgb(Int32.Parse(color.Replace("#", ""), System.Globalization.NumberStyles.HexNumber));
        //    }
        //}
    }
}