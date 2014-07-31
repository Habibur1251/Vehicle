using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Payroll.BO;
using Ease.CoreV35.Model;
using HR.WEB.BO;

namespace HR.WEB.UI
{
    public partial class PaymentRequisition : System.Web.UI.Page
    {
        private ObjectsTemplate<Vendor> _oVendors = null;
        private Requisition _oRequisition = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            ObjectsTemplate<Requisition> orequisitions = Requisition.GetForLManDH(SessionManager.CurrentEmployee);
            if (!IsPostBack)
            {
                RefreshControls();
                txtEmployee.Text = SessionManager.CurrentEmployee.Name;
                dtpFromDate.SelectedDate = DateTime.Today;
                dtpToDate.SelectedDate = DateTime.Today;
                LoadBalanceGrid();

                //if (Session["RunScriptOnLoad"] != null)
                //{
                //    bool check = (bool)Session["RunScriptOnLoad"];
                //    Session["RunScriptOnLoad"] = null;
                //    if (check)
                //        ScriptManager.RegisterStartupScript(this, this.GetType(), "startScript", "ShowMessage('Requisition Submition Successfull !');", true);
                //}
            }
        }

        private void FillRequisitionFor()
        { 
            cmbRequisitionfor.Items.Clear();
            cmbRequisitionfor.DataSource=Enum.GetValues(typeof(EnumRequisitionFor)).Cast<EnumRequisitionFor>().Select(ex=> new{Text = ex.ToString(),Value =(int)ex});
            cmbRequisitionfor.DataTextField="Text";
            cmbRequisitionfor.DataValueField="Value";
            cmbRequisitionfor.DataBind();

        }
        private void FillVendor()
        {
            _oVendors = new ObjectsTemplate<Vendor>();
            _oVendors = Vendor.Get();
            cmbParty.Items.Clear();
            cmbParty.DataSource = _oVendors;
            cmbParty.DataTextField = "Name";
            cmbParty.DataValueField = "ID";
            cmbParty.DataBind();
        }

        private void LoadBalanceGrid()
        {
            DataSet balance = null;
            balance = Requisition.GetForBalanceStatus(SessionManager.CurrentEmployee.ID.Integer);
            //Label lbl = (Label)e.Item.FindControl("lblTotal");
            rdgBalanceStatus.DataSource = balance.Tables[0];
            rdgBalanceStatus.DataBind();
            double total = 0;
            foreach (DataRow req in balance.Tables[0].Rows)
            {
                total += Convert.ToDouble(req["Amount"]);

            }
            lblTotal.Text = total.ToString() + " ( " + Ease.CoreV35.Utility.Global.NumericFunctions.TakaWords(total) + " )";
        }

        private void LoadAppliiedReqGrid(DateTime fromDate, DateTime toDate)
        {
            if (fromDate <= toDate)
            {
                DataSet requisitions = null;
                requisitions = Requisition.GetReqByDate(SessionManager.CurrentEmployee.ID.Integer, fromDate, toDate);
                rdgAppliedRequisition.DataSource = requisitions.Tables[0];
                rdgAppliedRequisition.DataBind();
                lblCountSearch.Text = requisitions.Tables[0].Rows.Count.ToString();
                double total = 0;
                foreach (DataRow req in requisitions.Tables[0].Rows)
                {
                    total += Convert.ToDouble(req["Amount"]);

                }
                lblTotalAmountSearch.Text = total.ToString() + " ( " + Ease.CoreV35.Utility.Global.NumericFunctions.TakaWords(total) + " )";
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "startScript", "ShowMessage('To Date Can Not be Lower than From Date !');", true);
            }
        }

        private void RefreshObject()
        {
            _oRequisition = new Requisition();

            _oRequisition.RequisitionNo = Requisition.GetNextReqNo(DateTime.Now.Day.ToString("00")+DateTime.Now.Month.ToString("00")+DateTime.Now.ToString("yy")+"%");
            _oRequisition.Amount = Convert.ToDouble(numRequisitionAmount.Text);
            _oRequisition.ChallanNo = txtChallanNo.Text;
            _oRequisition.Purpose = txtPurpose.Text;
            _oRequisition.RequisitionDate = DateTime.Now;
            _oRequisition.WIP=EnumWIP.LM;
            _oRequisition.RequisitionFor = (EnumRequisitionFor)(Convert.ToUInt32(cmbRequisitionfor.SelectedValue));
            _oRequisition.EmployeeID = SessionManager.CurrentEmployee.ID.Integer;
            _oRequisition.CreatedBy = SessionManager.LoinUser.ID;
            _oRequisition.PaymentMode = EnumPaymentMode.Not_Selected;
        }
        private void RefreshControls()
        {
            FillRequisitionFor();
            FillVendor();
            txtChallanNo.Text = string.Empty;
            txtPurpose.Text = string.Empty;
            numRequisitionAmount.Text = string.Empty;

        }
        protected void btnApply_Click(object sender, EventArgs e)
        {
            try
            {

                RefreshObject();
                _oRequisition.Save();
                Session["RunScriptOnLoad"] = true;
                LoadBalanceGrid();
                RefreshControls();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "startScript", "ShowMessage('Requisition Submition Successfull !');", true);
               // Response.Redirect("~/Requisition/PaymentRequisition.aspx",false);
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadAppliiedReqGrid((DateTime)dtpFromDate.SelectedDate, (DateTime)dtpToDate.SelectedDate);
        }

    }
}