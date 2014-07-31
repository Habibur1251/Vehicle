<%@ page title="Vehicles" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
    codebehind="User.aspx.cs" inherits="VehicleMaintenanceSystem.Vehicle.User" %>

<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <asp:toolkitscriptmanager id="VehicleScriptManager" runat="server">
    </asp:toolkitscriptmanager>
    <h2>
        Manage User
        <asp:button id="Button1" runat="server" onclick="Button1_Click" text="Button" />
    </h2>
    <div class="vehicleInfo">
        <fieldset class="vehicle">
            <legend>Vehicle User</legend>
            <asp:linkbutton id="AddLinkButton" runat="server" onclick="AddLinkButton_Click">Add (+)</asp:linkbutton>
            

            <asp:gridview id="VehicleGridView" runat="server" autogeneratecolumns="False" datakeynames="UserId"
                datasourceid="VehicleSqlDataSource" width="100%" pagesize="100" allowsorting="True"
                 
                backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" 
                cellpadding="3">
                <columns>
                <asp:boundfield datafield="UserCode" headertext="User Code" sortexpression="UserCode" 
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                                      
                    <asp:boundfield datafield="UserName" headertext="User Name" sortexpression="UserName"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="MobileNo" headertext="Mobile No" sortexpression="MobileNo"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="DesignationName" headertext="Designation" sortexpression="DesignationName" 
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="DepartmentName" headertext="Department" sortexpression="DepartmentName"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>

                    <asp:boundfield datafield="CompanyName" headertext="Company" sortexpression="CompanyName"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>

                    <asp:templatefield headertext="Edit" headerstyle-font-bold="false">
                        <itemtemplate>
                            <asp:linkbutton id="EditLinkButton" runat="server" onclick="EditLinkButton_Click">Edit</asp:linkbutton>
                        </itemtemplate>

<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:templatefield>
                    <asp:templatefield headertext="History" headerstyle-font-bold="false">
                    <itemtemplate>
                    <asp:linkbutton id="HistoryLinkButton" runat="server" onclick="HistoryLinkButton_Click">History</asp:linkbutton>
                    </itemtemplate>

