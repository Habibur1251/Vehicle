using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleMaintenanceSystem.Manager;
using System.Data;

namespace VehicleMaintenanceSystem.Vehicle
{
    public partial class Motorcycle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetVehicle();
            }
        }
        
        protected void EditLinkButton_Click(object sender, EventArgs e)
        {

           
            LinkButton editLinkButton = sender as LinkButton;
            GridViewRow vehicleGridViewRow = (GridViewRow)editLinkButton.NamingContainer;

            VehicleId.Value = VehicleGridView.DataKeys[vehicleGridViewRow.DataItemIndex].Value.ToString();

            VehicleManager vehicleManager = new VehicleManager();

            DataSet dataSet = vehicleManager.GetSelectedVehicleData(Convert.ToInt32(VehicleGridView.DataKeys[vehicleGridViewRow.DataItemIndex].Value.ToString()));

            RegNo.Text = dataSet.Tables[0].Rows[0]["RegNo"].ToString();
            RegDate.Text = dataSet.Tables[0].Rows[0]["RegDate"].ToString();
            ModelTypeId.SelectedValue = dataSet.Tables[0].Rows[0]["ModelTypeId"].ToString();
            FuelType.SelectedValue = dataSet.Tables[0].Rows[0]["FuelType"].ToString();
            Owner.SelectedValue = dataSet.Tables[0].Rows[0]["Owner"].ToString();
            ddlUser.SelectedValue = dataSet.Tables[0].Rows[0]["UserName"].ToString();
            ddlUser.Enabled = dataSet.Tables[0].Rows[0]["UserName"].ToString()=="0"? true:false;
            VacantButton.Visible = dataSet.Tables[0].Rows[0]["UserName"].ToString() == "0" ? false : true;
            HandoverButton.Visible = dataSet.Tables[0].Rows[0]["UserName"].ToString() == "0" ? true : false;
            HandOverDate.Text = dataSet.Tables[0].Rows[0]["HandOverDate"].ToString();
            HandOverDate.Enabled = dataSet.Tables[0].Rows[0]["HandOverDate"].ToString() == string.Empty ? true : false;
            ddlHandOverType.SelectedValue = dataSet.Tables[0].Rows[0]["HandOverType"].ToString();
            ddlHandOverType.Enabled = dataSet.Tables[0].Rows[0]["HandOverType"].ToString() == "0" ? true : false;
            ddlLocationId.SelectedValue = dataSet.Tables[0].Rows[0]["LocationName"].ToString();
            ddlLocationId.Enabled = dataSet.Tables[0].Rows[0]["LocationName"].ToString() == "0" ? true : false;
            SupplierName.Text = dataSet.Tables[0].Rows[0]["SupplierName"].ToString();
            SupplierAddress.Text = dataSet.Tables[0].Rows[0]["SupplierAddress"].ToString();
            VehicleType.SelectedValue = dataSet.Tables[0].Rows[0]["VehicleType"].ToString();
            PurchasePrice.Text = dataSet.Tables[0].Rows[0]["PurchasePrice"].ToString();
            EngineNo.Text = dataSet.Tables[0].Rows[0]["EngineNo"].ToString();
            ChechisNo.Text = dataSet.Tables[0].Rows[0]["ChechisNo"].ToString();
            VehicleColor.Text = dataSet.Tables[0].Rows[0]["VehicleColor"].ToString();
            EngineCapacity.Text = dataSet.Tables[0].Rows[0]["EngineCapacity"].ToString();
            TireSize.Text = dataSet.Tables[0].Rows[0]["TireSize"].ToString();
            InsuranceDate.Text = dataSet.Tables[0].Rows[0]["InsuranceDate"].ToString();
            Remarks.Text = dataSet.Tables[0].Rows[0]["Remarks"].ToString();
            Status.SelectedValue = dataSet.Tables[0].Rows[0]["Status"].ToString();

                       
            RegNo.Focus();

            this.VehicleModalPopupExtender.Show();
        }

        protected void AddLinkButton_Click(object sender, EventArgs e)
        {
            VehicleType.Focus();
            VacantButton.Visible = false;
            HandoverButton.Visible = false;
            VehicleId.Value = string.Empty;
            RegNo.Text = string.Empty;
            RegDate.Text = DateTime.Now.Date.ToString();
            ModelTypeId.SelectedValue = "0";
            FuelType.SelectedValue = "0";
            Owner.SelectedValue = "0";
            ddlUser.SelectedValue = "0";
            ddlUser.Enabled = true;
            HandOverDate.Text = DateTime.Now.Date.ToString();
            HandOverDate.Enabled = true;
            ddlHandOverType.SelectedValue = "0";
            ddlHandOverType.Enabled = true;
            ddlLocationId.SelectedValue = "0";
            ddlLocationId.Enabled =  true ;
            SupplierName.Text = string.Empty;
            SupplierAddress.Text = string.Empty;
            VehicleType.SelectedValue = "Motorcycle";
            PurchasePrice.Text = "0.00";
            EngineNo.Text = string.Empty;
            ChechisNo.Text = string.Empty;
            VehicleColor.Text = string.Empty;
            EngineCapacity.Text = string.Empty;
            TireSize.Text = string.Empty;
           
            InsuranceDate.Text = DateTime.Now.Date.AddYears(1).ToString();
           
            Remarks.Text = string.Empty;
            Status.SelectedValue = "0";

            this.VehicleModalPopupExtender.Show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Entity.Vehicle vehicle = new Entity.Vehicle();
            
            vehicle.VehicleId = VehicleId.Value == string.Empty ? 0 : Convert.ToInt32(VehicleId.Value);
            vehicle.RegNo = RegNo.Text;
            vehicle.RegDate = Convert.ToDateTime(RegDate.Text);
            vehicle.ModelTypeId = Convert.ToInt32(ModelTypeId.SelectedValue);
            vehicle.FuelType = FuelType.SelectedValue;
            vehicle.Owner = Owner.SelectedValue;
            vehicle.UserId = Convert.ToInt32(ddlUser.SelectedValue);
            if (HandOverDate.Text != string.Empty)
            vehicle.HandOverDate = Convert.ToDateTime(HandOverDate.Text);

            vehicle.HandOverType = ddlHandOverType.Text;
            vehicle.LocationId = Convert.ToInt32(ddlLocationId.SelectedValue);
            vehicle.SupplierName = SupplierName.Text;
            vehicle.SupplierAddress = SupplierAddress.Text;
            vehicle.VehicleType = VehicleType.SelectedValue;
            
            vehicle.PurchasePrice = Convert.ToDecimal(PurchasePrice.Text);
            vehicle.EngineNo = EngineNo.Text;
            vehicle.ChechisNo = ChechisNo.Text;
            vehicle.VehicleColor = VehicleColor.Text;
            vehicle.EngineCapacity = EngineCapacity.Text;
            vehicle.TireSize = TireSize.Text;
            
            vehicle.InsuranceDate = InsuranceDate.Text == string.Empty ? DateTime.Now.Date.AddYears(1) : Convert.ToDateTime(InsuranceDate.Text);
            
            
            vehicle.Remarks = Remarks.Text;
            vehicle.Status = Status.SelectedValue;
            vehicle.CreateBy = (Page.User.Identity).Name;
            vehicle.UpdateBy = (Page.User.Identity).Name;

            VehicleManager vehicleManager = new VehicleManager();

            if (vehicle.VehicleId == 0)
                vehicleManager.SaveVehicle(vehicle);
            else
                vehicleManager.UpdateVehicle(vehicle);

                        
              GetVehicle();      
   
        }

        protected void VehicleGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string color = "";
                if (e.Row.Cells[7].Text == "Damaged")
                    color = "#898989"; // FFAA00
                else if (e.Row.Cells[7].Text == "In Hand")
                    color = "#FFFFFF";
                else if (e.Row.Cells[7].Text == "In Use")
                    color = "#E3E3E3";
                else if (e.Row.Cells[7].Text == "Sold to User")
                    color = "#CCCCCC";
                else if (e.Row.Cells[7].Text == "Sold to Customer")
                    color = "#ABABAB";
                else
                    color = "#FFFFFF";
                e.Row.BackColor = System.Drawing.Color.FromArgb(Int32.Parse(color.Replace("#", ""), System.Globalization.NumberStyles.HexNumber));
            }
        }

        protected void VacantButton_Click(object sender, EventArgs e)
        {

            Entity.Vehicle vehicle = new Entity.Vehicle();
            vehicle.VehicleId = VehicleId.Value == string.Empty ? 0 : Convert.ToInt32(VehicleId.Value);
            vehicle.RegNo = RegNo.Text;
            vehicle.RegDate = Convert.ToDateTime(RegDate.Text);
            vehicle.ModelTypeId = Convert.ToInt32(ModelTypeId.SelectedValue);
            vehicle.FuelType = FuelType.SelectedValue;
            vehicle.Owner = Owner.SelectedValue;
            vehicle.UserId = Convert.ToInt32(ddlUser.SelectedValue);
           
            vehicle.UpdateBy = (Page.User.Identity).Name;
            VehicleManager vehicleManager = new VehicleManager();


            if (vehicle.UserId != 0)
                if (vehicleManager.VacantVehicle(vehicle) == true)
                {
                    //ddlUser.SelectedValue = "0";
                    //ddlUser.Enabled = true;
                    //HandOverDate.Text = DateTime.Now.Date.ToString();
                    //HandOverDate.Enabled = true;
                    //ddlHandOverType.SelectedValue = "0";
                    //ddlHandOverType.Enabled = true;
                    //ddlLocationId.SelectedValue = "0";
                    //ddlLocationId.Enabled = true;
                    //VacantButton.Visible = true; 
                }
        }
        protected void HandoverButton_Click(object sender, EventArgs e)
        {

            Entity.Vehicle vehicle = new Entity.Vehicle();
            vehicle.VehicleId = VehicleId.Value == string.Empty ? 0 : Convert.ToInt32(VehicleId.Value);
            vehicle.RegNo = RegNo.Text;
            vehicle.UserId = Convert.ToInt32(ddlUser.SelectedValue);
            vehicle.HandOverDate = Convert.ToDateTime(HandOverDate.Text);
            vehicle.HandOverType = ddlHandOverType.Text;
            vehicle.LocationId = Convert.ToInt32(ddlLocationId.SelectedValue);
            vehicle.Status ="In Use";
            vehicle.UpdateBy = (Page.User.Identity).Name;
            VehicleManager vehicleManager = new VehicleManager();


            if (vehicle.UserId != 0 && vehicle.VehicleId !=0)
               vehicleManager.HandoverVehicle(vehicle);

               GetVehicle();         
                
        }

       
        private void GetVehicle()
        {

            string query = "SELECT v.[VehicleId], v.[RegNo], CONVERT(VARCHAR, v.[RegDate], 103) AS [RegDate], m.[ModelType] + ', '+ v.[FuelType] + ', '+ v.[Owner] as Vehicle, isnull(u.UserName+ ', '+ C.Alias,'')  as [UserInfo], v.[EngineNo], v.[ChechisNo], v.[VehicleColor], v.[EngineCapacity], v.[TireSize],   CONVERT(VARCHAR, v.[InsuranceDate], 103) AS [InsuranceDate], v.[Status] FROM [Vehicles] v left outer join [User] u on v.UserId=u.UserId left outer join Companies c on u.CompanyId=c.companyId left outer join [ModelType] m on v.ModelTypeId=m.ModelTypeId where v.VehicleType='Motorcycle'";

            string search = "";

            if (ddlFindModelType.SelectedValue != "")
            {
                search = txtFindRegNo.Text == string.Empty ? "" : " and upper(v.[RegNo]) like upper('%" + txtFindRegNo.Text + "%')";
                search = search + (ddlFindModelType.SelectedValue == "0" ? "" : " and v.ModelTypeId='" + ddlFindModelType.SelectedValue + "'");
                search = search + (ddlFindFuelType.SelectedValue == "0" ? "" : " and v.[FuelType]='" + ddlFindFuelType.Text + "'");
                search = search + (ddlFindOwner.SelectedValue == "0" ? "" : " and v.[Owner]='" + ddlFindOwner.SelectedValue + "'");
                search = search + (txtFindInsuranceDate.Text == "" ? "" : " and v.[InsuranceDate] between '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and '" + DateTime.Now.Date.AddDays(Convert.ToInt32(txtFindInsuranceDate.Text)).ToString("yyyy-MM-dd") + "'");
                search = search + (ddlFindStatus.SelectedValue == "0" ? "" : " and  v.[Status]='" + ddlFindStatus.SelectedValue + "'");
                search = search + (ddlFindUser.SelectedValue == "0" ? "" : " and  v.[UserId]='" + ddlFindUser.SelectedValue + "'");
                search = search + (ddlFindHandOverMonth.SelectedValue == "0" || txtFindHandOverYear.Text == "" ? "" : " and  year(v.HandOverDate)=" + txtFindHandOverYear.Text + " and month(v.HandOverDate)=" + ddlFindHandOverMonth.SelectedValue + "");
                search = search + (ddlFindHandOverType.SelectedValue == "0" ? "" : " and v.[HandOverType]='" + ddlFindHandOverType.Text + "'");
                search = search + (ddlFindLocationId.SelectedValue == "0" ? "" : " and  v.[LocationId]='" + ddlFindLocationId.SelectedValue + "'");

            }

            if (!search.Equals(string.Empty))
                query = query +  search ;

            query = query + " ORDER BY v.[RegDate] desc";

            VehicleManager vehicleManager = new VehicleManager();

            VehicleGridView.DataSource = vehicleManager.GetVehicleTable(query);
            VehicleGridView.DataBind();

            //txtSearch.Focus();
        }

       

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            this.AdvanceSearch_Modalpopupextender.Show();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
           GetVehicle();                        
        }

        protected void SearchCancelButton_Click(object sender, EventArgs e)
        {

        }
    }
}