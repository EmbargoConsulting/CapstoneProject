<%@ Page Language="C#" Title="View Animals" AutoEventWireup="true" CodeFile="ViewAnimal.aspx.cs" Inherits="ViewAnimal" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

   
    <h2 class="page-header">View Animals</h2>
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Animal ID" DataSourceID="SqlDataSource_ViewAnimal" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Animal ID" HeaderText="Animal ID" InsertVisible="False" ReadOnly="True" SortExpression="Animal ID"  ItemStyle-Width="5%" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"  ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"  ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species"  ItemStyle-Width="10%"/>
            <asp:BoundField DataField="Checked-In Status" HeaderText="Checked-In Status" SortExpression="Checked-In Status"  ItemStyle-Width="10%"/>
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
        <asp:SqlDataSource ID="SqlDataSource_ViewAnimal" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [AnimalID] as 'Animal ID', [AnimalName] as 'Name', [AnimalType] as 'Type', [AnimalSpecies] as 'Species', [CheckedInStatus] as 'Checked-In Status' FROM [Animal]"></asp:SqlDataSource>
 

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

