                <%@ page title="Vehicles" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
                codebehind="Motorcycle.aspx.cs" inherits="VehicleMaintenanceSystem.Vehicle.Motorcycle" %>

                <%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

                <asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
                </asp:content>
                <asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
                <asp:toolkitscriptmanager id="VehicleScriptManager" runat="server">
                </asp:toolkitscriptmanager>
    
                <div class="vehicleInfo">
                <fieldset class="vehicle">
                <legend>Manage Motorcycle</legend>
            
            
            
                <table width="100%" style="border: Solid 1px #CCCCCC; width: 100%; height: 100%"
                cellpadding="0" cellspacing="0">                
                <tr id="tr1" style="background-color: #006699;">
                <td align="left" class="modalLabel">
                <asp:linkbutton id="AddLinkButton" runat="server" forecolor="White" font-bold="true" font-size="Medium"  onclick="AddLinkButton_Click">Entry New Motorcycle  (+)</asp:linkbutton> 
                </td>
                <td align="right" class="modalLabel">
                <asp:linkbutton id="SearchLinkButton" runat="server" forecolor="White" font-bold="true" font-size="Medium" onclick="SearchLinkButton_Click">Advance Search</asp:linkbutton>
                </td>
                                
                </tr>
                             
                </table>    
            
                <asp:button id="ShowAdvanceSearchPopupButton" runat="server" style="display: none" />
                <asp:modalpopupextender id="AdvanceSearch_Modalpopupextender" runat="server" targetcontrolid="ShowAdvanceSearchPopupButton"
                popupcontrolid="AdvanceSearch_Panel" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
                popupdraghandlecontrolid="trSearch">
                </asp:modalpopupextender>


                <asp:panel id="AdvanceSearch_Panel" runat="server" backcolor="White" width="500px" defaultbutton="SearchButton"
                style="display: none">

              
        
                <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
                cellpadding="0" cellspacing="0">
                <tr id="trSearch" style="background-color: #4b6c9e; cursor: move;">
                
                
                <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
                Advance Search Form
                </th>
                <th align="right">
                <asp:button id="Button1" runat="server" text=" X " font-bold="true" />
                </th>
                                
                </tr>
              

                <tr>
                <td align="left" class="modalLabel">
                <br /> 
                </td>
                </tr>
               
                <tr>
                <td align="left" class="modalLabel">
                Reg No
                </td>
                <td align="left">
                <asp:textbox id="txtFindRegNo" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
               
                <tr>
                <td align="left" class="modalLabel">
                Model Type
                </td>
                <td align="left">

                <asp:dropdownlist id="ddlFindModelType" runat="server" cssclass="comboEntry" 
                datasourceid="FindModelTypeSqlDataSource" datatextfield="ModelType" 
                datavaluefield="ModelTypeId">
                </asp:dropdownlist>
                <asp:sqldatasource id="FindModelTypeSqlDataSource" runat="server" 
                connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
                selectcommand="SELECT 0 AS [ModelTypeId], '[Select Model Type]' AS [ModelType] UNION SELECT  ModelTypeId, ModelType FROM [ModelType] where VehicleType=2">
                </asp:sqldatasource>
                                                
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Fuel Type
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlFindFuelType" runat="server" cssclass="comboEntry">
                <asp:listitem value="0">[Select Fuel Type]</asp:listitem>
                <asp:listitem value="CNG">CNG</asp:listitem>
                <asp:listitem value="Diesel">Diesel</asp:listitem>
                <asp:listitem value="Oct/CNG">Oct/CNG</asp:listitem>
                <asp:listitem value="Octane">Octane</asp:listitem>
                <asp:listitem value="Petrol">Petrol</asp:listitem>
                </asp:dropdownlist>
                       
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Owner
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlFindOwner" runat="server" cssclass="comboEntry" 
                datasourceid="ddlFindOwnerSqlDataSource" datatextfield="CompanyName" 
                datavaluefield="Alias">
                </asp:dropdownlist>
                <asp:sqldatasource id="ddlFindOwnerSqlDataSource" runat="server" 
                connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
                selectcommand="SELECT '0' AS [Alias], '[Select Owner]' AS [CompanyName] UNION SELECT [Alias], [CompanyName] + ' (' + [Alias] + ')' AS [CompanyName] FROM [Companies]">
                </asp:sqldatasource>
                        
                </td>
                </tr>
                                     
                <tr>
                <td align="left" class="modalLabel">
                Insurance Date Expire After
                </td>
                <td align="left">
                <asp:textbox id="txtFindInsuranceDate" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
                <asp:Label ID="Label" runat="server" >Days</asp:Label>
                        
                </td>
                </tr>
                                               
                <tr>
                <td align="left" class="modalLabel">
                User
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlFindUser" runat="server" cssclass="comboEntry"  datasourceid="FindVehicleUserSqlDataSource"
                datatextfield="UserName" datavaluefield="UserId">
                </asp:dropdownlist>
                <asp:sqldatasource id="FindVehicleUserSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT 0 AS [UserId], '[Select User]' AS [UserName] UNION SELECT UserId , [FullName] as [UserName] FROM [vw_User]">
                </asp:sqldatasource>
                   
                    
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Hand Over Month
                </td>
                <td align="left">
                                   
                <asp:dropdownlist id="ddlFindHandOverMonth" runat="server" cssclass="comboEntry" width="120px">
                <asp:listitem value="0">[Select Month]</asp:listitem>
                <asp:listitem value="1">January</asp:listitem>
                <asp:listitem value="2">February</asp:listitem>
                <asp:listitem value="3">March</asp:listitem>
                <asp:listitem value="4">April</asp:listitem>
                <asp:listitem value="5">May</asp:listitem>
                <asp:listitem value="6">Jun</asp:listitem>
                <asp:listitem value="7">July</asp:listitem>
                <asp:listitem value="8">August</asp:listitem>
                <asp:listitem value="9">September</asp:listitem>
                <asp:listitem value="10">October</asp:listitem>
                <asp:listitem value="11">November</asp:listitem>
                <asp:listitem value="12">December</asp:listitem>

                </asp:dropdownlist>   
                                      
                <asp:Label ID="Label1" runat="server" >Year</asp:Label>
                <asp:textbox id="txtFindHandOverYear" runat="server" cssclass="textEntry"  width="30px" maxlength="4"></asp:textbox>
                     

                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Hand Over As
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlFindHandOverType" runat="server" cssclass="comboEntry">
                <asp:listitem value="0">[Select Hand Over As]</asp:listitem>
                <asp:listitem value="Attached Vehicle">Attached Vehicle</asp:listitem>
                <asp:listitem value="Pool">Pool</asp:listitem>
                <asp:listitem value="Director Vehicles">Director Vehicles</asp:listitem>
                </asp:dropdownlist>
                  
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Location
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlFindLocationId" runat="server" cssclass="comboEntry" datasourceid="FindLocationSqlDataSource"
                datatextfield="LocationName" datavaluefield="LocationId">
                </asp:dropdownlist>
                <asp:sqldatasource id="FindLocationSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT 0 AS [LocationId], '[Select Location]' AS [LocationName] UNION SELECT [LocationId], [LocationName] FROM [Locations]">
                </asp:sqldatasource>
                                       
                </td>
               
                </tr>
               
                <tr>
                <td align="left" class="modalLabel">
                Status
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlFindStatus" runat="server" cssclass="comboEntry"  font-size="1em">
                <asp:listitem value="0">[Select Status]</asp:listitem>
                <asp:listitem value="Damaged">Damaged</asp:listitem>
                <asp:listitem value="In Hand">In Hand</asp:listitem>
                <asp:listitem value="In Use">In Use</asp:listitem>
                <asp:listitem value="Sold to User">Sold to User</asp:listitem>
                <asp:listitem value="Sold to Customer">Sold to Customer</asp:listitem>
                <asp:listitem value="Lost">Lost</asp:listitem>
                </asp:dropdownlist>
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
                <asp:button id="SearchButton" runat="server" onclick="SearchButton_Click"  text="Search" />
                <asp:button id="SearchCancelButton" runat="server" onclick="SearchCancelButton_Click" text="Close" />
                        

                </td>
                    
                    
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                <br /> 
                </td>
                </tr>
                  
                </table>
                  
                  

                </asp:panel>
                 
                <asp:gridview id="VehicleGridView" runat="server" autogeneratecolumns="False" datakeynames="VehicleId"
               
                width="100%" pagesize="100"
                onrowdatabound="VehicleGridView_RowDataBound" 
                backcolor="White" bordercolor="#CCCCCC" borderstyle="None" borderwidth="1px" 
                cellpadding="3">
                <columns>
                 
                <asp:boundfield datafield="RegNo" headertext="Reg No" sortexpression="RegNo" 
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                </asp:boundfield>
                <asp:boundfield datafield="RegDate" headertext="Reg Date" sortexpression="RegDate"
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                </asp:boundfield>
                <asp:boundfield datafield="Vehicle" headertext="Motorcycle" sortexpression="Vehicle"
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                   
                </asp:boundfield>
                <asp:boundfield datafield="UserInfo" headertext="User Info" sortexpression="User"
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                   
                </asp:boundfield>
                <asp:boundfield datafield="EngineNo" headertext="Engine No" sortexpression="EngineNo"
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:boundfield>
                   
                <asp:boundfield datafield="ChechisNo" headertext="Chechis No" sortexpression="ChechisNo"
                headerstyle-font-bold="false" >

                <HeaderStyle Font-Bold="False"></HeaderStyle>
                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:boundfield>
                <asp:boundfield datafield="InsuranceDate" headertext="Ins. Date" sortexpression="InsuranceDate"
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                <ItemStyle HorizontalAlign="Left"></ItemStyle>
                </asp:boundfield>
                <asp:boundfield datafield="Status" headertext="Status" sortexpression="Status" 
                headerstyle-font-bold="false" >
                <HeaderStyle Font-Bold="False"></HeaderStyle>
                </asp:boundfield>
                    
                <asp:templatefield headertext="Details" headerstyle-font-bold="false">
                <itemtemplate>
                <asp:linkbutton id="EditLinkButton" runat="server" onclick="EditLinkButton_Click">Details</asp:linkbutton>
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
                <%-- <asp:sqldatasource id="VehicleSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT v.[VehicleId], v.[RegNo], CONVERT(VARCHAR, v.[RegDate], 103) AS [RegDate], m.[ModelType] + ', '+ v.[FuelType] + ', '+ v.[Owner] as Vehicle, isnull(u.UserName+ ', '+ C.Alias,'')  as [UserInfo], v.[EngineNo], v.[ChechisNo], v.[VehicleColor], v.[EngineCapacity], v.[TireSize],   CONVERT(VARCHAR, v.[InsuranceDate], 103) AS [InsuranceDate], v.[Status] FROM [Vehicles] v left outer join [User] u on v.UserId=u.UserId left outer join Companies c on u.CompanyId=c.companyId left outer join [ModelType] m on v.ModelTypeId=m.ModelTypeId where v.VehicleType='Motorcycle'">
                </asp:sqldatasource>--%>
                </fieldset>
                </div>
                <asp:button id="ShowPopupButton" runat="server" style="display: none" />
                <asp:modalpopupextender id="VehicleModalPopupExtender" runat="server" targetcontrolid="ShowPopupButton"
                popupcontrolid="pnlpopup" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
                popupdraghandlecontrolid="trVehicles">
                </asp:modalpopupextender>


                <asp:panel id="pnlpopup" runat="server" backcolor="White" width="450px" defaultbutton="SaveButton"
                style="display: none">

        
    
        
                <fieldset class="vehicle">
        
                <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
                cellpadding="0" cellspacing="0">
                <tr id="trVehicles" style="background-color: #4b6c9e; cursor: move;">
                
                
                <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
                Motorcycle Form
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
                Motorcycle Type
                </td>
                <td align="left">
                <asp:dropdownlist id="VehicleType" runat="server" cssclass="comboEntry">
                <asp:listitem value="0">[Select Motorcycle Type]</asp:listitem>
                <asp:listitem value="Motorcycle">Motorcycle</asp:listitem>
                </asp:dropdownlist>
                <asp:comparevalidator id="VehicleType_CompareValidator" runat="server" 
                controltovalidate="VehicleType" display="None" 
                errormessage="&lt;b&gt;Motorcycle Type&lt;/b&gt; is required." operator="NotEqual" 
                validationgroup="Submit" valuetocompare="0"></asp:comparevalidator>
                <asp:validatorcalloutextender id="VehicleType_CompareValidator_ValidatorCalloutExtender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="VehicleType_CompareValidator">
                </asp:validatorcalloutextender>
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Reg No
                </td>
                <td align="left">
                <asp:textbox id="RegNo" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                <asp:hiddenfield id="VehicleId" runat="server" />
                <asp:requiredfieldvalidator id="RegNo_RequiredFieldValidator" runat="server" 
                controltovalidate="RegNo" display="None" 
                errormessage="&lt;b&gt;Reg No&lt;/b&gt; is required." validationgroup="Submit"></asp:requiredfieldvalidator>
                <asp:validatorcalloutextender id="RegNo_RequiredFieldValidator_ValidatorCalloutExtender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="RegNo_RequiredFieldValidator">
                </asp:validatorcalloutextender>
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Reg Date
                </td>
                <td align="left">
                <asp:textbox id="RegDate" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
                <asp:requiredfieldvalidator id="RegDate_Requiredfieldvalidator" runat="server" 
                controltovalidate="RegDate" display="None" 
                errormessage="&lt;b&gt;Registration Date&lt;/b&gt; is required." validationgroup="Submit"></asp:requiredfieldvalidator>
                <asp:validatorcalloutextender id="RegDate_Requiredfieldvalidator_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="RegDate_RequiredFieldValidator">
                </asp:validatorcalloutextender>
                <asp:maskededitextender id="RegDate_MaskedEditExtender" runat="server" 
                enabled="True" mask="99/99/9999" masktype="Date" 
                onfocuscssclass="MaskedEditFocus" oninvalidcssclass="MaskedEditError" 
                targetcontrolid="RegDate">
                </asp:maskededitextender>
                <asp:calendarextender id="RegDate_CalendarExtender" runat="server"  format="dd/MM/yyyy"
                enabled="True" targetcontrolid="RegDate">
                </asp:calendarextender>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Model Type
                </td>
                <td align="left">

                <asp:dropdownlist id="ModelTypeId" runat="server" cssclass="comboEntry" 
                datasourceid="ModelTypeSqlDataSource" datatextfield="ModelType" 
                datavaluefield="ModelTypeId">
                </asp:dropdownlist>
                <asp:sqldatasource id="ModelTypeSqlDataSource" runat="server" 
                connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
                selectcommand="SELECT 0 AS [ModelTypeId], '[Select Model Type]' AS [ModelType] UNION SELECT  ModelTypeId, ModelType FROM [ModelType] where VehicleType=2">
                </asp:sqldatasource>

                <asp:comparevalidator id="ModelType_Comparevalidator" runat="server" 
                controltovalidate="ModelTypeId" display="None" 
                errormessage="&lt;b&gt;Model Type&lt;/b&gt; is required." operator="NotEqual" 
                validationgroup="Submit" valuetocompare="0"></asp:comparevalidator>
                <asp:validatorcalloutextender id="ModelType_Comparevalidator_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="ModelType_Comparevalidator">
                </asp:validatorcalloutextender>
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Fuel Type
                </td>
                <td align="left">
                <asp:dropdownlist id="FuelType" runat="server" cssclass="comboEntry">
                <asp:listitem value="0">[Select Fuel Type]</asp:listitem>
                <asp:listitem value="CNG">CNG</asp:listitem>
                <asp:listitem value="Diesel">Diesel</asp:listitem>
                <asp:listitem value="Oct/CNG">Oct/CNG</asp:listitem>
                <asp:listitem value="Octane">Octane</asp:listitem>
                <asp:listitem value="Petrol">Petrol</asp:listitem>
                </asp:dropdownlist>
                <asp:comparevalidator id="FuelType_Comparevalidator" runat="server" 
                controltovalidate="FuelType" display="None" 
                errormessage="&lt;b&gt;Fuel Type&lt;/b&gt; is required." operator="NotEqual" 
                validationgroup="Submit" valuetocompare="0"></asp:comparevalidator>
                <asp:validatorcalloutextender id="FuelType_Comparevalidator_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="FuelType_Comparevalidator">
                </asp:validatorcalloutextender>
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Owner
                </td>
                <td align="left">
                <asp:dropdownlist id="Owner" runat="server" cssclass="comboEntry" 
                datasourceid="OwnerSqlDataSource" datatextfield="CompanyName" 
                datavaluefield="Alias">
                </asp:dropdownlist>
                <asp:sqldatasource id="OwnerSqlDataSource" runat="server" 
                connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
                selectcommand="SELECT '0' AS [Alias], '[Select Owner]' AS [CompanyName] UNION SELECT [Alias], [CompanyName] + ' (' + [Alias] + ')' AS [CompanyName] FROM [Companies]">
                </asp:sqldatasource>
                <asp:comparevalidator id="Owner_Comparevalidator" runat="server" 
                controltovalidate="Owner" display="None" 
                errormessage="&lt;b&gt;Owner&lt;/b&gt; is required." operator="NotEqual" 
                validationgroup="Submit" valuetocompare="0"></asp:comparevalidator>
                <asp:validatorcalloutextender id="Owner_Comparevalidator_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="Owner_Comparevalidator">
                </asp:validatorcalloutextender>
                </td>
                </tr>

               
                <tr>
                <td align="left" class="modalLabel">
                Supplier Name
                </td>
                <td align="left">
                <asp:textbox id="SupplierName" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Supplier Address
                </td>
                <td align="left">
                <asp:textbox id="SupplierAddress" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                       
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Purchase Price
                </td>
                <td align="left">
                <asp:textbox id="PurchasePrice" runat="server" cssclass="rightAlign" 
                maxlength="50"></asp:textbox>
                <asp:filteredtextboxextender id="PurchasePrice_FilteredTextBoxExtender" 
                runat="server" enabled="True" filtermode="ValidChars" 
                filtertype="Custom,Numbers" targetcontrolid="PurchasePrice" validchars=".">
                </asp:filteredtextboxextender>
                <asp:requiredfieldvalidator id="PurchasePrice_Requiredfieldvalidator" 
                runat="server" controltovalidate="PurchasePrice" display="None" 
                errormessage="&lt;b&gt;Purchase Price&lt;/b&gt; is required." 
                validationgroup="Submit"></asp:requiredfieldvalidator>
                <asp:validatorcalloutextender id="PurchasePrice_Requiredfieldvalidator_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="PurchasePrice_Requiredfieldvalidator">
                </asp:validatorcalloutextender>
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Engine No
                </td>
                <td align="left">
                <asp:textbox id="EngineNo" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Chechis No
                </td>
                <td align="left">
                <asp:textbox id="ChechisNo" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Vehicle Color
                </td>
                <td align="left">
                <asp:textbox id="VehicleColor" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Engine Capacity
                </td>
                <td align="left">
                <asp:textbox id="EngineCapacity" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Tire Size
                </td>
                <td align="left">
                <asp:textbox id="TireSize" runat="server" cssclass="textEntry" 
                maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                               
                <tr>
                <td align="left" class="modalLabel">
                Insurance Date
                </td>
                <td align="left">
                <asp:textbox id="InsuranceDate" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
                <asp:maskededitextender id="InsuranceDateMaskededitextender" runat="server" 
                enabled="True" mask="99/99/9999" masktype="Date" 
                onfocuscssclass="MaskedEditFocus" oninvalidcssclass="MaskedEditError" 
                targetcontrolid="InsuranceDate">
                </asp:maskededitextender>
                <asp:calendarextender id="InsuranceDateCalendarextender" runat="server"  format="dd/MM/yyyy"
                enabled="True" targetcontrolid="InsuranceDate">
                </asp:calendarextender>
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Remarks
                </td>
                <td align="left">
                <asp:textbox id="Remarks" runat="server" cssclass="textEntry" maxlength="50"></asp:textbox>
                        
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Status
                </td>
                <td align="left">
                <asp:dropdownlist id="Status" runat="server" cssclass="comboEntry">
                <asp:listitem value="0">[Select Status]</asp:listitem>
                <asp:listitem value="Damaged">Damaged</asp:listitem>
                <asp:listitem value="In Hand">In Hand</asp:listitem>
                <asp:listitem value="In Use">In Use</asp:listitem>
                <asp:listitem value="Sold to User">Sold to User</asp:listitem>
                <asp:listitem value="Sold to Customer">Sold to Customer</asp:listitem>
                <asp:listitem value="Lost">Lost</asp:listitem>
                </asp:dropdownlist>
                <asp:comparevalidator id="Status_Comparevalidator" runat="server" 
                controltovalidate="Status" display="None" 
                errormessage="&lt;b&gt;Status&lt;/b&gt; is required." operator="NotEqual" 
                validationgroup="Submit" valuetocompare="0"></asp:comparevalidator>
                <asp:validatorcalloutextender id="Status_Comparevalidator_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="Status_Comparevalidator">
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
                User
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlUser" runat="server" cssclass="comboEntry"  datasourceid="VehicleUserSqlDataSource"
                datatextfield="UserName" datavaluefield="UserId">
                </asp:dropdownlist>
                <asp:sqldatasource id="VehicleUserSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT 0 AS [UserId], '[Select User]' AS [UserName] UNION SELECT UserId , [FullName] as [UserName] FROM [vw_User]">
                </asp:sqldatasource>
                <asp:comparevalidator id="ddlUser_CompareValidator" runat="server" errormessage="<b>User</b> is required."
                controltovalidate="ddlUser" validationgroup="Handover" display="None" valuetocompare="0"
                operator="NotEqual"></asp:comparevalidator>
                <asp:validatorcalloutextender id="ddlUser_CompareValidator_ValidatorCalloutExtender"
                runat="server" enabled="True" targetcontrolid="ddlUser_CompareValidator" highlightcssclass="validatorCalloutHighlight">
                </asp:validatorcalloutextender>
                    
                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Hand Over Date
                </td>
                <td align="left">
                                        
                <asp:textbox id="HandOverDate" runat="server" cssclass="textEntry"  width="100px" maxlength="50"></asp:textbox>
                    
                <asp:requiredfieldvalidator id="HandOverDate_Requiredfieldvalidator" runat="server" 
                controltovalidate="HandOverDate" display="None" 
                errormessage="&lt;b&gt;Handover Date&lt;/b&gt; is required." validationgroup="Handover" ></asp:requiredfieldvalidator>
                <asp:validatorcalloutextender id="HandOverDate_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="HandOverDate_Requiredfieldvalidator">
                </asp:validatorcalloutextender>

                <%--<asp:requiredfieldvalidator id="HandOverDate1_Requiredfieldvalidator" runat="server" 
                controltovalidate="HandOverDate" display="None" 
                errormessage="&lt;b&gt;Handover Date&lt;/b&gt; is required." validationgroup="Submit" ></asp:requiredfieldvalidator>
                <asp:validatorcalloutextender id="HandOverDate1_Validatorcalloutextender" 
                runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
                targetcontrolid="HandOverDate1_Requiredfieldvalidator">
                </asp:validatorcalloutextender>--%>

                <asp:maskededitextender id="HandOverDateMaskededitextender" runat="server" mask="99/99/9999"
                masktype="Date" enabled="True" targetcontrolid="HandOverDate" onfocuscssclass="MaskedEditFocus"
                oninvalidcssclass="MaskedEditError">
                </asp:maskededitextender>

                <asp:calendarextender id="HandOverDateCalendarextender" runat="server" enabled="True"  format="dd/MM/yyyy"
                targetcontrolid="HandOverDate">
                </asp:calendarextender>

                     

                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Hand Over As
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlHandOverType" runat="server" cssclass="comboEntry">
                <asp:listitem value="0">[Select Hand Over As]</asp:listitem>
                <asp:listitem value="Attached Vehicle">Attached Vehicle</asp:listitem>
                <asp:listitem value="Pool">Pool</asp:listitem>
                <asp:listitem value="Director Vehicles">Director Vehicles</asp:listitem>
                </asp:dropdownlist>
                <asp:comparevalidator id="ddlHandOverType_Comparevalidator" runat="server" errormessage="<b>Hand Over As</b> is required."
                controltovalidate="ddlHandOverType" valuetocompare="0" operator="NotEqual" validationgroup="Handover"
                display="None"></asp:comparevalidator>
                <asp:validatorcalloutextender id="ddlHandOverType_Comparevalidator_Validatorcalloutextender"
                runat="server" enabled="True" targetcontrolid="ddlHandOverType_Comparevalidator"
                highlightcssclass="validatorCalloutHighlight">
                </asp:validatorcalloutextender>

                <%--<asp:comparevalidator id="ddlHandOverType_Comparevalidator1" runat="server" errormessage="<b>Hand Over As</b> is required."
                controltovalidate="ddlHandOverType" valuetocompare="0" operator="NotEqual" validationgroup="Handover"
                display="None"></asp:comparevalidator>
                <asp:validatorcalloutextender id="ddlHandOverType_Comparevalidator_Validatorcalloutextender1"
                runat="server" enabled="True" targetcontrolid="ddlHandOverType_Comparevalidator1"
                highlightcssclass="validatorCalloutHighlight">
                </asp:validatorcalloutextender>--%>

                </td>
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                Location
                </td>
                <td align="left">
                <asp:dropdownlist id="ddlLocationId" runat="server" cssclass="comboEntry" datasourceid="LocationSqlDataSource"
                datatextfield="LocationName" datavaluefield="LocationId">
                </asp:dropdownlist>
                <asp:sqldatasource id="LocationSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT 0 AS [LocationId], '[Select Location]' AS [LocationName] UNION SELECT [LocationId], [LocationName] FROM [Locations]">
                </asp:sqldatasource>
                   
                <asp:comparevalidator id="ddlLocationId_Comparevalidator" runat="server" errormessage="<b>Location</b> is required."
                controltovalidate="ddlLocationId" valuetocompare="0" operator="NotEqual" validationgroup="Handover"
                display="None"></asp:comparevalidator>
                <asp:validatorcalloutextender id="ddlLocationId_Comparevalidator_Validatorcalloutextender"
                runat="server" enabled="True" targetcontrolid="ddlLocationId_Comparevalidator" highlightcssclass="validatorCalloutHighlight">
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
                <asp:button id="SaveButton" runat="server" onclick="SaveButton_Click"  text="Submit" validationgroup="Submit" />
                <asp:button id="HandoverButton" runat="server" onclick="HandoverButton_Click" text="Handover" validationgroup="Handover" />
                <asp:button id="VacantButton" runat="server" onclick="VacantButton_Click" text="Vacant" />   

                </td>
                    
                    
                </tr>
                <tr>
                <td align="left" class="modalLabel">
                <br /> 
                </td>
                </tr>
                  
                </table>
                </fieldset>
                  

                </asp:panel>
     
                </asp:content>
