<%@ Page Language="C#" Title="Change Password" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

   
    <h2 class="page-header">Change Password</h2>

        <div class="row">
            <div class="col-lg-4">
            <div class="form-group">
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
      
            <div class="form-group">
                <label>New Password</label>
                <asp:TextBox ID="txtNewPassword1" runat="server"  value="" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <div class="form-group">
                <label>Verify New Password</label>
                <asp:TextBox ID="txtNewPassword2" runat="server"  value="" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <div class="col-lg-3">
                    <div id="btn">
                    <asp:Button ID="btnCreateUser" runat="server" CssClass="btn btn-primary btn-group-justified" Text="Submit" /><br />
                    </div>
                </div>
                <div class="col-lg-3">
                    <div id="btn2">
                    <asp:Button ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-primary" CausesValidation="false"  Text="Clear Fields"  formnovalidate="formnovalidate"/>
                    </div>
                </div>
                </div>
               
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

