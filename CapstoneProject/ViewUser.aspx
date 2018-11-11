<%@ Page Language="C#" Title="View Users" AutoEventWireup="true" CodeFile="ViewUser.aspx.cs" Inherits="ViewUser" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

   <div class="row">
       <div class="col-lg-12">
            <h2 class="page-header"><i class="fa fa-user icons"></i>View Users</h2>
        </div>
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_ViewUser" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="User ID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="User ID" ItemStyle-Width="5%"/>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" ItemStyle-Width="10%"/>
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
    
    <asp:SqlDataSource ID="SqlDataSource_ViewUser" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [UserID] as 'User ID', [Username] FROM [Users] ORDER BY [UserID]"></asp:SqlDataSource>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

