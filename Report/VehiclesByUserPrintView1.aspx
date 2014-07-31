<%@ page language="C#" autoeventwireup="true" codebehind="VehiclesByUserPrintView1.aspx.cs"
    inherits="VehicleMaintenanceSystem.Report.VehiclesByUserPrintView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vehicle List</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-color: White;">
    <form id="form1" runat="server">
    <div>
        <fieldset class="vehicle">
            <legend>Vehicle List</legend>
            <asp:gridview id="VehicleListGridView" runat="server" autogeneratecolumns="False"
                width="100%" 
                onrowdatabound="VehicleListGridView_RowDataBound">
                <columns>
                    <asp:templatefield headertext="SL." headerstyle-font-bold="false" itemstyle-horizontalalign="Center">
                        <itemtemplate>
                            <asp:label id="SL" runat="server"></asp:label>
                        </itemtemplate>
                    </asp:templatefield>

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

            <asp:boundfield datafield="UserName" headertext="User Name" sortexpression="UserName"
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

            <asp:boundfield datafield="DepartmentName" headertext="Department" sortexpression="DepartmentName" 
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

                    <%--<asp:boundfield datafield="RegNo" headertext="Registration No." sortexpression="RegNo"
                        headerstyle-font-bold="false" />
                    <asp:boundfield datafield="RegDate" headertext="RegDate" sortexpression="RegDate"
                        headerstyle-font-bold="false" />
                    <asp:boundfield datafield="UserName" headertext="User Name" readonly="True" sortexpression="UserName"
                        headerstyle-font-bold="false" />
                    <asp:boundfield datafield="Owner" headertext="Owners" sortexpression="Owner" headerstyle-font-bold="false" />
                    <asp:boundfield datafield="ModelType" headertext="Type of Model" sortexpression="ModelType"
                        headerstyle-font-bold="false" />
                    <asp:boundfield datafield="FuelType" headertext="Fuel Type" sortexpression="FuelType"
                        headerstyle-font-bold="false" />
                    <asp:boundfield datafield="Remarks" headertext="Remarks" sortexpression="Remarks"
                        headerstyle-font-bold="false" />--%>
                </columns>
            </asp:gridview>
            
            
           <%-- <asp:sqldatasource id="VehicleListSqlDataSource" runat="server" connectionstring="<%$ ConnectionStrings:ApplicationServices %>"
                selectcommand="SELECT [RegNo], [RegDate], [UserName], [Owner], [ModelType], [FuelType], [Remarks] FROM [vw_VehicleList_By_User] WHERE [Status] = 'In Use'">
            </asp:sqldatasource>--%>


        </fieldset>
    </div>
    </form>
</body>
</html>
