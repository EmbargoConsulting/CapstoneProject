<%@ Page Language="C#" Title="Programs" AutoEventWireup="true" CodeFile="ViewProgram.aspx.cs" Inherits="ViewProgram" MasterPageFile="~/Program.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">
    <div class="col-lg-3">
        <asp:DropDownList OnSelectedIndexChanged="ddlViewOptions_SelectedIndexChanged" AutoPostBack="true" ID="ddlViewOptions" CssClass="form-control" runat="server">
            <asp:ListItem Value="0"> All Programs</asp:ListItem>
            <asp:ListItem Value="1">Program Statistics - Monthly</asp:ListItem>
            <asp:ListItem Value="2"> Live Programs</asp:ListItem>
            <asp:ListItem Value ="3"> Online Programs</asp:ListItem>
            <%--<asp:ListItem Value="3">View Live Programs</asp:ListItem>--%>
        </asp:DropDownList>

        
        <div class="btn-group">
            <asp:Button ID="btnInvoice" formnovalidate="formnovalidate" OnClientClick ="return false"  runat="server" Text="Add Invoice" CssClass="btn btn-primary" data-toggle="modal" data-target="#invoiceModal" Visible="false" OnClick="btnInvoice_Click"></asp:Button>
        </div>
         
    </div>
   
  
    <div style="height: 50px;"></div>
    <div class="col-lg-10">


        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Program ID" DataSourceID="SqlDataSource_ViewProgram" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Theme" HeaderText="Theme" SortExpression="Theme" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Date and Time" HeaderText="Date and Time" SortExpression="Date and Time" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Child Attendance" HeaderText="Children" SortExpression="Child Attendance" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Adult Attendance" HeaderText="Adults" SortExpression="Adult Attendance" ItemStyle-Width="10%" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </asp:View>

            <asp:View ID="View2" runat="server">
                <asp:GridView ID="GridView2" AllowPaging="true" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datasourceProgramOverview" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Live Programs" HeaderText="Live Programs" SortExpression="Live Programs" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Online Programs" HeaderText="Online Programs" SortExpression="Online Programs" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Total Programs" HeaderText="Total Programs" SortExpression="Total Programs" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Child Attendance" HeaderText="Children" SortExpression="Child Attendance" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Adult Attendance" HeaderText="Adults" SortExpression="Adult Attendance" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Total Attendance" HeaderText="Total Attendance" SortExpression="Total Attendance" ItemStyle-Width="10%" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:GridView ID="GridView3" AllowSorting="True" AllowPaging="True" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datasourceLivePrograms" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Program Theme" HeaderText="Program Theme" SortExpression="Program Theme" />
                        <asp:BoundField DataField="Date" HeaderText="Date/Time" SortExpression="Date" />
                        <asp:BoundField DataField="Child Attendance" HeaderText="Children" SortExpression="Child Attendance" />

                        <asp:BoundField DataField="Adult Attendance" HeaderText="Adults" SortExpression="Adult Attendance" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Address" HeaderText="Street" SortExpression="Address" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />                    
                        <asp:BoundField DataField="OnOffSite" HeaderText="On/Off Site" SortExpression="OnOffSite" />
                        <asp:TemplateField HeaderText="Add Invoice">
                            <ItemTemplate>
                                <asp:CheckBox ID="SelectCheckBox" runat="server"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <asp:GridView ID="GridViewOnlinePrograms" AllowPaging="true" AllowSorting="true" runat="server" AutoGenerateColumns="false" CellPadding="4" DataSourceID="datasourceOnlinePrograms" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProgramType" HeaderText="Type" SortExpression="ProgramType" />
                        <asp:BoundField DataField="ProgramTheme" HeaderText="Theme" SortExpression="ProgramTheme" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                        <asp:BoundField DataField="DateTime" HeaderText="Date/Time" SortExpression="DateTime" />
                        <asp:BoundField DataField="ChildAttendance" HeaderText="Children" SortExpression="ChildAttendance" />
                        <asp:BoundField DataField="AdultAttendance" HeaderText="Adults" SortExpression="AdultAttendance" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </asp:View>
        </asp:MultiView>

        <asp:SqlDataSource ID="SqlDataSource_ViewProgram" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [ProgramID] as 'Program ID', [ProgramTheme] as 'Theme', [DateTime] as 'Date and Time', [ChildAttendance] 'Child Attendance', [AdultAttendance] as 'Adult Attendance' FROM [Program]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="datasourceProgramOverview" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT DATEPART(MONTH,Program.DateTime), datename(month, program.datetime) as 'Month', COUNT(LiveProgram.ProgramID) as 'Live Programs', Count(OnlineProgram.ProgramID) as 'Online Programs', Count(*) as 'Total Programs', SUM(Program.ChildAttendance) as 'Child Attendance', SUM(Program.AdultAttendance) 'Adult Attendance', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) as 'Total Attendance' FROM LiveProgram FULL OUTER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID FULL OUTER JOIN OnlineProgram ON Program.ProgramID = OnlineProgram.ProgramID GROUP BY datename(month, program.datetime), DATEPART(MONTH,Program.DateTime) ORDER BY DATEPART(MONTH,Program.DateTime) asc"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dataSourceLivePrograms" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT Program.ProgramTheme as 'Program Theme', Program.DateTime as 'Date', Program.ChildAttendance as 'Child Attendance', Program.AdultAttendance as 'Adult Attendance', LiveProgram.Status, LiveProgram.Address, LiveProgram.City, LiveProgram.County, LiveProgram.OnOffSite FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="datasourceOnlinePrograms" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT OnlineProgram.ProgramType, Program.ProgramTheme, OnlineProgram.State, OnlineProgram.Country, Program.DateTime, Program.ChildAttendance, Program.AdultAttendance FROM OnlineProgram INNER JOIN Program ON OnlineProgram.ProgramID = Program.ProgramID"></asp:SqlDataSource>

    </div>


    <!-- Modal for Invoices -->
     <div class="modal fade" id="invoiceModal" tabindex="-1" role="dialog" aria-labelledby="animalModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 400px;" role="document">
            <div class="modal-content">
                <div class="modal-header">                    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="invoiceModalLabel">Add an Invoice</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label">Invoice Code</label>
                        <asp:TextBox ID="txtInvoiceCode" runat="server" class="form-control" required="required"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">Total Cost</label>
                        <asp:TextBox ID="txtTotalCost" runat="server" class="form-control" required="required"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">Has Payment Been Recieved?</label>
                        <asp:DropDownList ID="ddlInvoicePayment" runat="server" required="required" class="form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div id="btn">
                        <asp:Button ID="btnSaveInvoice" runat="server" CssClass="btn btn-success btn-group-justified" Text="Save Invoice"  OnClick="btnSaveInvoice_Click"/><br />
                    </div>
                    <div id="btn2">
                        <asp:Button visible="false" ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-danger" CausesValidation="false" Text="Clear Fields" formnovalidate="formnovalidate" OnClick="btnClearAllModal_Click"/>
                    </div>


                </div>
            </div>
        </div>
    </div>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>
