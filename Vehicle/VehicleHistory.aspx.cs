using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleMaintenanceSystem.Manager;

namespace VehicleMaintenanceSystem.Vehicle
{
    public partial class VehicleHistory : System.Web.UI.Page
    {
        
        public string vehicle_id=string.Empty ; 
        
        private int PreviousVehicleId
        {
            get { return Convert.ToInt32(ViewState["PreviousVehicleId"]); }
            set { ViewState["PreviousVehicleId"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            lblReportTitle.Text = Convert.ToString(Context.Session["vehicle_type"]).ToUpper() + " HISTORY MANAGEMENT";
            
            string page_type=Convert.ToString(Session["page_type"]);
            vehicle_id = Context.Request["vehicle_id"].ToString();

            string sql_vehicle_history = string.Empty; 

            if (page_type == "user")
            {
                sql_vehicle_history = "SELECT t.TransactionId, v.VehicleId,   vu.UserName + ',  ' + g.DesignationName + ',  ' + d.DepartmentName + ' (' + c.Alias + ')'  as UserName, v.RegNo, CONVERT(VARCHAR, t.HandOverDate, 103) AS HandOverDate, CONVERT(VARCHAR, t.ToDate, 103) AS ToDate,t.HandOverType, t.Status, t.LocationId, l.LocationName FROM Transactions AS t INNER JOIN [User] AS vu ON t.UserId = vu.UserId INNER JOIN Vehicles AS v ON t.RegNo = v.RegNo INNER JOIN Locations AS l ON t.LocationId = l.LocationId INNER JOIN Departments AS d ON vu.DepartmentId = d.DepartmentId INNER JOIN Designations AS g ON vu.DesignationId = g.DesignationId INNER JOIN Companies AS c ON vu.CompanyId = c.CompanyId where vu.UserId=" + vehicle_id + " Order by vu.UserName, CONVERT(VARCHAR, t.HandOverDate, 102) desc";
            }
            else
            {
                 sql_vehicle_history = "SELECT t.TransactionId, v.VehicleId,   vu.UserName + ',  ' + g.DesignationName + ',  ' + d.DepartmentName + ' (' + c.Alias + ')'  as UserName, v.RegNo, CONVERT(VARCHAR, t.HandOverDate, 103) AS HandOverDate, CONVERT(VARCHAR, t.ToDate, 103) AS ToDate,t.HandOverType, t.Status, t.LocationId, l.LocationName FROM Transactions AS t INNER JOIN [User] AS vu ON t.UserId = vu.UserId INNER JOIN Vehicles AS v ON t.RegNo = v.RegNo INNER JOIN Locations AS l ON t.LocationId = l.LocationId INNER JOIN Departments AS d ON vu.DepartmentId = d.DepartmentId INNER JOIN Designations AS g ON vu.DesignationId = g.DesignationId INNER JOIN Companies AS c ON vu.CompanyId = c.CompanyId where v.VehicleId=" + vehicle_id + " Order by vu.UserName, CONVERT(VARCHAR, t.HandOverDate, 102) desc";
            }

                VehicleManager vehicleManager = new VehicleManager();

                TransactionGridView.DataSource = vehicleManager.GetVehicleTable(sql_vehicle_history);
                TransactionGridView.DataBind();
                
           
        }

       

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton editLinkButton = sender as LinkButton;
            GridViewRow transactionGridViewRow = (GridViewRow)editLinkButton.NamingContainer;
            txtTile.Text = "Edit Vehicle Allocation/Reallocation";
            TransactionId.Value = TransactionGridView.DataKeys[transactionGridViewRow.DataItemIndex].Values[0].ToString();
            string vehicleId = TransactionGridView.DataKeys[transactionGridViewRow.DataItemIndex].Values[1].ToString();

            Manager.VehicleManager vehicleManager = new Manager.VehicleManager();

            VehicleId.DataSource = vehicleManager.GetVehicles(Convert.ToInt32(vehicleId));
            VehicleId.DataBind();

            VehicleId.SelectedValue = vehicleId;
            this.PreviousVehicleId = Convert.ToInt32(vehicleId);

            ddlUser.SelectedValue = ddlUser.Items.FindByText(transactionGridViewRow.Cells[1].Text).Value;

            HandOverDate.Text = Convert.ToDateTime(transactionGridViewRow.Cells[2].Text).ToString();
            HandOverDate.Enabled = true;
            trToDate.Visible = true;
            ToDate.Text = transactionGridViewRow.Cells[3].Text;

            HandOverType.SelectedValue = transactionGridViewRow.Cells[4].Text;
            HandOverType.Enabled = true;
            LocationId.SelectedValue = LocationId.Items.FindByText(transactionGridViewRow.Cells[5].Text).Value;
            Status.SelectedValue = transactionGridViewRow.Cells[6].Text;

            ddlUser.Focus();
            this.TransactionModalPopupExtender.Show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Entity.VehicleHistory VehicleHistory = new Entity.VehicleHistory();

            VehicleHistory.TransactionId = TransactionId.Value == "0" ? 0 : Convert.ToInt64(TransactionId.Value);
            VehicleHistory.UserId = Convert.ToInt32(ddlUser.SelectedValue);
            VehicleHistory.VehicleId = Convert.ToInt32(VehicleId.SelectedValue);
            VehicleHistory.HandOverDate = Convert.ToDateTime(HandOverDate.Text);

            if (ToDate.Text != string.Empty)
                VehicleHistory.ToDate = Convert.ToDateTime(ToDate.Text);
            
            VehicleHistory.HandOverType = HandOverType.SelectedValue;
            VehicleHistory.LocationId = Convert.ToInt32(LocationId.SelectedValue);
            VehicleHistory.Status = Status.SelectedValue;

            VehicleHistoryManager VehicleHistoryManager = new VehicleHistoryManager();

            if (VehicleHistory.TransactionId == 0)
            {
                VehicleHistory.CreateBy = (Page.User.Identity).Name;
                VehicleHistoryManager.SaveTransaction(VehicleHistory);
            }
            else
            {
                VehicleHistory.PreviousVehicleId = this.PreviousVehicleId;

                VehicleHistory.UpdateBy = (Page.User.Identity).Name;
                VehicleHistoryManager.UpdateTransaction(VehicleHistory);
            }
            
            TransactionGridView.DataBind();
        }

        protected void TransactionGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string color = "";
                if (e.Row.Cells[6].Text == "In Hand")
                    color = "#D4FF00";
                else if (e.Row.Cells[6].Text == "In Use")
                    color = "#AAFFFF";
                else if (e.Row.Cells[6].Text == "Sold to User")
                    color = "#FFD4FF";
                else if (e.Row.Cells[6].Text == "Sold to Customer")
                    color = "#FFAA00";
                else
                    color = "#FFFFFF";
                e.Row.BackColor = System.Drawing.Color.FromArgb(Int32.Parse(color.Replace("#", ""), System.Globalization.NumberStyles.HexNumber));
            }
        }

       
    }
}