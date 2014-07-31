<%@ page title="Role" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
    codebehind="RoleManager.aspx.cs" inherits="VehicleMaintenanceSystem.Account.RoleManager" %>

<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:content id="RoleHeadContent" contentplaceholderid="HeadContent" runat="server">
</asp:content>
<asp:content id="RoleContent" contentplaceholderid="MainContent" runat="server">
    <asp:toolkitscriptmanager id="VehicleScriptManager" runat="server">
    </asp:toolkitscriptmanager>
    <h2>
        Manage Roles
    </h2>
    <div class="roleListInfo">
        <fieldset class="role">
            <legend>User Role Information</legend>
            <asp:linkbutton id="AddLinkButton" runat="server" onclick="AddLinkButton_Click">Manage Role</asp:linkbutton><br />
            <br />
            <asp:gridview id="RoleManagerGridView" runat="server" width="100%" autogeneratecolumns="False"
                datasourceid="RoleSqlDataSource" allowsorting="true">
                <columns>
                    <asp:boundfield datafield="UserName" headertext="Employee Id" sortexpression="UserName"
                        headerstyle-font-bold="false" />
                    <asp:boundfield datafield="RoleName" headertext="Role Name" sortexpression="RoleName"
                        headerstyle-font-bold="false" />
                </columns>
            </asp:gridview>
            <asp:sqldatasource id="RoleSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT u.UserName, r.RoleName FROM aspnet_UsersInRoles AS i INNER JOIN aspnet_Users AS u ON i.UserId = u.UserId INNER JOIN aspnet_Roles AS r ON i.RoleId = r.RoleId WHERE u.UserName <> 'administrator'">
            </asp:sqldatasource>
        </fieldset>
    </div>
    <asp:button id="ShowPopupButton" runat="server" style="display: none" />
    <asp:modalpopupextender id="RoleModalPopupExtender" runat="server" targetcontrolid="ShowPopupButton"
        popupcontrolid="pnlpopup" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
        popupdraghandlecontrolid="trRoles">
    </asp:modalpopupextender>
    <asp:panel id="pnlpopup" runat="server" backcolor="White" width="400px" defaultbutton="SaveButton"
        style="display: none">
        <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
            <tr id="trRoles" style="background-color: #4b6c9e; cursor: move;" runat="server">
                <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
                    Set User Role
                </th>
                <th align="right">
                    <asp:button id="CancelButton" runat="server" text=" X " font-bold="true" />
                </th>
            </tr>
            <tr>
                <td align="left" class="modalLabel">
                    Role Name
                </td>
                <td align="left">
                    <asp:dropdownlist id="RoleDropDownList" runat="server" cssclass="comboEntry">
                    </asp:dropdownlist>
                    <asp:comparevalidator id="RoleDropDownList_Comparevalidator" runat="server" errormessage="<b>Role</b> is required."
                        controltovalidate="RoleDropDownList" valuetocompare="0" operator="NotEqual" validationgroup="Submit"
                        display="None"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="RoleDropDownList_Comparevalidator_Validatorcalloutextender"
                        runat="server" enabled="True" targetcontrolid="RoleDropDownList_Comparevalidator"
                        highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel">
                    Employee Id
                </td>
                <td align="left">
                    <asp:dropdownlist id="UserDropDownList" runat="server" cssclass="comboEntry">
                    </asp:dropdownlist>
                    <asp:comparevalidator id="UserDropDownList_Comparevalidator" runat="server" errormessage="<b>Employee Id</b> is required."
                        controltovalidate="UserDropDownList" valuetocompare="0" operator="NotEqual" validationgroup="Submit"
                        display="None"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="UserDropDownList_Comparevalidator_Validatorcalloutextender"
                        runat="server" enabled="True" targetcontrolid="UserDropDownList_Comparevalidator"
                        highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel">
                </td>
                <td align="left">
                    <asp:button id="SaveButton" runat="server" text="Save" onclick="SaveButton_Click"
                        validationgroup="Submit" />
                </td>
            </tr>
        </table>
    </asp:panel>
</asp:content>
