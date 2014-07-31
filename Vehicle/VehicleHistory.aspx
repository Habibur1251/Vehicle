<%@ page title="VehicleHistory" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
    codebehind="VehicleHistory.aspx.cs" inherits="VehicleMaintenanceSystem.Vehicle.VehicleHistory" %>

<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <asp:toolkitscriptmanager id="TransactionScriptManager" runat="server">
    </asp:toolkitscriptmanager>
    <h2>
    <asp:label id="lblReportTitle" runat="server" forecolor="#000066" 
            font-bold="True" font-size="Large" text="" 
            font-italic="True" font-underline="true"></asp:label>
        
    </h2>
    <div class="transactionInfo">
        <fieldset class="transaction">
            
                   
        <%-- <telerik:raddatepicker ID="Raddatepicker1" runat="server" 
                    AutoPostBack="True">
                    <DateInput ID="DateInput1" DateFormat="dd MMM yyyy" runat="server" SelectedDate="2010-12-27">
                    </DateInput>
                    </telerik:raddatepicker>--%>
                         
            <asp:gridview id="TransactionGridView" runat="server" 
                autogeneratecolumns="False" datakeynames="TransactionId,VehicleId"
                width="100%" onrowdatabound="TransactionGridView_RowDataBound" 
                backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" 
                cellpadding="3">
                <columns>
                    <asp:boundfield datafield="RegNo" headertext="Reg No" sortexpression="RegNo"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="UserName" headertext="User" sortexpression="UserName"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="HandOverDate" headertext="Hand Over Date" sortexpression="HandOverDate"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="ToDate" headertext="To Date" sortexpression="ToDate" 
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="HandOverType" headertext="Hand Over As" sortexpression="HandOverType"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="LocationName" headertext="Location" sortexpression="LocationName"
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:boundfield datafield="Status" headertext="Status" sortexpression="Status" 
                        headerstyle-font-bold="false" >
