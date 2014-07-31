<%@ Page Title="" Language="C#" MasterPageFile="~/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="PaymentRequisition.aspx.cs" Inherits="HR.WEB.UI.PaymentRequisition" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ShowMessage(message) {
                    alert(message);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblErrorMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
    <table>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdAddAction" runat="server">
                
                <ContentTemplate>
                <div id="inputdivbig" class="lbl">
                    <u>Requisition Form:</u>
                    <table class="table_Style">
                        <tr>
                            <td class="lbl">
                                Employee
                            </td>
                            <td class="lbl2">
                                :
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtEmployee" CssClass="input_Box" runat="server" Enabled="false">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">
                                Requisition for
                            </td>
                            <td class="lbl2">
                                :
                            </td>
                            <td>
                                <telerik:RadComboBox ID="cmbRequisitionfor" runat="server">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">
                                Party/Vendor
                            </td>
                            <td class="lbl2">
                                :
                            </td>
                            <td>
                                <telerik:RadComboBox ID="cmbParty" runat="server">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">
                                Challan No.
                            </td>
                            <td class="lbl2">
                                :
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtChallanNo" CssClass="input_Box" runat="server">
                                </telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">
                                Requisition Amount
                            </td>
                            <td class="lbl2">
                                :
                            </td>
                            <td>
                                <telerik:RadNumericTextBox ID="numRequisitionAmount" CssClass="input_Box" runat="server">
                                </telerik:RadNumericTextBox>
                                <asp:RequiredFieldValidator ID="valRequisitionAmount" ValidationGroup="addAction" ControlToValidate="numRequisitionAmount" runat="server" ForeColor="Red"  ErrorMessage="Amount Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">
                                Purpose of Requisition
                            </td>
                            <td class="lbl2">
                                :
                            </td>
                            <td>
                                <telerik:RadTextBox ID="txtPurpose" CssClass="input_Box" runat="server">
                                    <EnabledStyle CssClass="input_Box" />
                                </telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="valPurpose" runat="server" ValidationGroup="addAction"  ControlToValidate="txtPurpose" ForeColor="Red" ErrorMessage="Pourpose Required"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="lbl">
                            </td>
                            <td class="lbl2">
                            </td>
                            <td>
                                <asp:Button CssClass="btn" ID="btnApply" runat="server" ValidationGroup="addAction" Text="Apply" OnClick="btnApply_Click" />
                            </td>
                        </tr>
                    </table>
                    <u>Balance Status:</u>
                    <div id="griddiv">
                        <telerik:RadGrid ID="rdgBalanceStatus" runat="server" AutoGenerateColumns="false"
                            ShowHeader="true" ShowFooter="true">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" UniqueName="Status"
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Amount" HeaderText="Amount" UniqueName="Amount"
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Remarks" HeaderText="Remarks" UniqueName="Remarks"
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:Label ID="Label1" runat="server" ForeColor="#5C8AE6" Text="Total="></asp:Label>
                                        <asp:Label ID="lblTotal" runat="server" ForeColor="#5C8AE6"></asp:Label>
                    </div>
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
        
            <td>
            <asp:UpdatePanel ID="UpdSearch" runat="server">
                
                <ContentTemplate>
                <div id="inputdivbig2" class="lbl">
                    <u>Search for Applied Requisition:</u>
                    <table class="table_Style">
                        <tr>
                            <td class="lbl">
                                From Date :
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="dtpFromDate" runat="server" AutoPostBack="False">
                                    <DateInput ID="FromDateInput" DateFormat="dd MMM yyyy" runat="server" SelectedDate="2010-12-27">
                                    </DateInput>
                                </telerik:RadDatePicker>
                            </td>
                            <td class="lbl2">
                            </td>
                            <td class="lbl2">
                            </td>
                            <td class="lbl">
                                To Date :
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="dtpToDate" runat="server" AutoPostBack="False">
                                    <DateInput ID="ToDateInput" DateFormat="dd MMM yyyy" runat="server" SelectedDate="2010-12-27">
                                    </DateInput>
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" CssClass="btnRight" runat="server" Text="Search" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                    </table>
                    <div id="griddiv">
                        <telerik:RadGrid ID="rdgAppliedRequisition" runat="server" AutoGenerateColumns="false"
                            ShowHeader="true" ShowFooter="true">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="RequisitionNo" HeaderText="Requisition No." UniqueName="Status"
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Date" HeaderText="Date" UniqueName="Date" HeaderStyle-Font-Bold="true"
                                        HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Amount" HeaderText="Amount" UniqueName="Amount" 
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Purpose" HeaderText="Purpose" UniqueName="Purpose"
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Status" HeaderText="Status" UniqueName="Status"
                                        HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="9.5pt">
                                        <HeaderStyle HorizontalAlign="Left" Width="10%" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                        <asp:Label ID="Label3" runat="server" ForeColor="#5C8AE6" Text="Total Count:"></asp:Label>
                                <asp:Label ID="lblCountSearch" runat="server" ForeColor="#5C8AE6"></asp:Label>
                                &nbsp;&nbsp;
                                <asp:Label ID="Label5" runat="server" ForeColor="#5C8AE6" Text="Total Amount:"></asp:Label>
                                <asp:Label ID="lblTotalAmountSearch" runat="server" ForeColor="#5C8AE6"></asp:Label>
                    </div>
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
