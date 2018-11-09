<%@ Page Language="C#" Title="Educators" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="AddEmployee" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

    <h2 class="page-header">Add an Educator</h2>

    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>First Name</label>
                <asp:TextBox ID="txtEmpFirst" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Middle Name</label>
                <asp:TextBox ID="txtEmpMiddle" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <asp:TextBox ID="txtEmpLast" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Employee Type</label>
                <asp:DropDownList ID="ddlEmpType" runat="server"  required="required"  class="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Salaried">Salaried</asp:ListItem>
                    <asp:ListItem Value ="Volunteer">Volunteer</asp:ListItem>
                </asp:DropDownList>
            </div>
            
        </div>
        <div class="col-lg-1" style="width:40px;"></div>
        <div class="col-lg-6">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"  CellPadding="4" DataKeyNames="Employee ID" DataSourceID="SqlDataSource_ViewEmployee" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" ItemStyle-Width="10%"/>
                <asp:BoundField DataField="Middle Name" HeaderText="Middle Name" SortExpression="Middle Name" ItemStyle-Width="10%"/>
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" ItemStyle-Width="10%"/>
                <asp:BoundField DataField="Employee Type" HeaderText="Employee Type" SortExpression="Employee Type" ItemStyle-Width="10%"/>
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
    
   </div>
    <asp:SqlDataSource ID="SqlDataSource_ViewEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [EmployeeID] as 'Employee ID', [FirstName] as 'First Name', [MiddleName] as 'Middle Name', [LastName] as 'Last Name', [EmployeeType] as 'Employee Type' FROM [Employee]"></asp:SqlDataSource>
    
        </div>
  <div class="row">
   <div class="btn-group col-lg-4" id="btnGroupEmployee">
    <div class="col-lg-4">
            <div id="btn">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-group-justified" Text="Add Employee" OnClick="btnSubmit_Click" /><br />
            </div>
    </div>
    <div class="col-lg-4">
            <div id="btn2">
                 <asp:Button ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-primary"  Text="Clear Fields" OnClick="btnClearAll_Click" formnovalidate="formnovalidate"/>
            </div>
    </div>
           <div class="col-lg-4">
            <div id="btn2">
                 <asp:Button ID="ExcelExport" runat="server" CssClass="btn btn-group-justified btn-primary"  Text="Export to Excel" OnClick="btnExcelExport_Click" formnovalidate="formnovalidate"/>
            </div>
    </div>
   </div>
   </div>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

