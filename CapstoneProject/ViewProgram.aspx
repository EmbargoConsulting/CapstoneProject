<%@ Page Language="C#" Title="View Programs" AutoEventWireup="true" CodeFile="ViewProgram.aspx.cs" Inherits="ViewProgram" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

    <h2 class="page-header">View Programs</h2>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Program ID" DataSourceID="SqlDataSource_ViewProgram" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Program ID" HeaderText="Program ID" InsertVisible="False" ReadOnly="True" SortExpression="Program ID" ItemStyle-Width="5%" />
            <asp:BoundField DataField="Invoice ID" HeaderText="Invoice ID" SortExpression="Invoice ID" ItemStyle-Width="5%"/>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Date and Time" HeaderText="Date and Time" SortExpression="Date and Time" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Child Attendance" HeaderText="Child Attendance" SortExpression="Child Attendance" ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Adult Attendance" HeaderText="Adult Attendance" SortExpression="Adult Attendance" ItemStyle-Width="10%" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
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
    

    <asp:SqlDataSource ID="SqlDataSource_ViewProgram" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [ProgramID] as 'Program ID', [InvoiceID] as 'Invoice ID', [ProgramName] as 'Name', [ProgramType] as 'Type', [DateTime] as 'Date and Time', [ChildAttendance] 'Child Attendance', [AdultAttendance] as 'Adult Attendance' FROM [Program]"></asp:SqlDataSource>
    

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>