<%@ Page Language="C#" Title="Add Animal" AutoEventWireup="true" CodeFile="AddAnimal.aspx.cs" Inherits="AddAnimal" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">

    <h2 class="page-header">Add an Animal</h2>

    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>Animal Name</label>
                <asp:TextBox ID="txtAnimalName" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Animal Type</label>
                <asp:DropDownList ID="ddlAnimalType" runat="server" class="form-control">
                    <asp:ListItem Value="Bird">Bird</asp:ListItem>
                    <asp:ListItem Value ="Mammal">Mammal</asp:ListItem>
                    <asp:ListItem Value ="Reptile">Reptile</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Animal Description</label>
                <asp:TextBox ID="txtAnimalDesc" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="col-lg-2">
            <div id="btn">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-group-justified" Text="Commit Animal" OnClick="btnSubmit_Click" /><br />
            </div>
    </div>
    <div class="col-lg-2">
            <div id="btn2">
                 <asp:Button ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-primary" CausesValidation="false"  Text="Clear Fields" OnClick="btnClearAll_Click" formnovalidate="formnovalidate"/>
            </div>
    </div>
</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

