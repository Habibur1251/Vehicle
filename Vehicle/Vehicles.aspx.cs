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
    public partial class Vehicles : System.Web.UI.Page
    {
         private int vehicle_type = 0;
         public string transaction_title = string.Empty;
         private string vehicle_type_desc = string.Empty; 
                 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Context.Request["vehicle_type"] != null || Context.Request["vehicle_type"].ToString().Trim() != string.Empty)
            {
                vehicle_type = System.Convert.ToInt32(Context.Request["vehicle_type"].ToString());
                if (vehicle_type == 1)
                {
                    lblPageTitle.Text = "VEHICLE   MANAGE";
                    vehicle_type_desc = "Vehicle";
                    VehicleType.Enabled = true;
                   
                }
                else
                {
                    lblPageTitle.Text = "MOTORCYCLE   MANAGE";
                    vehicle_type_desc = "Motorcycle";
                   
                    CheckBox23.Enabled = false;
                    CheckBox24.Enabled = false;
                    CheckBox26.Enabled = false;
                    CheckBox23.Checked = false;
                    CheckBox24.Checked = false;
                    CheckBox26.Checked = false;
                    CheckBox14.Checked = true;

                    txtFindFitnessDate.Enabled = false;
                    txtFindTaxDate.Enabled = false;
                    txtFindRoadPermitDate.Enabled = false;

                    FitnessDate.Enabled = false;
                    TaxDate.Enabled = false;
                    RoadPermitDate.Enabled = false;
                    VehicleType.Enabled = false;

                }
            }

            AddNewVehicleLinkbutton.Text = "Add New " + vehicle_type_desc + " (+)";
            Session["vehicle_type"] = vehicle_type_desc;
            
            if (!Page.IsPostBack)
            {
                
                GetVehicle();
            }
        }

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {

            transaction_title = "Edit " + vehicle_type_desc + " Form";
            //if (vehicle_type == 1)
            //{
                
            //    ddlHandOverType.Enabled = true;
            //}
            //else
            //{
                
            //    ddlHandOverType.Enabled = false;
            //}
           

            SettingPageConfig();

            GetVehicleModelType();   

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
            FitnessDate.Text = dataSet.Tables[0].Rows[0]["FitnessDate"].ToString();
            TaxDate.Text = dataSet.Tables[0].Rows[0]["TaxDate"].ToString();
            InsuranceDate.Text = dataSet.Tables[0].Rows[0]["InsuranceDate"].ToString();
            RoadPermitDate.Text = dataSet.Tables[0].Rows[0]["RoadPermitDate"].ToString();
            Remarks.Text = dataSet.Tables[0].Rows[0]["Remarks"].ToString();
            Status.SelectedValue = dataSet.Tables[0].Rows[0]["Status"].ToString();

            RegNo.Focus();

            this.VehicleModalPopupExtender.Show();
        }

        protected void AddNewVehicleLinkbutton_Click(object sender, EventArgs e)
        {

            lblMessege.Text = "";
            GetVehicleModelType();
            transaction_title = "Add New " + vehicle_type_desc + " Form";
            VehicleType.Focus();
            VacantButton.Visible = false;
            HandoverButton.Visible = false;
            VehicleId.Value = string.Empty;
            RegNo.Text = string.Empty;
            RegDate.Text = DateTime.Now.Date.ToString("MM/dd/yyyy");
            ModelTypeId.SelectedValue = "0";
            
            Owner.SelectedValue = "0";
            ddlUser.SelectedValue = "0";
            ddlUser.Enabled = true;
            HandOverDate.Text = DateTime.Now.Date.ToString("MM/dd/yyyy");
            HandOverDate.Enabled = true;
            
            ddlLocationId.SelectedValue = "0";
            ddlLocationId.Enabled =  true ;
            SupplierName.Text = string.Empty;
            SupplierAddress.Text = string.Empty;
           
            PurchasePrice.Text = "0.00";
            EngineNo.Text = string.Empty;
            ChechisNo.Text = string.Empty;
            VehicleColor.Text = string.Empty;
            EngineCapacity.Text = string.Empty;
            TireSize.Text = string.Empty;
            
            if (vehicle_type == 1)
            {
                FitnessDate.Text = DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy");
                TaxDate.Text = DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy");
                RoadPermitDate.Text = DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy");
                VehicleType.Items.Remove("Motorcycle");
                VehicleType.Enabled = true;
                ddlHandOverType.SelectedValue = "0";
                ddlHandOverType.Enabled = true;
                
            }
            else
            {
                FitnessDate.Text = string.Empty;
                TaxDate.Text = string.Empty;
                RoadPermitDate.Text = string.Empty;
                VehicleType.SelectedValue = "Motorcycle";
                VehicleType.Enabled = false;
                ddlHandOverType.SelectedValue = "Field Purpose";
                ddlHandOverType.Enabled = false;
               
            }


            InsuranceDate.Text = DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy");
            
            Remarks.Text = string.Empty;

            SettingPageConfig();
                        
            this.VehicleModalPopupExtender.Show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Entity.Vehicle vehicle = new Entity.Vehicle();
            
            vehicle.VehicleId = VehicleId.Value == string.Empty ? 0 : Convert.ToInt32(VehicleId.Value);
            vehicle.RegNo = RegNo.Text;
            vehicle.RegDate = RegDate.Text; // Convert.ToDateTime(RegDate.Text);
            vehicle.ModelTypeId = Convert.ToInt32(ModelTypeId.SelectedValue);
            vehicle.FuelType = FuelType.SelectedValue;
            vehicle.Owner = Owner.SelectedValue;
            vehicle.UserId = Convert.ToInt32(ddlUser.SelectedValue);
            if (HandOverDate.Text != string.Empty)
                vehicle.HandOverDate = HandOverDate.Text;// Convert.ToDateTime(HandOverDate.Text);

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
            vehicle.FitnessDate = FitnessDate.Text;
            vehicle.TaxDate = TaxDate.Text ;
            vehicle.InsuranceDate = InsuranceDate.Text;
            vehicle.RoadPermitDate = RoadPermitDate.Text;
            
            //vehicle.FitnessDate = FitnessDate.Text == string.Empty ? DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy") : Convert.ToDateTime(FitnessDate.Text);
            //vehicle.TaxDate = TaxDate.Text == string.Empty ? DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy") : Convert.ToDateTime(TaxDate.Text);
            //vehicle.InsuranceDate = InsuranceDate.Text == string.Empty ? DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy") : Convert.ToDateTime(InsuranceDate.Text);
            //vehicle.RoadPermitDate = RoadPermitDate.Text == string.Empty ? DateTime.Now.Date.AddYears(1).ToString("MM/dd/yyyy") : Convert.ToDateTime(RoadPermitDate.Text);
            
            vehicle.Remarks = Remarks.Text;
            vehicle.Status = Status.SelectedValue;
            vehicle.CreateBy = (Page.User.Identity).Name;
            vehicle.UpdateBy = (Page.User.Identity).Name;

            VehicleManager vehicleManager = new VehicleManager();

            if (vehicle.VehicleId == 0)
            {
                string isSave = vehicleManager.SaveVehicle(vehicle);
                if (!isSave.Contains("@yes@")) 
                {
                    lblMessege.Text = "Data not saved successfully for reasons of " + isSave;
                    this.VehicleModalPopupExtender.Show();
                }
            }

            else
            {
                string isSave = vehicleManager.UpdateVehicle(vehicle);
                if (!isSave.Contains("@yes@")) 
                {
                    lblMessege.Text = "Data not updated successfully for reasons of " + isSave;
                    this.VehicleModalPopupExtender.Show();
                }
            }


            
            GetVehicle();
        }

        protected void VehicleGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string color = "";
                if (e.Row.Cells[26].Text == "Damaged")
                    color = "#898989"; // FFAA00
                else if (e.Row.Cells[26].Text == "In Hand")
                    color = "#FFFFFF";
                else if (e.Row.Cells[26].Text == "In Use")
                    color = "#E3E3E3";
                else if (e.Row.Cells[26].Text == "Sold to User")
                    color = "#CCCCCC";
                else if (e.Row.Cells[26].Text == "Sold to Customer")
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
            vehicle.RegDate = RegDate.Text;// Convert.ToDateTime(RegDate.Text);
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

                GetVehicle();
        }
        protected void HandoverButton_Click(object sender, EventArgs e)
        {

            Entity.Vehicle vehicle = new Entity.Vehicle();
            vehicle.VehicleId = VehicleId.Value == string.Empty ? 0 : Convert.ToInt32(VehicleId.Value);
            vehicle.RegNo = RegNo.Text;
            vehicle.UserId = Convert.ToInt32(ddlUser.SelectedValue);
            vehicle.HandOverDate = HandOverDate.Text;// Convert.ToDateTime(HandOverDate.Text);
            vehicle.HandOverType = ddlHandOverType.Text;
            vehicle.LocationId = Convert.ToInt32(ddlLocationId.SelectedValue);
            vehicle.Status ="In Use";
            vehicle.UpdateBy = (Page.User.Identity).Name;
            VehicleManager vehicleManager = new VehicleManager();


            if (vehicle.UserId != 0 && vehicle.VehicleId !=0)
               vehicleManager.HandoverVehicle(vehicle);
            
               GetVehicle();
                
        }

        protected void SearchLinkButton_Click(object sender, EventArgs e)
        {
            transaction_title = "Advance Search Filter for " + vehicle_type_desc + " Form";
            GetVehicleModelType();            
            this.AdvanceSearch_Modalpopupextender.Show();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
       
            GetVehicle();

        }

        protected void SearchCancelButton_Click(object sender, EventArgs e)
        {

        }

        private void GetVehicle()
        {

            string query = "SELECT v.VehicleId, v.RegNo, CONVERT(VARCHAR, v.RegDate, 6) AS RegDate, isnull(v.VehicleType,'') as VehicleType, isnull(m.ModelType,'') as ModelType, isnull(v.FuelType,'') as FuelType ,isnull(v.Owner,'') AS VehicleOwner, isnull(v.SupplierName,'')  as SupplierName, isnull(v.SupplierAddress,'') as SupplierAddress,isnull(v.PurchasePrice,0) as PurchasePrice, ISNULL(u.UserName, '') + ' [' + ISNULL(u.UserCode, '') + ']' AS UserName,ISNULL(u.MobileNo, '') AS MobileNo, ISNULL(dg.DesignationName, '') AS DesignationName,ISNULL(dp.DepartmentName, '') AS DepartmentName, ISNULL(l.LocationName, '') as LocationName, CONVERT(VARCHAR, v.HandOverDate, 6) AS HandOverDate, isnull(v.HandOverType,'') as HandOverType,isnull(c.Alias,'') AS UserCompany,isnull(v.EngineNo,'') AS EngineNo, isnull(v.ChechisNo,'') AS ChechisNo, isnull(v.VehicleColor,'') AS VehicleColor, isnull(v.EngineCapacity,'') as EngineCapacity, isnull(v.TireSize,'') as TireSize, CONVERT(VARCHAR,v.FitnessDate, 6) AS FitnessDate, CONVERT(VARCHAR, v.TaxDate, 6) AS TaxDate, CONVERT(VARCHAR, v.InsuranceDate, 6) AS InsuranceDate, CONVERT(VARCHAR, v.RoadPermitDate, 6) AS RoadPermitDate, v.Status FROM Locations AS l RIGHT OUTER JOIN  Vehicles AS v ON l.LocationId = v.LocationId LEFT OUTER JOIN Departments AS dp RIGHT OUTER JOIN [User] AS u ON dp.DepartmentId = u.DepartmentId LEFT OUTER JOIN Designations AS dg ON u.DesignationId = dg.DesignationId ON v.UserId = u.UserId LEFT OUTER JOIN Companies AS c ON u.CompanyId = c.CompanyId LEFT OUTER JOIN ModelType AS m ON v.ModelTypeId = m.ModelTypeId ";
           
            if (vehicle_type == 1)
            {
                query = query + " where v.VehicleType<>'Motorcycle'";
            }
            else
            {
                query = query + " where v.VehicleType='Motorcycle'";
            }

            string search = "";
            if (ddlFindModelType.SelectedValue != "")
            {
                search = txtFindRegNo.Text == string.Empty ? "" : " and upper(v.[RegNo]) like upper('%" + txtFindRegNo.Text + "%')";
                search = search + (ddlFindModelType.SelectedValue == "0" ? "" : " and v.ModelTypeId='" + ddlFindModelType.SelectedValue + "'");
                search = search + (ddlFindFuelType.SelectedValue == "0" ? "" : " and v.[FuelType]='" + ddlFindFuelType.Text + "'");
                search = search + (ddlFindOwner.SelectedValue == "0" ? "" : " and v.[Owner]='" + ddlFindOwner.SelectedValue + "'");
                search = search + (txtFindSearch.Text == "" ? "" : " and v.[Remarks] LIKE '%" + txtFindSearch.Text + "%'");
                search = search + (txtFindFitnessDate.Text == "" ? "" : " and v.[FitnessDate] between '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and '" + DateTime.Now.Date.AddDays(Convert.ToInt32(txtFindFitnessDate.Text)).ToString("yyyy-MM-dd") + "'");
                search = search + (txtFindFitnessDateFrom.Text == "" ? "" : " and v.[FitnessDate] between '" + txtFindFitnessDateFrom.Text + "' and '" + txtFindFitnessDateTo.Text + "'");
                search = search + (txtFindInsuranceDate.Text == "" ? "" : " and v.[InsuranceDate] between '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and '" + DateTime.Now.Date.AddDays(Convert.ToInt32(txtFindInsuranceDate.Text)).ToString("yyyy-MM-dd") + "'");
                search = search + (txtFindInsuranceDateFrom.Text == "" ? "" : " and v.[InsuranceDate] between '" + txtFindInsuranceDateFrom.Text + "' and '" + txtFindInsuranceDateTo.Text + "'");
                search = search + (txtFindRoadPermitDate.Text == "" ? "" : " and v.[RoadPermitDate] between '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and '" + DateTime.Now.Date.AddDays(Convert.ToInt32(txtFindRoadPermitDate.Text)).ToString("yyyy-MM-dd") + "'");
                search = search + (txtFindRoadPermitDateFrom.Text == "" ? "" : " and v.[RoadPermitDate] between '" + txtFindRoadPermitDateFrom.Text + "' and '" + txtFindRoadPermitDateTo.Text + "'");
                search = search + (txtFindTaxDate.Text == "" ? "" : " and v.[TaxDate] between '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and '" + DateTime.Now.Date.AddDays(Convert.ToInt32(txtFindTaxDate.Text)).ToString("yyyy-MM-dd") + "'");
                search = search + (txtFindTaxDateFrom.Text == "" ? "" : " and v.[TaxDate] between '" + txtFindTaxDateFrom.Text + "' and '" + txtFindTaxDateTo.Text + "'");
                search = search + (ddlFindStatus.SelectedValue == "0" ? "" : " and  v.[Status]='" + ddlFindStatus.SelectedValue + "'");
                search = search + (ddlFindUser.SelectedValue == "0" ? "" : " and  v.[UserId]='" + ddlFindUser.SelectedValue + "'");
                search = search + (ddlFindHandOverMonth.SelectedValue == "0" || txtFindHandOverYear.Text == "" ? "" : " and  year(v.HandOverDate)=" + txtFindHandOverYear.Text + " and month(v.HandOverDate)=" + ddlFindHandOverMonth.SelectedValue + "");
                search = search + (ddlFindHandOverType.SelectedValue == "0" ? "" : " and v.[HandOverType]='" + ddlFindHandOverType.Text + "'");
                search = search + (ddlFindLocationId.SelectedValue == "0" ? "" : " and  v.[LocationId]='" + ddlFindLocationId.SelectedValue + "'");
            }
            
            
            if (!search.Equals(string.Empty))
                query = query + search;

           // query = query + " ORDER BY v.[RegDate] desc";

            VehicleManager vehicleManager = new VehicleManager();

            VehicleGridView.DataSource = vehicleManager.GetVehicleTable(query);
            VehicleGridView.DataBind();

            Session["vehicle_query"] = query;
            GridConfig();
            
            
            //txtSearch.Focus();
        }

        private void GetVehicleModelType()
        {
            
           string sql_vehicle_model = "SELECT 0 AS [ModelTypeId], '[Select Model Type]' AS [ModelType] UNION SELECT  ModelTypeId, ModelType FROM [ModelType] where VehicleType="+ vehicle_type  ;
            
            VehicleManager vehicleManager = new VehicleManager();

            ddlFindModelType.DataSource = vehicleManager.GetVehicleTable(sql_vehicle_model);
            ddlFindModelType.DataBind();
            ModelTypeId.DataSource = vehicleManager.GetVehicleTable(sql_vehicle_model);
            ModelTypeId.DataBind();
            
        }



        protected void GridConfigLinkButton_Click(object sender, EventArgs e)
        {
            this.GridConfig_Modalpopupextender.Show();
            
            CheckBox chkbox;
            
            chkbox=(CheckBox)GridConfig_Modalpopupextender.FindControl("CheckBox");

            for (int i = 1; i <= 27; i++)
            {

                chkbox = (CheckBox)GridConfig_Modalpopupextender.FindControl("CheckBox"+i.ToString());
                chkbox.Checked = VehicleGridView.Columns[i-1].Visible;
                
            }
                       
        }

        protected void DisplaySettingButton_Click(object sender, EventArgs e)
        {
            GridConfig();
           
        }

        private void GridConfig()
       
        {
            Boolean[] GridConfiglist = new Boolean[27];

            CheckBox chkbox;

            chkbox = (CheckBox)GridConfig_Modalpopupextender.FindControl("CheckBox");

            for (int i = 1; i <= 27; i++)
            {

                chkbox = (CheckBox)GridConfig_Modalpopupextender.FindControl("CheckBox" + i.ToString());
                VehicleGridView.Columns[i - 1].Visible = chkbox.Checked;
                GridConfiglist[i - 1] = chkbox.Checked;

            }

            Session["grid_array"] = GridConfiglist;
             

        }

        private void SettingPageConfig()
        {
            if (vehicle_type == 1)
            {
                VehicleType.Items.Remove("Motorcycle");
                FuelType.SelectedValue = "0";
                FuelType.Enabled = true;
                ddlFindHandOverType.SelectedValue = "0";
                ddlFindHandOverType.Enabled = true;
            }
            else
            {
               
                FuelType.SelectedValue = "Petrol";
                FuelType.Enabled = false;
                ddlFindHandOverType.SelectedValue = "Field Purpose";
                ddlFindHandOverType.Enabled = false;
            }

        }

        protected void DisplaySettingCloseButton_Click(object sender, EventArgs e)
        {

        }

        protected void HistoryLinkButton_Click(object sender, EventArgs e)
        {
            Session["page_type"] = "vehicle";
            LinkButton editLinkButton = sender as LinkButton;
            GridViewRow vehicleGridViewRow = (GridViewRow)editLinkButton.NamingContainer;

            VehicleId.Value = VehicleGridView.DataKeys[vehicleGridViewRow.DataItemIndex].Value.ToString();
                        
            Response.Redirect("~/Vehicle/VehicleHistory.aspx?vehicle_id=" + VehicleId.Value );
        }

        protected void VehicleGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ShowAdvanceSearchPopupButton_Click(object sender, EventArgs e)
        {

        }

        //protected void ddlUser_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Status.SelectedValue = ddlUser.SelectedValue == "0" ? "0" : "In Use"; 
        //}

       
       
    }
}