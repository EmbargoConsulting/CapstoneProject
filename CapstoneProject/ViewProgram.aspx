<%@ Page Language="C#" Title="Programs" AutoEventWireup="true" CodeFile="ViewProgram.aspx.cs" Inherits="ViewProgram" MasterPageFile="~/Program.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">
    <div class="col-lg-3">
        <asp:DropDownList OnSelectedIndexChanged="ddlViewOptions_SelectedIndexChanged" AutoPostBack="true" ID="ddlViewOptions" CssClass="form-control" runat="server">
            <asp:ListItem Value="0"> All Programs</asp:ListItem>
            <asp:ListItem Value="1">Program Statistics - Monthly</asp:ListItem>
            <asp:ListItem Value="2"> Live Programs</asp:ListItem>
            <%--<asp:ListItem Value="3">View Live Programs</asp:ListItem>--%>
        </asp:DropDownList>
    </div>
    <div style="height: 50px;"></div>
    <div class="col-lg-10">


        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Program ID" DataSourceID="SqlDataSource_ViewProgram" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Organization Name" HeaderText="Organization Name" SortExpression="Organization Name" ItemStyle-Width="10%" />                        
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
                <asp:GridView ID="GridView3" AllowSorting="true" AllowPaging="true" runat="server" AutoGenerateColumns="false" CellPadding="4" DataSourceID="datasourceLivePrograms" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
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
                <asp:GridView ID="GridView4" AllowPaging="true" runat="server" AutoGenerateColumns="true" CellPadding="4" DataSourceID="datasourceProgramOverview" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
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

        <asp:SqlDataSource ID="SqlDataSource_ViewProgram" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT Program.ProgramID AS 'Program ID', Organization.OrganizationName as 'Organization Name', Program.ProgramTheme AS 'Theme', Program.DateTime AS 'Date and Time', Program.ChildAttendance AS 'Child Attendance',  Program.AdultAttendance AS 'Adult Attendance' FROM Program LEFT OUTER JOIN Invoice ON Program.ProgramID = Invoice.ProgramID LEFT OUTER JOIN Organization ON Invoice.OrganizationID = Organization.OrganizationID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="datasourceProgramOverview" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT datename(month, program.datetime) as 'Month', COUNT(LiveProgram.ProgramID) as 'Live Programs', Count(OnlineProgram.ProgramID) as 'Online Programs', Count(*) as 'Total Programs', SUM(Program.ChildAttendance) as 'Child Attendance', SUM(Program.AdultAttendance) 'Adult Attendance', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) as 'Total Attendance' FROM LiveProgram FULL OUTER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID FULL OUTER JOIN OnlineProgram ON Program.ProgramID = OnlineProgram.ProgramID GROUP BY datename(month, program.datetime)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dataSourceLivePrograms" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT Program.ProgramTheme as 'Program Theme', Program.DateTime as 'Date', Program.ChildAttendance as 'Child Attendance', Program.AdultAttendance as 'Adult Attendance', LiveProgram.Status, LiveProgram.Address, LiveProgram.City, LiveProgram.County, LiveProgram.OnOffSite FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID"></asp:SqlDataSource>

    </div>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>
