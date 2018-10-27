<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div class="container login-container">
        <div class="row">
            <div class="col-md-6 login-form-1">
                <h3>Create New User</h3>

                <div class="form-group">
                    <input type="text" id="txt_name" class="form-control" placeholder="Your Email *" value="" runat="server" />
                </div>
                <div class="form-group">
                    <input type="password" id="txt_password" class="form-control" placeholder="Your Password *" value="" runat="server" />
                </div>
                <div class="form-group">
                    <input type="password" id="txt_password2" class="form-control" placeholder="Please Enter your Password Again *" value="" runat="server" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnCreateUser" OnClick="btnCreateUser_Click" Text="submit" CssClass="btnSubmit" runat="server" />
                </div>
                <div class="form-group">
                    <a href="Login.aspx" class="btnForgetPwd">Already a user?</a>
                </div>
                <asp:ValidationSummary ID="valSummary" runat="server"
                    HeaderText="Review your input, the following errors occurred:"
                    ShowSummary="true" DisplayMode="List" forecolor="Red"/>

                <asp:RequiredFieldValidator
                    ControlToValidate="txt_name"
                    Display="None"
                    ErrorMessage="UserName is Required"
                    ForeColor="Red"
                    runat="server" />
                <asp:RequiredFieldValidator
                    ControlToValidate="txt_password"
                    Display="None"
                    ErrorMessage="Password is Required"
                    ForeColor="Red"
                    runat="server" />
                <asp:RequiredFieldValidator
                    ControlToValidate="txt_password2"
                    Display="None"
                    ErrorMessage="You must type your password again"
                    ForeColor="Red"
                    runat="server" />

                <asp:CompareValidator 
                    runat="server" 
                    Display="None"
                    ID="cmpPassword" 
                    ControlToValidate="txt_password" 
                    ControlToCompare="txt_password2"
                    Operator="Equal"
                    Type="String" 
                    ErrorMessage="Your Passwords do not match." /><br />


                </div>
            </div>
    </div>
    </form>
</body>
</html>
