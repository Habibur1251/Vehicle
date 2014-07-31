using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VehicleMaintenanceSystem.Manager;

namespace VehicleMaintenanceSystem.Account
{
    public partial class Register : System.Web.UI.Page
    {
        private TextBox FullName;
        private DropDownList Company;
        private DropDownList Department;
        private DropDownList Designation;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
           
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);
            MembershipUser newUser = Membership.GetUser(RegisterUser.UserName);
            Guid newUserId = (Guid)newUser.ProviderUserKey;

            FullName = ((TextBox)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FullName"));
            Company = ((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Company"));
            Department = ((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Department"));
            Designation = ((DropDownList)RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Designation"));

            ProfileManager profileManager = new ProfileManager();
            bool isRegistered = profileManager.SaveProfile(newUserId, FullName.Text, Convert.ToInt32(Company.SelectedValue), Convert.ToInt32(Department.SelectedValue), Convert.ToInt32(Designation.SelectedValue));

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                if (isRegistered)
                    continueUrl = "~/Default.aspx?register=success";
                else
                    continueUrl = "~/Default.aspx?register=fail";
            }
            Response.Redirect(continueUrl);
        }

        
    }
}
