<%@ page title="Vehicles By User" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true"
    codebehind="VehiclesByUser.aspx.cs" inherits="VehicleMaintenanceSystem.Report.VehiclesByUser" %>

<%--<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
    <style type="text/css">
        .style6
        {
            width: 11px;
        }
        </style>
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">

<asp:toolkitscriptmanager id="VehicleScriptManager" runat="server"> </asp:toolkitscriptmanager>

    <h2>
        Vehicles By User
    </h2>
    <div class="vehicleInfo">
        <fieldset class="vehicle">
            <legend align="bottom">Vehicle List</legend>--%>

<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:content id="Content1" contentplaceholderid="HeadContent" runat="server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="server">
    <asp:toolkitscriptmanager id="VehicleScriptManager" runat="server">
    </asp:toolkitscriptmanager>
    <div class="vehicleInfo">
        <fieldset class="vehicle">
            <legend>Vehicle User</legend>

                        
           <table width="100%" style="border: Solid 1px #CCCCCC; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">                
            <tr id="tr1" style="background-color: #006699;">
            <td align="left" class="modalLabel">
            <asp:linkbutton id="Linkbutton1" runat="server" 
                    onclientclick="javascript:window.open ('VehiclesByUserPrintView.aspx', 'mywindow');" 
                    forecolor="White" onclick="Linkbutton1_Click">Print</asp:linkbutton>
            </td>
            <%--<td align="right" class="modalLabel">
            <asp:linkbutton id="SearchLinkButton" runat="server" forecolor="White" font-bold="true" font-size="Medium" onclick="SearchLinkButton_Click">Advance Search</asp:linkbutton>
            </td>--%>
                                
            </tr>
                             
            </table>    

            
            <asp:button id="ShowGridConfigPopupButton" runat="server" style="display: none" />
            <asp:modalpopupextender id="GridConfig_Modalpopupextender" runat="server" targetcontrolid="ShowGridConfigPopupButton" 
            popupcontrolid="GridConfig_Panel" cancelcontrolid="CancelButton" backgroundcssclass="modalBackground"
            popupdraghandlecontrolid="trSearch">
            </asp:modalpopupextender>


            <asp:panel id="GridConfig_Panel" runat="server" backcolor="White" width="5000px" 
            style="display:inline">

              
        
            <table width="100%" style="border: Solid 3px #4b6c9e; width: 100%; height: 100%"
            cellpadding="0" cellspacing="0">
            <tr id="trSearch" style="background-color: #4b6c9e; cursor: move;">
                
                
            <th colspan="6" align="left" style="color: White; font-weight: bold; padding-left: 5px;">
            Advance Search Form
            </th>
            <th align="right" class="style6">
            <asp:button id="Button2" runat="server" text=" X " font-bold="true" />
            </th>
                                
            </tr>
             
            <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox1" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Reg No</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox2" runat="server" text=" "  textalign="Left" />               
            </td>
            <td align="left" class="modalLabel"> Reg Date </td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox3" runat="server" text=" "  textalign="Left" />               
            </td>
            <td align="left" class="modalLabel"> User Name </td>
            
            </tr>
             <tr>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox4" runat="server" text=" "  />
            </td>
            <td align="left" class="modalLabel"> Owners</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox5" runat="server" text=" "  textalign="Left" />               
            </td>
            <td align="left" class="modalLabel"> Type of Model</td>
            <td align="right" class="modalLabel">
            <asp:checkbox id="CheckBox6" runat="server" text=" "  textalign="Left" />               
            </td>
            <td align="left" class="modalLabel"> Fuel Type </td>
            
            </tr>    
            </table>
                  
                  

            </asp:panel>
            
            
            <asp:gridview id="VehicleListGridView" runat="server" autogeneratecolumns="False" 
                datasourceid="VehicleListSqlDataSource"  width="100%" 
                onrowdatabound="VehicleListGridView_RowDataBound">
                <columns>
                    <asp:templatefield headertext="SL." headerstyle-font-bold="false" itemstyle-horizontalalign="Center">
                        <itemtemplate>
                            <asp:label id="SL" runat="server"></asp:label>
                        </itemtemplate>
                    </asp:templatefield>
                    <asp:boundfield datafield="RegNo" headertext="Registration No." sortexpression="RegNo" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="RegDate" headertext="RegDate" 
                        sortexpression="RegDate" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="UserName" headertext="User Name" readonly="True" 
                        sortexpression="UserName" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="Owner" headertext="Owners" sortexpression="Owner" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="ModelType" headertext="Type of Model" 
                        sortexpression="ModelType" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="FuelType" headertext="Fuel Type" 
                        sortexpression="FuelType" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="Remarks" headertext="Remarks" 
                        sortexpression="Remarks" headerstyle-font-bold="false" />
                </columns>
            </asp:gridview>
            <asp:sqldatasource id="VehicleListSqlDataSource" runat="server" 
                connectionstring="<%$ ConnectionStrings:ApplicationServices %>" 
                selectcommand="SELECT [RegNo], [RegDate], [UserName], [Owner], [ModelType], [FuelType], [Remarks] FROM [vw_VehicleList_By_User] WHERE [Status] = 'In Use'">
            </asp:sqldatasource>
        </fieldset>
    </div>
</asp:content>
