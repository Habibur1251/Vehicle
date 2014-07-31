<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="AdvanceRequisition.aspx.cs" Inherits="HR.WEB.UI.AdvanceRequisition" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="mainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblIDCode" runat="server" Text="ID Code"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtIDCode" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDesignation" runat="server" Text="Designation"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRequisitionAmount" runat="server" Text="Requisition Amount"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtRequisitionAmount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPurposeOfRequisition" runat="server" Text="Purpose of Requisition"></asp:Label>
                </td>
                <td>
                    :
                </td>
                <td>
                    <asp:TextBox ID="txtPurposeOfRequisition" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <telerik:RadGrid ID="grdPreviousAdvance" runat="server" AutoGenerateColumns="False"
                        AllowPaging="True" GridLines="None">
                        <MasterTableView>
                            <Columns>
                                <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn HeaderText="Outstanding as on Today (Amount)  (1)" DataField=" "
                                    UniqueName="OutstandingOnToday">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Bill / MRR In Process With Store (Amount) (2)"
                                    DataField=" " UniqueName="WithStoreAmount">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Under Process With A/C. Dept (Amount) (3)" DataField=" "
                                    UniqueName="ACDepartmentAmount">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Balance (Amount) (1+2+3)" DataField=" " UniqueName="BalanceAmount">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="Remarks" DataField=" " UniqueName="Remarks">
                                </telerik:GridBoundColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
