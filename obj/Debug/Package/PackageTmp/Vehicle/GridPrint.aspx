<%@ Page Title="Home Page" Language="C#"  AutoEventWireup="true"
    CodeBehind="GridPrint.aspx.cs" Inherits="VehicleMaintenanceSystem.Vehicle.GridPrint" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>GridView Print</title>
    
    <style type="text/css">
        @media print
        {                
            tHead
            {    
                display : table-header-group;    
                border:solid 1px #000000;
            }
            
            .Logo 
            {
             font-family:Verdana;
             font-size:16px;
             font-weight:bold;
             color:#000000;
            }
            
         }               
     </style>
     
    <script language="javascript" type="text/javascript">

        // Repeate the table header on each page ...
        function AddTHEAD(tableName) {
            var table = document.getElementById(tableName);
            if (table != null) {
                var head = document.createElement("THEAD");
                head.style.display = "table-header-group";
                head.appendChild(table.rows[0]);
                table.insertBefore(head, table.childNodes[0]);
            }
        }   
                                 
     </script>
              
</head>
<body onload="javascript:AddTHEAD('<%=GridView1.ClientID %>');window.print();">
    <form id="form1" runat="server">    
    <div>
        <p style="text-align:center;">
            <asp:Label ID="lblHeader" runat="server" Text="Logo Company Name ..." Font-Bold="True" Font-Size="20px" CssClass="Logo"></asp:Label>
        </p>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
            BorderColor="#5D7B9D" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Center" Width="100%" 
            onrowdatabound="GridView1_RowDataBound">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
