            <%@ page title="Vehicles" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
            codebehind="Vehicles.aspx.cs" inherits="VehicleMaintenanceSystem.Vehicle.Vehicles" %>

            <%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

            <asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
                <style type="text/css">
                    .style1
                    {
                        padding-left: 5px;
                        height: 25px;
                    }
                </style>
            </asp:content>
            <asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
                <asp:toolkitscriptmanager id="VehicleScriptManager" runat="server">
            </asp:toolkitscriptmanager>
    
            <div class="vehicleInfo" >

             <table width="100%"  style="border: Solid 1px #CCCCCC; width: 100%; height: 25px"
            cellpadding="0" cellspacing="0">                
            <tr id="tr3" style="background-color: #CCCCCC;"  >
            <td align="center" class="modalLabel">
                <asp:label id="lblPageTitle" runat="server" forecolor="#000066" 
                    font-bold="True" font-size="Medium" text="VEHICLE MANAGEMENT" 
                    font-italic="True" font-underline="False"></asp:label>
                    
                </td>
                                 
            </tr>
            </table>
             <table width="100%"  style="border-color: #808080; width: 100%; height: 10px; border-top-style: Solid; border-top-width: 1px;"
            cellpadding="4" cellspacing="0">                
            
            <tr id="tr1" style="background-color: #CCCCCC;" >
            <td align="center" >
            <asp:linkbutton id="AddNewVehicleLinkbutton" runat="server" forecolor="#006699" 
                    font-bold="True" font-size="X-Small"  onclick="AddNewVehicleLinkbutton_Click">Entry New Vehicle  (+)</asp:linkbutton> 
            </td>
             <td align="center" class="style1" headers="GGG" title="FFF">
            <asp:linkbutton id="GridConfigLinkButton" runat="server" forecolor="#006699" font-bold="true" font-size="X-Small" onclick="GridConfigLinkButton_Click">Setting Display</asp:linkbutton>
            </td>

            <td align="center" class="style1" headers="GGG" title="FFF">
            <asp:linkbutton id="SearchLinkButton" runat="server" forecolor="#006699" font-bold="true" font-size="X-Small" onclick="SearchLinkButton_Click">Advance Search</asp:linkbutton>
            </td>

            <td align="center" class="style1" headers="GGG" title="FFF">
            
            <%= transaction_title %>
           
           <asp:linkbutton id="PrintLinkbutton" runat="server" forecolor="#006699" font-bold="true" font-size="X-Small"
                    onclientclick="javascript:window.open ('VehiclesByUserPrintView.aspx', 'mywindow');">Print</asp:linkbutton>
            </td>   
                             
            </tr>
                             
            </table>

            <fieldset class="vehicle">
                <%--
            datasourceid="FindModelTypeSqlDataSource"
            <asp:sqldatasource id="FindModelTypeSqlDataSource" runat="server" 
            connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
            selectcommand="<%# sql_vehicle_model %>">
            </asp:sqldatasource>--%>
            
            
               
            
             <asp:button id="ShowGridConfigPopupButton" runat="server" style="display: none" />
            <asp:modalpopupextender id="GridConfig_Modalpopupextender" runat="server" targetcontrolid="ShowGridConfigPopupButton" 
            popupcontrolid="GridConfig_Panel" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
            popupdraghandlecontrolid="trDisplay">
            </asp:modalpopupextender>
            <asp:panel id="GridConfig_Panel" runat="server" backcolor="#D4E7E7"  width="500px" 
            style="display:inline">

              
        
            <table width="100%" style="border: Solid 3px #4b6c9e ;  width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
            <tr id="trDisplay" style="background-color: #4b6c9e; cursor: move;">
                
                
            <th colspan="6" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
            Information Display Setting Form
            </th>
            <th align="right" class="style6">
            <asp:button id="Button2" runat="server" text=" X " font-bold="true" />
            </th>
                                
            </tr>
            <tr>
            <td align="right" class="modalLabel">
            <br/>
            </td>
            <td align="left" class="modalLabel"> <br/></td>
            <td align="right" class="modalLabel">
            <br/>       
            </td>
            <td align="left" class="modalLabel"> <br/> </td>
            <td align="right" class="modalLabel">
            <br/>              
            </td>
            <td align="left" class="modalLabel"> <br/> </td>
            
            </tr>
              
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox1" runat="server" text=" " checked="True"  />                    
            </td>
            <td align="left" class="modalLabel"> Reg No</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox2" runat="server" text=" " checked="True" />        
            </td>
            <td align="left" class="modalLabel"> Reg Date </td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox3" runat="server" text=" "  />             
            </td>
            <td align="left" class="modalLabel"> Vehicle Type </td>
            
            </tr>
             <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox4" runat="server" text=" " checked="True"  />
            </td>
            <td align="left" class="modalLabel">Model Type</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox5" runat="server" text=" " checked="True"   />
            </td>
            <td align="left" class="modalLabel"> Fuel Type</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox6" runat="server" text=" " checked="True"  />
            </td>
            <td align="left" class="modalLabel"> Owner </td>
            
            </tr> 
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox7" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Supplier</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox8" runat="server" text=" " />       
            </td>
            <td align="left" class="modalLabel"> Supplier Address</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox9" runat="server" text=" "    />        
            </td>
            <td align="left" class="modalLabel"> Unit Price </td>
            
            </tr> 
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox10" runat="server" text=" " checked="True"  />
            </td>
            <td align="left" class="modalLabel"> User Name</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox11" runat="server" text=" "  />        
            </td>
            <td align="left" class="modalLabel"> Mobile No</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox12" runat="server" text=" " checked="True"   />         
            </td>
            <td align="left" class="modalLabel"> Designation </td>
            
            </tr>
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox13" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Department</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox14" runat="server" text=" " /> 
            </td>
            <td align="left" class="modalLabel"> Location</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox15" runat="server" text=" "  />          
            </td>
            <td align="left" class="modalLabel"> HandOver Date </td>
            
            </tr>
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox16" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Handover Type</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox17" runat="server" text=" "   />         
            </td>
            <td align="left" class="modalLabel"> User Company</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox18" runat="server" text=" "  />           
            </td>
            <td align="left" class="modalLabel"> Engine No </td>
            
            </tr>
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox19" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Chechis No</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox20" runat="server" text=" "   />         
            </td>
            <td align="left" class="modalLabel"> Vehicle Color</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox21" runat="server" text=" "  />           
            </td>
            <td align="left" class="modalLabel"> Engine Capacity </td>
            
            </tr>
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox22" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Tire Size</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox23" runat="server" text=" " checked="True"  />         
            </td>
            <td align="left" class="modalLabel"> Fitness Date</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox24" runat="server" text=" " checked="True"  />           
            </td>
            <td align="left" class="modalLabel"> TAX Date </td>
            
            </tr>
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox25" runat="server" text=" " checked="True" />
            </td>
            <td align="left" class="modalLabel"> Insurance Date</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox26" runat="server" text=" " checked="True"  />         
            </td>
            <td align="left" class="modalLabel"> Roadpermit Date</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox27" runat="server" text=" " checked="True"  />           
            </td>
            <td align="left" class="modalLabel"> Status </td>
            
            </tr>   
            
            <tr>
            <td align="right" class="modalLabel">
            <br/>
            </td>
            <td align="left" class="modalLabel"> <br/></td>
            <td align="right" class="modalLabel">
            <br/>       
            </td>
            <td align="left" class="modalLabel"> <br/> </td>
            <td align="right" class="modalLabel">
            <br/>              
            </td>
            <td align="left" class="modalLabel"> <br/> </td>
            
            </tr>   
            <tr>
            <td align="right" class="modalLabel"> <br/> </td>
            <td align="left" class="modalLabel"> <br/></td>
            <td align="right" class="modalLabel"> <asp:button id="DisplaySettingButton" runat="server" onclick="DisplaySettingButton_Click"  text="Apply" />  </td>
            <td align="left" class="modalLabel"> <asp:button id="DisplaySettingCloseButton" runat="server" onclick="DisplaySettingCloseButton_Click" text="Close" /> </td>
            <td align="right" class="modalLabel">  <br/>  </td>
            <td align="left" class="modalLabel"> <br/> </td>
            
            </tr>
            
            <tr>
            <td align="right" class="modalLabel">
            <br/>
            </td>
            <td align="left" class="modalLabel"> <br/></td>
            <td align="right" class="modalLabel">
            <br/>       
            </td>
            <td align="left" class="modalLabel"> <br/> </td>
            <td align="right" class="modalLabel">
            <br/>              
            </td>
            <td align="left" class="modalLabel"> <br/> </td>
            
            </tr>          

            </table>
                  
                  

            </asp:panel>
            
                     
            <asp:button id="ShowAdvanceSearchPopupButton" runat="server" style="display: none" />
            <asp:modalpopupextender id="AdvanceSearch_Modalpopupextender" runat="server" targetcontrolid="ShowAdvanceSearchPopupButton"
            popupcontrolid="AdvanceSearch_Panel" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
            popupdraghandlecontrolid="trSearch">
            </asp:modalpopupextender>
            
            
            <asp:panel id="AdvanceSearch_Panel" runat="server" backcolor="#E3E3E3" width="500px" defaultbutton="SearchButton"
            >

              
        
            <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
            <tr id="trSearch" style="background-color: #4b6c9e; cursor: move;">
                
                
            <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
            <%= transaction_title %>
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
            datatextfield="ModelType" 
            datavaluefield="ModelTypeId">
            </asp:dropdownlist>
           <%--
            datasourceid="FindModelTypeSqlDataSource"
            <asp:sqldatasource id="FindModelTypeSqlDataSource" runat="server" 
            connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
            selectcommand="<%# sql_vehicle_model %>">
            </asp:sqldatasource>--%>
                                                
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
            selectcommand="SELECT '0' AS [Alias], '[Select Owner]' AS [CompanyName] UNION SELECT [Alias], [CompanyName] + ' (' + [Alias] + ')' AS [CompanyName] FROM [Companies] where LEN(isnull(CompanyName,''))>0">
            </asp:sqldatasource>
                        
            </td>
            </tr>
            <tr id="trFitnessDate" >
            <td align="left" class="modalLabel">
                Fitness Expire Date from</td>
            <td align="left">
            <asp:textbox id="txtFindFitnessDateFrom" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextendertxtFindFitnessDate" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindFitnessDateFrom">
            </asp:calendarextender>    To
            
            <asp:textbox id="txtFindFitnessDateTo" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextendertxtFindFitnessDateTo" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindFitnessDateTo">
            </asp:calendarextender>        
            </td>
            </tr>  
             <tr id="trTaxDate" >
            <td align="left" class="modalLabel">
                TAX Expire Date from
            </td>
            <td align="left">
            <asp:textbox id="txtFindTaxDateFrom" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextendertxtFindTaxDate" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindTaxDateFrom">
            </asp:calendarextender>    To
            
            <asp:textbox id="txtFindTaxDateTo" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextendertxtFindTaxDateTo" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindTaxDateTo">
            </asp:calendarextender>    
                        
            </td>
            </tr>                        
            <tr>
            <td align="left" class="modalLabel">
                Insurance Expire Date from</td>
            <td align="left">

            <asp:textbox id="txtFindInsuranceDateFrom" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextenderFindInsuranceDateFrom" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindInsuranceDateFrom">
            </asp:calendarextender>   To

            <asp:textbox id="txtFindInsuranceDateTo" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextenderFindInsuranceDateTo" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindInsuranceDateTo">
            </asp:calendarextender>   
                &nbsp;</td>
            </tr>
             <tr id="trRoadPermitDate"  >
            <td align="left" class="modalLabel">
                Road Permit Expire Date from</td>
            <td align="left">
            <asp:textbox id="txtFindRoadPermitDateFrom" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextendertxtFindRoadPermitDate" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindRoadPermitDateFrom">
            </asp:calendarextender>    To
            
            <asp:textbox id="txtFindRoadPermitDateTo" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:calendarextender id="CalendarextendertxtFindRoadPermitDateTo" runat="server"  format="yyyy-MM-dd"
            enabled="True" targetcontrolid="txtFindRoadPermitDateTo">
            </asp:calendarextender>     
            </td>
            </tr>


            <tr id="tr2" >
            <td align="left" class="modalLabel">
            Fitness Date Expire After
            </td>
            <td align="left">
            <asp:textbox id="txtFindFitnessDate" runat="server" cssclass="textEntry" width="50px" maxlength="4"></asp:textbox>
            <asp:Label ID="Label2" runat="server" > Days </asp:Label>
                        
            </td>
            </tr>  
             <tr id="tr4" >
            <td align="left" class="modalLabel">
            TAX Date Expire After
            </td>
            <td align="left">
            <asp:textbox id="txtFindTaxDate" runat="server" cssclass="textEntry" width="50px" maxlength="4"></asp:textbox>
            <asp:Label ID="Label4" runat="server" > Days </asp:Label>
                        
            </td>
            </tr>                        
            <tr>
            <td align="left" class="modalLabel">
            Insurance Date Expire After
            </td>
            <td align="left">
            <asp:textbox id="txtFindInsuranceDate" runat="server" cssclass="textEntry" width="50px" maxlength="4"></asp:textbox>
            <asp:Label ID="Label" runat="server" > Days </asp:Label>
                        
            </td>
            </tr>
             <tr id="tr5"  >
            <td align="left" class="modalLabel">
            Road Permit Date Expire After
            </td>
            <td align="left">
            <asp:textbox id="txtFindRoadPermitDate" runat="server" cssclass="textEntry" width="50px" maxlength="4"></asp:textbox>
            <asp:Label ID="Label3" runat="server" > Days </asp:Label>
                        
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
            <asp:listitem value="Marketing">Marketing</asp:listitem>
            <asp:listitem value="Field Purpose">Field Purpose</asp:listitem>
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
                        Search String</td>
                    <td align="left">
                        <asp:TextBox ID="txtFindSearch" runat="server" cssclass="textEntry" 
                            maxlength="50"></asp:TextBox>
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
           <asp:listitem value="In Active">In Active</asp:listitem>
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
            cellpadding="3" onselectedindexchanged="VehicleGridView_SelectedIndexChanged">
            <columns>
                 
           <%-- <asp:boundfield datafield="DepartmentName" headertext="Department" sortexpression="DepartmentName" 
            headerstyle-font-bold="false">
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>--%>

            <asp:boundfield datafield="RegNo" headertext="Reg No" sortexpression="RegNo" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>
            </asp:boundfield>
            <asp:boundfield datafield="RegDate" headertext="Reg Date" sortexpression="RegDate"
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>
            </asp:boundfield>

            <asp:boundfield datafield="VehicleType" headertext="Vehicle Type" sortexpression="VehicleType" 
            headerstyle-font-bold="false" > 
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="ModelType" headertext="Model Type" sortexpression="ModelType" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="FuelType" headertext="Fuel Type" sortexpression="FuelType" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="VehicleOwner" headertext="Owner" sortexpression="VehicleOwner" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="SupplierName" headertext="Supplier Name" sortexpression="SupplierName" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="SupplierAddress" headertext="Address" sortexpression="SupplierAddress" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="PurchasePrice" headertext="Unit Price" sortexpression="PurchasePrice" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="UserName" headertext="User Name & File No." sortexpression="UserName"
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>
            </asp:boundfield>

            <asp:boundfield datafield="MobileNo" headertext="Mobile #" sortexpression="MobileNo" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="DesignationName" headertext="Designation" sortexpression="DesignationName" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="LocationName" headertext="Location" sortexpression="LocationName" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="HandOverDate" headertext="Handover Date" sortexpression="HandOverDate" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="HandOverType" headertext="HandOver Type" sortexpression="HandOverType"  
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="UserCompany" headertext="User Company" sortexpression="UserCompany" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="EngineNo" headertext="Engine No" sortexpression="EngineNo" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="ChechisNo" headertext="Chechis No" sortexpression="ChechisNo" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="VehicleColor" headertext="Vehicle Color" sortexpression="VehicleColor" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="EngineCapacity" headertext="Engine Capacity" sortexpression="EngineCapacity" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="TireSize" headertext="Tire Size" sortexpression="TireSize" 
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>                   
            </asp:boundfield>

            <asp:boundfield datafield="FitnessDate" headertext="Fitness Date" sortexpression="FitnessDate"
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>
            <ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:boundfield>

                    
                <asp:TemplateField HeaderText="Department" SortExpression="Departmentname" HeaderStyle-Width="10px">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Departmentname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Departmentname") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle Width="10px"></HeaderStyle>
                </asp:TemplateField>
            
                    
            <asp:boundfield datafield="TaxDate" headertext="TAX Date" sortexpression="TaxDate"
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>
            <ItemStyle HorizontalAlign="Right"></ItemStyle>
            </asp:boundfield>

            <asp:boundfield datafield="InsuranceDate" headertext="Ins. Date" sortexpression="InsuranceDate"
            headerstyle-font-bold="false" >
            <HeaderStyle Font-Bold="False"></HeaderStyle>
            <ItemStyle HorizontalAlign="Left"></ItemStyle>
            </asp:boundfield>

            <asp:boundfield datafield="RoadPermitDate" headertext="RP Date" sortexpression="RoadPermitDate"
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

<SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

<SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

<SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

<SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
            </asp:gridview>
           
           <%--
             datasourceid="ModelTypeSqlDataSource"
            <asp:sqldatasource id="ModelTypeSqlDataSource" runat="server" 
            connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
            selectcommand="SELECT 0 AS [ModelTypeId], '[Select Model Type]' AS [ModelType] UNION SELECT  ModelTypeId, ModelType FROM [ModelType] where VehicleType=1">
            </asp:sqldatasource>--%>
            </fieldset>
            </div>

            <asp:button id="ShowPopupButton" runat="server" style="display: none" />
            <asp:modalpopupextender id="VehicleModalPopupExtender" runat="server" targetcontrolid="ShowPopupButton"
            popupcontrolid="pnlpopup" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
            popupdraghandlecontrolid="trVehicles">
            </asp:modalpopupextender>
            
            <asp:panel id="pnlpopup" runat="server" backcolor="#CDCBBD" width="650px" Height="600px" defaultbutton="SaveButton"
            style="display: inline " cssclass="bold" horizontalalign="Center" 
                    scrollbars="Auto">

        
    
        
           
        
            <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
            <tr id="trVehicles" style="background-color: #4b6c9e; cursor: move;">
                
                
            <th colspan="2" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
            <%= transaction_title %>
            </th>
            <th align="right">
            <asp:button id="CancelButton" runat="server" text=" X " font-bold="true" />
            </th>

                
            </tr>

            <tr>
            <td align="left" class="modalLabel" colspan="2">
             <asp:Label ID="lblMessege" runat="server" Text="" ForeColor="Red"></asp:Label>
          
            </td>
            </tr>
            

            <tr>
            <td align="left" class="modalLabel">
            <br /> 
            </td>
            </tr>
            <tr>
            <td align="left" class="modalLabel">
            Vehicle Type
            </td>
            <td align="left">
            <asp:dropdownlist id="VehicleType" runat="server" cssclass="comboEntry">
            <asp:listitem value="0">[Select Vehicle Type]</asp:listitem>
            <asp:listitem value="Car">Car</asp:listitem>
            <asp:listitem value="Micro">Micro</asp:listitem>
            <asp:listitem value="Picup">Pickup</asp:listitem>
            <asp:listitem value="Jeep">Jeep</asp:listitem>
            <asp:listitem value="Motorcycle">Motorcycle</asp:listitem>
                            
            </asp:dropdownlist>
            <asp:comparevalidator id="VehicleType_CompareValidator" runat="server" 
            controltovalidate="VehicleType" display="None" 
            errormessage="&lt;b&gt;Vehicle Type&lt;/b&gt; is required." operator="NotEqual" 
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
            
             <asp:RegularExpressionValidator id="expValidatorRegDate" runat="server" 
            controltovalidate="RegDate" display="Dynamic" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$" 
            errormessage=" Date Format must be Month/Day/Year." validationgroup="Submit">
            </asp:RegularExpressionValidator>

            
            <asp:validatorcalloutextender id="RegDate_Requiredfieldvalidator_Validatorcalloutextender" 
            runat="server" enabled="True" highlightcssclass="validatorCalloutHighlight" 
            targetcontrolid="RegDate_RequiredFieldValidator">
            </asp:validatorcalloutextender>
            <asp:maskededitextender id="RegDate_MaskedEditExtender" runat="server" 
            enabled="True" mask="99/99/9999" masktype="Date" 
            onfocuscssclass="MaskedEditFocus" oninvalidcssclass="MaskedEditError" 
            targetcontrolid="RegDate">
            </asp:maskededitextender>
            <asp:calendarextender id="RegDate_CalendarExtender" runat="server"  format="MM/dd/yyyy"
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
            datatextfield="ModelType" 
            datavaluefield="ModelTypeId">
            </asp:dropdownlist>
            <%--
             datasourceid="ModelTypeSqlDataSource"
            <asp:sqldatasource id="ModelTypeSqlDataSource" runat="server" 
            connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
            selectcommand="SELECT 0 AS [ModelTypeId], '[Select Model Type]' AS [ModelType] UNION SELECT  ModelTypeId, ModelType FROM [ModelType] where VehicleType=1">
            </asp:sqldatasource>--%>

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
            Fitness Date
            </td>
            <td align="left">
            <asp:textbox id="FitnessDate" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:maskededitextender id="FitnessDate_Maskededitextender" runat="server" 
            enabled="True" mask="99/99/9999" masktype="Date" 
            onfocuscssclass="MaskedEditFocus" oninvalidcssclass="MaskedEditError" 
            targetcontrolid="FitnessDate">
            </asp:maskededitextender>
             <asp:RegularExpressionValidator id="RegularExpressionValidatorFitnessDate" runat="server" 
            controltovalidate="FitnessDate" display="Dynamic" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$" 
            errormessage=" Date Format must be Month/Day/Year." validationgroup="Submit">
            </asp:RegularExpressionValidator>
            <asp:calendarextender id="FitnessDateCalendarextender" runat="server"  format="MM/dd/yyyy"
            enabled="True" targetcontrolid="FitnessDate">
            </asp:calendarextender>
            </td>
            </tr>
            <tr>
            <td align="left" class="modalLabel">
            TAX Date
            </td>
            <td align="left">
            <asp:textbox id="TaxDate" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:maskededitextender id="TaxDate_Maskededitextender" runat="server" 
            enabled="True" mask="99/99/9999" masktype="Date" 
            onfocuscssclass="MaskedEditFocus" oninvalidcssclass="MaskedEditError" 
            targetcontrolid="TaxDate">
            </asp:maskededitextender>
             <asp:RegularExpressionValidator id="RegularExpressionValidatorTaxDate" runat="server" 
            controltovalidate="TaxDate" display="Dynamic" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$" 
            errormessage=" Date Format must be Month/Day/Year." validationgroup="Submit">
            </asp:RegularExpressionValidator>

            <asp:calendarextender id="TaxDateCalendarextender" runat="server"  format="MM/dd/yyyy"
            enabled="True" targetcontrolid="TaxDate">
            </asp:calendarextender>
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
             <asp:RegularExpressionValidator id="RegularExpressionValidatorInsuranceDate" runat="server" 
            controltovalidate="InsuranceDate" display="Dynamic" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$" 
            errormessage=" Date Format must be Month/Day/Year." validationgroup="Submit">
            </asp:RegularExpressionValidator>
            <asp:calendarextender id="InsuranceDateCalendarextender" runat="server"  format="MM/dd/yyyy"
            enabled="True" targetcontrolid="InsuranceDate">
            </asp:calendarextender>

            </td>
            </tr>
            <tr>
            <td align="left" class="modalLabel">
            Road Permit Date
            </td>
            <td align="left">
            <asp:textbox id="RoadPermitDate" runat="server" cssclass="textEntry" width="100px" maxlength="50"></asp:textbox>
            <asp:maskededitextender id="RoadPermitDateMaskededitextender" runat="server" 
            enabled="True" mask="99/99/9999" masktype="Date" 
            onfocuscssclass="MaskedEditFocus" oninvalidcssclass="MaskedEditError" 
            targetcontrolid="RoadPermitDate">
            </asp:maskededitextender>
             <asp:RegularExpressionValidator id="RegularExpressionValidatorRoadPermitDate" runat="server" 
            controltovalidate="RoadPermitDate" display="Dynamic" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$" 
            errormessage=" Date Format must be Month/Day/Year." validationgroup="Submit">
            </asp:RegularExpressionValidator>
            <asp:calendarextender id="RoadPermitDateCalendarextender" runat="server" 
            enabled="True"  format="MM/dd/yyyy" targetcontrolid="RoadPermitDate">
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
            User
            </td>
            <td align="left">
            <asp:dropdownlist id="ddlUser" runat="server" cssclass="comboEntry"  datasourceid="VehicleUserSqlDataSource"
            datatextfield="UserName" datavaluefield="UserId"  >
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

            <asp:RegularExpressionValidator id="RegularExpressionValidatorHandOverDate" runat="server" 
            controltovalidate="HandOverDate" display="Dynamic" ForeColor="Red" ValidationExpression="^([0]\d|[1][0-2])\/([0-2]\d|[3][0-1])\/([2][01]|[1][6-9])\d{2}(\s([0-1]\d|[2][0-3])(\:[0-5]\d){1,2})?$" 
            errormessage=" Date Format must be Month/Day/Year." validationgroup="Submit">
            </asp:RegularExpressionValidator>

            <asp:maskededitextender id="HandOverDateMaskededitextender" runat="server" mask="99/99/9999"
            masktype="Date" enabled="True" targetcontrolid="HandOverDate" onfocuscssclass="MaskedEditFocus"
            oninvalidcssclass="MaskedEditError">
            </asp:maskededitextender>
            
            <asp:calendarextender id="HandOverDateCalendarextender" runat="server" enabled="True"  format="MM/dd/yyyy"
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
            <asp:listitem value="Marketing">Marketing</asp:listitem>
            <asp:listitem value="Field Purpose">Field Purpose</asp:listitem>
            </asp:dropdownlist>
            <asp:comparevalidator id="ddlHandOverType_Comparevalidator" runat="server" errormessage="<b>Hand Over As</b> is required."
            controltovalidate="ddlHandOverType" valuetocompare="0" operator="NotEqual" validationgroup="Handover"
            display="None"></asp:comparevalidator>
            <asp:validatorcalloutextender id="ddlHandOverType_Comparevalidator_Validatorcalloutextender"
            runat="server" enabled="True" targetcontrolid="ddlHandOverType_Comparevalidator"
            highlightcssclass="validatorCalloutHighlight">
            </asp:validatorcalloutextender>

            <%--<asp:comparevalidator id="ddlHandOverType_Comparevalidator1" runat="server" errormessage="<b>Hand Over Type</b> is required."
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
            <asp:listitem value="In Active">In Active</asp:listitem>
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
            
            </td>
            <td align="left">
            <asp:button id="SaveButton" runat="server" onclick="SaveButton_Click"  text="Submit" validationgroup="Submit" />
            <asp:button id="HandoverButton" runat="server" onclick="HandoverButton_Click" text="Handover" validationgroup="Handover" />
            <asp:button id="VacantButton" runat="server" onclick="VacantButton_Click" text="Vacant" />   
           
            </td>
                    
                    
            </tr>
            
                  
            </table>
                             

            </asp:panel>
     
            </asp:content>
