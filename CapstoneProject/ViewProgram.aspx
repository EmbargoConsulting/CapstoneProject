<%@ Page Language="C#" Title="Programs" AutoEventWireup="true" CodeFile="ViewProgram.aspx.cs" Inherits="ViewProgram" MasterPageFile="~/Program.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">

    <div class="col-lg-10">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Program ID" DataSourceID="SqlDataSource_ViewProgram" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Theme" HeaderText="Theme" SortExpression="Theme" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Date and Time" HeaderText="Date and Time" SortExpression="Date and Time" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Child Attendance" HeaderText="Child Attendance" SortExpression="Child Attendance" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Adult Attendance" HeaderText="Adult Attendance" SortExpression="Adult Attendance" ItemStyle-Width="10%" />
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
        <asp:View ID="View2" runat="server">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Program ID" DataSourceID="SqlDataSource_ViewProgram" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Live Programs" HeaderText="Live Programs" SortExpression="Live Programs" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Online Programs" HeaderText="Online Programs" SortExpression="Online Programs" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Total Programs" HeaderText="Total Programs" SortExpression="Total Programs" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Child Attendance" HeaderText="Child Attendance" SortExpression="Child Attendance" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Adult Attendance" HeaderText="Adult Attendance" SortExpression="Adult Attendance" ItemStyle-Width="10%" />
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


        <asp:SqlDataSource ID="SqlDataSource_ViewProgram" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [ProgramID] as 'Program ID', [ProgramTheme] as 'Theme', [DateTime] as 'Date and Time', [ChildAttendance] 'Child Attendance', [AdultAttendance] as 'Adult Attendance' FROM [Program]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT datename(month, program.datetime) as 'Month', COUNT(LiveProgram.ProgramID) as 'Live Programs', Count(OnlineProgram.ProgramID) as 'Online Programs', Count(*) as 'Total Programs', SUM(Program.ChildAttendance) as 'Child Attendance', SUM(Program.AdultAttendance) 'Adult Attendance', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) as 'Total Attendance' FROM LiveProgram FULL OUTER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID FULL OUTER JOIN OnlineProgram ON Program.ProgramID = OnlineProgram.ProgramID GROUP BY datename(month, program.datetime)"></asp:SqlDataSource>

    </div>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>
