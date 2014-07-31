<%@ page title="Vehicles" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
    codebehind="VehicleModelType.aspx.cs" inherits="VehicleMaintenanceSystem.Vehicle.VehicleModelType" %>

<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <asp:toolkitscriptmanager id="VehicleScriptManager" runat="server">
    </asp:toolkitscriptmanager>
    <h2>
        Manage Model Type
    </h2>
    <div class="vehicleInfo">
        <fieldset class="vehicle">
            <legend>Model Type</legend>
            <asp:linkbutton id="AddLinkButton" runat="server" onclick="AddLinkButton_Click">Add New Model Type (+)</asp:linkbutton>
            
            <asp:gridview id="VehicleGridView" runat="server" autogeneratecolumns="False" datakeynames="ModelTypeId"
                datasourceid="VehicleSqlDataSource" width="100%" pagesize="13" allowsorting="True"
                 
                backcolor="White" bordercolor="#CC9966" borderstyle="None" borderwidth="1px" 
                cellpadding="4" allowpaging="True">
                <columns > 
                    <asp:boundfield datafield="ModelTypeId" headertext="Model Type Id" readonly="true" sortexpression="ModelTypeId"
                        headerstyle-font-bold="false" >
                    <HeaderStyle Font-Bold="False" width="100px"></HeaderStyle>
                    </asp:boundfield>

                    <asp:boundfield datafield="ModelType" headertext="Model Type" sortexpression="ModelType"
                        headerstyle-font-bold="false" >
                    <HeaderStyle Font-Bold="False" width="500px"></HeaderStyle>
                    </asp:boundfield>

                    <asp:boundfield datafield="VehicleType" headertext="Vehicle Type" sortexpression="VehicleType"
                        headerstyle-font-bold="false" >
                    <HeaderStyle Font-Bold="False" width="100px"></HeaderStyle>
                    </asp:boundfield>

                    <asp:templatefield headertext="Edit" headerstyle-font-bold="false">
                        <itemtemplate>
                            <asp:linkbutton id="EditLinkButton" runat="server" onclick="EditLinkButton_Click">Edit</asp:linkbutton>
                        </itemtemplate>

                    <HeaderStyle Font-Bold="False" width="50px"></HeaderStyle>
                    </asp:templatefield>
                </columns>
                <footerstyle backcolor="#FFFFCC" forecolor="#330099" />
                <headerstyle backcolor="#990000" font-bold="True" forecolor="#FFFFCC" />
                <pagersettings firstpagetext="&lt;&lt; First Page " 
                    lastpagetext="Last Page  &gt;&gt;" nextpagetext="Next Page     &gt;" 
                    previouspagetext="Previous Page" />
                <pagerstyle backcolor="#FFFFCC" forecolor="#330099" horizontalalign="Center" />
                <rowstyle forecolor="#330099" backcolor="White" />
                <selectedrowstyle backcolor="#FFCC66" font-bold="True" forecolor="#663399" />
                <sortedascendingcellstyle backcolor="#FEFCEB" />
                <sortedascendingheaderstyle backcolor="#AF0101" />
                <sorteddescendingcellstyle backcolor="#F6F0C0" />
                <sorteddescendingheaderstyle backcolor="#7E0000" />
            </asp:gridview>
            <asp:sqldatasource id="VehicleSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT ModelTypeId, ModelType, CASE WHEN VehicleType = 1 THEN 'Vehicle' WHEN VehicleType = 2 THEN 'Motorcycle' ELSE '' END AS VehicleType FROM [ModelType] ORDER BY ModelTypeId">
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
                    Model Type Entry Form
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
                       Model Type
                    </td>
                    <td align="left">
                        <asp:textbox id="ModelType" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                        <asp:hiddenfield id="ModelTypeId" runat="server" />
                        <asp:requiredfieldvalidator id="ModelType_RequiredFieldValidator" runat="server" 
                            controltovalidate="ModelType" display="None" 
                            errormessage="&lt;b&gt;Model Type&lt;/b&gt; is required." validationgroup="Submit"></asp:requiredfieldvalidator>
                        <asp:validatorcalloutextender id="ModelType_RequiredFieldValidator_ValidatorCalloutExtender" 
                            runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                            targetcontrolid="ModelType_RequiredFieldValidator">
                        </asp:validatorcalloutextender>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="modalLabel">
                       Vehicle Type
                    </td>
                    <td align="left">
                       <asp:dropdownlist id="ddlVehicleType" runat="server" cssclass="comboEntry">
                            <asp:listitem value="0">[Select Motorcycle Type]</asp:listitem>
                            <asp:listitem value="1">Vehicle</asp:listitem>
                            <asp:listitem value="2">Motorcycle</asp:listitem>
                        </asp:dropdownlist>
                        <asp:comparevalidator id="ddlVehicleType_CompareValidator" runat="server" 
                            controltovalidate="ddlVehicleType" display="None" 
                            errormessage="&lt;b&gt;Vehicle Type&lt;/b&gt; is required." operator="NotEqual" 
                            validationgroup="Submit" valuetocompare="0"></asp:comparevalidator>
                        <asp:validatorcalloutextender id="ddlVehicleType_CompareValidator_ValidatorCalloutExtender" 
                            runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                            targetcontrolid="ddlVehicleType_CompareValidator">
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
