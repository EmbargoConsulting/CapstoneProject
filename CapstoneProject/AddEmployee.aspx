<%@ Page Language="C#" Title="Add Employee" AutoEventWireup="true" CodeFile="AddEmployee.aspx.cs" Inherits="AddEmployee" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

    <h2 class="page-header">Add an Employee</h2>

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
                <asp:DropDownList ID="ddlEmpType" runat="server" class="form-control">
                    <asp:ListItem Value="Salaried">Salaried</asp:ListItem>
                    <asp:ListItem Value ="Volunteer">Volunteer</asp:ListItem>
                </asp:DropDownList>
            </div>
            
        </div>
    </div>
    <div class="col-lg-2">
            <div id="btn">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-group-justified" Text="Commit Employee" /><br />
            </div>
    </div>
    <div class="col-lg-2">
            <div id="btn2">
                 <asp:Button ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-primary"  Text="Clear Fields" OnClick="btnClearAll_Click" formnovalidate="formnovalidate"/>
            </div>
    </div>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