<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:templatefield>
                </columns>
                <footerstyle backcolor="White" forecolor="#000066" />
                <headerstyle backcolor="#006699" font-bold="True" forecolor="White" />
                <pagerstyle backcolor="White" forecolor="#000066" horizontalalign="Left" />
                <rowstyle forecolor="#000066" />
                <selectedrowstyle backcolor="#669999" font-bold="True" forecolor="White" />
                <sortedascendingcellstyle backcolor="#F1F1F1" />
                <sortedascendingheaderstyle backcolor="#007DBB" />
                <sorteddescendingcellstyle backcolor="#CAC9C9" />
                <sorteddescendingheaderstyle backcolor="#00547E" />
            </asp:gridview>
            <asp:sqldatasource id="VehicleSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT v.UserId, v.UserCode, v.UserName, v.MobileNo, deg.DesignationName, d.DepartmentName, c.CompanyName FROM [User] AS v INNER JOIN Departments AS d ON v.DepartmentId = d.DepartmentId INNER JOIN Companies AS c ON v.CompanyId = c.CompanyId INNER JOIN Designations AS deg ON v.DesignationId = deg.DesignationId">
            </asp:sqldatasource>
        </fieldset>
    </div>
    <asp:button id="ShowPopupButton" runat="server" style="display: none"  />
    <asp:modalpopupextender id="VehicleUserModalPopupExtender" runat="server" targetcontrolid="ShowPopupButton"
        popupcontrolid="pnlpopup" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
        popupdraghandlecontrolid="trVehicles">
    </asp:modalpopupextender>
    <asp:panel id="pnlpopup" runat="server" backcolor="White" width="420px" defaultbutton="SaveButton"
        style="display: none">
        <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
                <tr id="trVehicles" style="background-color: #4b6c9e; cursor: move;">
                <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
                    List of User
                </th>
                <th align="right">
                    <asp:button id="CancelButton" runat="server" text=" X " font-bold="true" />
                </th>
            </tr>
                <tr>
                <td align="left" class="modalLabel">
                <br /> 
                </td>
            </tr>
               
                <tr>
                    <td align="left" class="modalLabel">
                        User Code
                    </td>
                    <td align="left">
                        <asp:textbox id="UserCode" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                        <asp:hiddenfield id="UserId" runat="server" />
                        <asp:requiredfieldvalidator id="UserCode_RequiredFieldValidator" runat="server" 
                            controltovalidate="UserCode" display="None" 
                            errormessage="&lt;b&gt;User Code&lt;/b&gt; is required." validationgroup="Submit"></asp:requiredfieldvalidator>
                        <asp:validatorcalloutextender id="UserCode_RequiredFieldValidator_ValidatorCalloutExtender" 
                            runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                            targetcontrolid="UserCode_RequiredFieldValidator">
                        </asp:validatorcalloutextender>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="modalLabel">
                        User Name
                    </td>
                    <td align="left">
                        <asp:textbox id="UserName" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                        
                        <asp:requiredfieldvalidator id="UserName_Requiredfieldvalidator" runat="server" 
                            controltovalidate="UserName" display="None" 
                            errormessage="&lt;b&gt;User Name&lt;/b&gt; is required." validationgroup="Submit"></asp:requiredfieldvalidator>
                        <asp:validatorcalloutextender id="UserName_Validatorcalloutextender" 
                            runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                            targetcontrolid="UserName_RequiredFieldValidator">
                        </asp:validatorcalloutextender>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="modalLabel">
                        Mobile No
                    </td>
                    <td align="left">
                        <asp:textbox id="MobileNo" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="modalLabel">
                        Company
                    </td>
                    <td align="left">
                            <asp:dropdownlist id="ddlCompany" runat="server" cssclass="comboEntry" datavaluefield="CompanyId"
                            datatextfield="CompanyName" datasourceid="CompanySqldatasource">
                            </asp:dropdownlist>
                            
                            <asp:sqldatasource id="CompanySqldatasource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                            selectcommand="SELECT 0 AS CompanyId, '[Select Company]' AS CompanyName UNION SELECT c.CompanyId,c.CompanyName FROM Companies c">
                            </asp:sqldatasource>
                            <asp:comparevalidator id="ddlCompany_CompareValidator" runat="server" errormessage="<b>Company</b> is required."
                            controltovalidate="ddlCompany" validationgroup="Submit" display="None" valuetocompare="0"
                            operator="NotEqual"></asp:comparevalidator>
                            <asp:validatorcalloutextender id="ddlCompany_CompareValidator_ValidatorCalloutExtender"
                            runat="server" enabled="True" targetcontrolid="ddlCompany_CompareValidator" highlightcssclass="validatorCalloutHighlight">
                            </asp:validatorcalloutextender>
                    </td>
                   
                </tr>
                 <tr>
                    <td align="left" class="modalLabel">
                        Department
                    </td>
                    <td align="left">
                            <asp:dropdownlist id="ddlDepartment" runat="server" cssclass="comboEntry" datavaluefield="DepartmentId"
                            datatextfield="DepartmentName" datasourceid="DepartmentSqldatasource">
                            </asp:dropdownlist>
                                
                            <asp:sqldatasource id="DepartmentSqldatasource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                            selectcommand="SELECT 0 AS DepartmentId, '[Select Department]' AS DepartmentName UNION SELECT d.DepartmentId,d.DepartmentName  FROM Departments d WHERE d.Status = 'A'">
                            </asp:sqldatasource>
                            <asp:comparevalidator id="ddlDepartment_Comparevalidator" runat="server" errormessage="<b>Department</b> is required."
                            controltovalidate="ddlDepartment" validationgroup="Submit" display="None" valuetocompare="0"
                            operator="NotEqual"></asp:comparevalidator>
                            <asp:validatorcalloutextender id="ddlDepartment_Validatorcalloutextender"
                            runat="server" enabled="True" targetcontrolid="ddlDepartment_CompareValidator" highlightcssclass="validatorCalloutHighlight">
                            </asp:validatorcalloutextender>
                        
                    </td>
                   
                </tr>
                <tr>
                    <td align="left" class="modalLabel">
                        Designation
                    </td>
                    <td align="left">
                            <asp:dropdownlist id="ddlDesignation" runat="server" cssclass="comboEntry" datavaluefield="DesignationId"
                            datasourceid="DesignationSqlDataSource" datatextfield="DesignationName">
                            </asp:dropdownlist>
                            
                            <asp:sqldatasource id="DesignationSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                            selectcommand="SELECT 0 AS DesignationId, '[Select Designation]' AS DesignationName UNION SELECT d.DesignationId,d.DesignationName FROM Designations d">
                            </asp:sqldatasource>    
                            <asp:comparevalidator id="ddlDesignation_Comparevalidator" runat="server" errormessage="<b>Designation</b> is required."
                            controltovalidate="ddlDesignation" validationgroup="Submit" display="None" valuetocompare="0"
                            operator="NotEqual"></asp:comparevalidator>
                            <asp:validatorcalloutextender id="ddlDesignation_Validatorcalloutextender"
                            runat="server" enabled="True" targetcontrolid="ddlDesignation_CompareValidator" highlightcssclass="validatorCalloutHighlight">
                            </asp:validatorcalloutextender>     
                        
                    </td>
                   
                </tr>
               
               
                <tr>
                <td align="left" class="modalLabel">
                <br /> 
                </td>
            </tr>
                <tr>
                    <td align="left" class="modalLabel">
                    </td>
                    <td align="left">
                        <asp:button id="SaveButton" runat="server" onclick="SaveButton_Click" 
                            text="Submit" validationgroup="Submit" />
                    </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                <br /> 
                </td>
            </tr>
            
        </table>
    </asp:panel>
</asp:content>
