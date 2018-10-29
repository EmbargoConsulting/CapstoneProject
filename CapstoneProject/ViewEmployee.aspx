<%@ Page Language="C#" Title="View Employee" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="ViewEmployee" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

    <h2 class="page-header">View Employees</h2>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"  CellPadding="4" DataKeyNames="Employee ID" DataSourceID="SqlDataSource_ViewEmployee" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Employee ID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="Employee ID" ItemStyle-Width="5%"/>
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" ItemStyle-Width="10%"/>
                <asp:BoundField DataField="Middle Name" HeaderText="Middle Name" SortExpression="Middle Name" ItemStyle-Width="10%"/>
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" ItemStyle-Width="10%"/>
                <asp:BoundField DataField="Employee Type" HeaderText="Employee Type" SortExpression="Employee Type" ItemStyle-Width="10%"/>
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
    

    <asp:SqlDataSource ID="SqlDataSource_ViewEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [EmployeeID] as 'Employee ID', [FirstName] as 'First Name', [MiddleName] as 'Middle Name', [LastName] as 'Last Name', [EmployeeType] as 'Employee Type' FROM [Employee]"></asp:SqlDataSource>
    

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

