using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace VehicleMaintenanceSystem.Account
{
    public partial class RoleManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetRoles();
                GetUsers();
            }
        }

        private void GetUsers()
        {
            MembershipUserCollection users = Membership.GetAllUsers();

            foreach (MembershipUser user in users)
            {
                UserDropDownList.Items.Add(new ListItem(user.UserName, user.UserName));
            }
            UserDropDownList.Items.Remove("administrator");
            UserDropDownList.Items.Insert(0, new ListItem("[Select User]", "0"));
        }

        private void GetRoles()
        {
            string[] roles = Roles.GetAllRoles();

            foreach (string role in roles)
            {
                RoleDropDownList.Items.Add(new ListItem(role, role));
            }
            RoleDropDownList.Items.Insert(0, new ListItem("[Select Role]", "0"));
        }

        protected void AddLinkButton_Click(object sender, EventArgs e)
        {
            UserDropDownList.SelectedValue = "0";
            RoleDropDownList.SelectedValue = "0";
            this.RoleModalPopupExtender.Show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (Roles.GetRolesForUser(UserDropDownList.SelectedValue).Count() > 0)
            {
                string[] roles = Roles.GetRolesForUser(UserDropDownList.SelectedValue);
                Roles.RemoveUserFromRoles(UserDropDownList.SelectedValue, roles);
            }
            
            Roles.AddUserToRole(UserDropDownList.SelectedValue, RoleDropDownList.SelectedValue);

            RoleManagerGridView.DataBind();
        }
    }
}