<HeaderStyle Font-Bold="False"></HeaderStyle>
                    </asp:boundfield>
                    <asp:templatefield headertext="Edit" headerstyle-font-bold="false" visible="false" >
                        <itemtemplate>
                            <asp:linkbutton id="EditLinkButton" runat="server" onclick="EditLinkButton_Click">Edit</asp:linkbutton>
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
           <%-- <asp:sqldatasource id="TransactionSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT t.TransactionId, v.VehicleId,   vu.UserName + ',  ' + g.DesignationName + ',  ' + d.DepartmentName + ' (' + c.Alias + ')'  as UserName, v.RegNo, CONVERT(VARCHAR, t.HandOverDate, 103) AS HandOverDate, CONVERT(VARCHAR, t.ToDate, 103) AS ToDate,t.HandOverType, t.Status, t.LocationId, l.LocationName FROM Transactions AS t INNER JOIN [User] AS vu ON t.UserId = vu.UserId INNER JOIN Vehicles AS v ON t.RegNo = v.RegNo INNER JOIN Locations AS l ON t.LocationId = l.LocationId INNER JOIN Departments AS d ON vu.DepartmentId = d.DepartmentId INNER JOIN Designations AS g ON vu.DesignationId = g.DesignationId INNER JOIN Companies AS c ON vu.CompanyId = c.CompanyId where v.VehicleId={0,<%=vehicle_id%>}">
            </asp:sqldatasource>--%>
            <br />
            <br />
        </fieldset>
    </div>
    <asp:button id="ShowPopupButton" runat="server" style="display:none"   />
    <asp:modalpopupextender id="TransactionModalPopupExtender" runat="server" targetcontrolid="ShowPopupButton"
        popupcontrolid="pnlpopup" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
        popupdraghandlecontrolid="trTransactions">
    </asp:modalpopupextender>
    <asp:panel id="pnlpopup" runat="server" backcolor="white" width="700px" defaultbutton="SaveButton" 
        style="display: none">
        <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
            <tr id="trTransactions" style="background-color: #4b6c9e; cursor: move;" runat="server">
                <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
                <asp:textbox id="txtTile" runat="server" cssclass="textEntry" backcolor="#4b6c9e" forecolor="ControlLight" bordercolor="#4b6c9e" readonly="true" font-bold="true" font-size="Large">  </asp:textbox>
                    
                </th>
                <th align="right">
                    <asp:button id="CancelButton" runat="server" text=" X " font-bold="true" />
                </th>
            </tr>
                  
            <tr>
                <td align="left" class="modalLabel"> <br />
                    User
                </td>
                <td align="left"> <br />
                    <asp:dropdownlist id="ddlUser" runat="server" cssclass="comboEntry" width="450" datasourceid="VehicleUserSqlDataSource"
                        datatextfield="FullName" datavaluefield="UserId">
                    </asp:dropdownlist>
                    <asp:sqldatasource id="VehicleUserSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                        selectcommand="SELECT 0 AS [UserId], '[Select User]' AS [FullName] UNION SELECT UserId , [FullName] FROM [vw_User]">
                    </asp:sqldatasource>
                    <asp:comparevalidator id="ddlUser_CompareValidator" runat="server" errormessage="<b>User</b> is required."
                        controltovalidate="ddlUser" validationgroup="Submit" display="None" valuetocompare="0"
                        operator="NotEqual"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="ddlUser_CompareValidator_ValidatorCalloutExtender"
                        runat="server" enabled="True" targetcontrolid="ddlUser_CompareValidator" highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                    <asp:hiddenfield id="TransactionId" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"><br />
                    Vehicle
                </td>
                <td align="left"><br />
                    <asp:dropdownlist id="VehicleId" runat="server" cssclass="comboEntry" width="450"  datatextfield="Vehicle"
                        datavaluefield="VehicleId">
                    </asp:dropdownlist>
                    <asp:comparevalidator id="VehicleId_CompareValidator" runat="server" errormessage="<b>Vehicle Id</b> is required."
                        controltovalidate="VehicleId" valuetocompare="0" operator="NotEqual" validationgroup="Submit"
                        display="None"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="VehicleId_CompareValidator_ValidatorCalloutExtender"
                        runat="server" enabled="True" targetcontrolid="VehicleId_CompareValidator" highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"><br />
                    Hand Over Date
                </td>
                <td align="left"><br />
                    

                   <%-- <telerik:raddatepicker ID="HandOverDate1" runat="server"   autopostback="false">
                    <DateInput ID="HandOverDateInput" DateFormat="dd MMM yyyy" runat="server" SelectedDate="2010-12-27">
                    </DateInput>
                    </telerik:raddatepicker>--%>

                     <asp:textbox id="HandOverDate" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                      
                    <asp:maskededitextender id="HandOverDateMaskededitextender" runat="server" mask="99/99/9999"
                        masktype="Date" enabled="True" targetcontrolid="HandOverDate" onfocuscssclass="MaskedEditFocus"
                        oninvalidcssclass="MaskedEditError">
                    </asp:maskededitextender>
                    <asp:calendarextender id="HandOverDateCalendarextender" runat="server" enabled="True"  format="dd/MM/yyyy"
                        targetcontrolid="HandOverDate">
                    </asp:calendarextender>

                </td>
            </tr>
            <tr id="trToDate" runat="server">
                <td align="left" class="modalLabel">
                    Vacant Date
                </td>
                <td align="left"> <br />
                    <asp:textbox id="ToDate" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                      
                    <asp:maskededitextender id="ToDate_Maskededitextender" runat="server" mask="99/99/9999"
                        masktype="Date" enabled="True" targetcontrolid="ToDate" onfocuscssclass="MaskedEditFocus"
                        oninvalidcssclass="MaskedEditError">
                    </asp:maskededitextender>
                    <asp:calendarextender id="ToDate_Calendarextender" runat="server" enabled="True"  format="dd/MM/yyyy"
                        targetcontrolid="ToDate">
                    </asp:calendarextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"><br />
                    Hand Over As
                </td>
                <td align="left"><br />
                    <asp:dropdownlist id="HandOverType" runat="server" cssclass="comboEntry">
                        <asp:listitem value="0">[Select Hand Over As]</asp:listitem>
                        <asp:listitem value="Attached Vehicle">Attached Vehicle</asp:listitem>
                        <asp:listitem value="Pool">Pool</asp:listitem>
                        <asp:listitem value="Director Vehicles">Director Vehicles</asp:listitem>
                    </asp:dropdownlist>
                    <asp:comparevalidator id="HandOverType_Comparevalidator" runat="server" errormessage="<b>Hand Over As</b> is required."
                        controltovalidate="HandOverType" valuetocompare="0" operator="NotEqual" validationgroup="Submit"
                        display="None"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="HandOverType_Comparevalidator_Validatorcalloutextender"
                        runat="server" enabled="True" targetcontrolid="HandOverType_Comparevalidator"
                        highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"> <br />
                    Location
                </td>
                <td align="left"><br />
                    <asp:dropdownlist id="LocationId" runat="server" cssclass="comboEntry" datasourceid="LocationSqlDataSource"
                        datatextfield="LocationName" datavaluefield="LocationId">
                    </asp:dropdownlist>
                    <asp:sqldatasource id="LocationSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                        selectcommand="SELECT 0 AS [LocationId], '[Select Location]' AS [LocationName] UNION SELECT [LocationId], [LocationName] FROM [Locations]">
                    </asp:sqldatasource>
                    <asp:comparevalidator id="LocationId_Comparevalidator" runat="server" errormessage="<b>Location</b> is required."
                        controltovalidate="LocationId" valuetocompare="0" operator="NotEqual" validationgroup="Submit"
                        display="None"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="LocationId_Comparevalidator_Validatorcalloutextender"
                        runat="server" enabled="True" targetcontrolid="LocationId_Comparevalidator" highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"><br />
                    Status
                </td>
                <td align="left"><br />
                    <asp:dropdownlist id="Status" runat="server" cssclass="comboEntry">
                        <asp:listitem value="0">[Select Status]</asp:listitem>
                        <asp:listitem value="In Hand">In Hand</asp:listitem>
                        <asp:listitem value="In Use">In Use</asp:listitem>
                        <asp:listitem value="Sold to User">Sold to User</asp:listitem>
                        <asp:listitem value="Sold to Customer">Sold to Customer</asp:listitem>
                        <asp:listitem value="In Active">In Active</asp:listitem>
                    </asp:dropdownlist>
                    <asp:comparevalidator id="Status_Comparevalidator" runat="server" errormessage="<b>Status</b> is required."
                        controltovalidate="Status" valuetocompare="0" operator="NotEqual" validationgroup="Submit"
                        display="None"></asp:comparevalidator>
                    <asp:validatorcalloutextender id="Status_Comparevalidator_Validatorcalloutextender"
                        runat="server" enabled="True" targetcontrolid="Status_Comparevalidator" highlightcssclass="validatorCalloutHighlight">
                    </asp:validatorcalloutextender>
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"><br />
                </td>
                <td align="left"><br />
                    <asp:button id="SaveButton" runat="server" text="Save" onclick="SaveButton_Click"
                        validationgroup="Submit" /><br />
                </td>
            </tr>
            <tr>
                <td align="left" class="modalLabel"><br />
                </td>
                
            </tr>
        </table>
    </asp:panel>
</asp:content>
