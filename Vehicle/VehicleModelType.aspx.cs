using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VehicleMaintenanceSystem.Manager;

namespace VehicleMaintenanceSystem.Vehicle
{
    public partial class VehicleModelType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void EditLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton editLinkButton = sender as LinkButton;
            GridViewRow vehicleGridViewRow = (GridViewRow)editLinkButton.NamingContainer;

            //ModelTypeId.Value = VehicleGridView.DataKeys[vehicleGridViewRow.DataItemIndex].Value.ToString();
            ModelTypeId.Value = vehicleGridViewRow.Cells[0].Text;
            ModelType.Text = vehicleGridViewRow.Cells[1].Text;
            ddlVehicleType.SelectedValue = vehicleGridViewRow.Cells[2].Text=="Vehicle"? "1":"2";


            ModelType.Focus();

            this.VehicleUserModalPopupExtender.Show();
        }

        protected void AddLinkButton_Click(object sender, EventArgs e)
        {


            ModelTypeId.Value = string.Empty;
            ModelType.Text = "";
            ddlVehicleType.SelectedValue = "0";
            
            ModelType.Focus();
            
            

            this.VehicleUserModalPopupExtender.Show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            Entity.VehicleModelType Model = new Entity.VehicleModelType();

            Model.ModelTypeId = ModelTypeId.Value == string.Empty ? 0 : Convert.ToInt32(ModelTypeId.Value);
            Model.ModelType = ModelType.Text;
            Model.VehicleType = System.Convert.ToInt32(ddlVehicleType.SelectedValue);


            Model.CreateBy = (Page.User.Identity).Name;
            Model.UpdateBy = (Page.User.Identity).Name;

            VehicleModelManager ModelManager = new VehicleModelManager();

            if (Model.ModelTypeId == 0)
                ModelManager.SaveModelType(Model);
            else
                ModelManager.UpdateModelType(Model);

            VehicleGridView.DataBind();
        }

    }
}