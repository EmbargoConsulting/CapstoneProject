<%@ Page Language="C#" Title="Add Program" AutoEventWireup="true" CodeFile="AddProgram.aspx.cs" Inherits="Default2" MasterPageFile="~/Child.master" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">

    <h2 class="page-header">Add a Program</h2>

    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>Organization Name</label>
                <asp:TextBox ID="txtOrgName" required="required" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>On or Off Site?</label>
                <asp:DropDownList ID="ddlOnSite" runat="server" class="form-control">
                    <asp:ListItem Value="1">On Site</asp:ListItem>
                    <asp:ListItem Value ="0">Off Site</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                    <asp:ListItem Value="1">Completed</asp:ListItem>
                    <asp:ListItem Value="0">Scheduled</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtAddress" required="required"  runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>City</label>
                <asp:TextBox ID="txtCity" CssClass="form-control" required="required"  runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>County</label>
            <asp:TextBox ID="txtCounty"  CssClass="form-control" required="required"  runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Program Type</label>
                <asp:DropDownList ID="ddlProgramType" runat="server" CssClass="form-control">
                    <asp:ListItem>Wild Winter Worlds</asp:ListItem>
                    <asp:ListItem>Home Sweet Habitat</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                <label>Educators</label>
                <asp:DropDownList ID="ddlEducators" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="1">Raina</asp:ListItem>
                    <asp:ListItem Value="2">Alex</asp:ListItem>
                    <asp:ListItem Value="3">Ed</asp:ListItem>
                    <asp:ListItem Value="4">Shelly</asp:ListItem>
                    <asp:ListItem Value="5">Peg</asp:ListItem>
                    <asp:ListItem Value="6">Lydia</asp:ListItem>
                    <asp:ListItem Value="7">Doug</asp:ListItem>
                    <asp:ListItem Value="8">Amanda</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Animals</label>
                <asp:DropDownList ID="ddlAnimals" runat="server" CssClass="form-control">
                    <asp:ListItem> </asp:ListItem>
                    <asp:ListItem Value="1">Bird</asp:ListItem>
                    <asp:ListItem Value="2">Possum</asp:ListItem>
                
                </asp:DropDownList>

            </div>
            <div class="form-group">
                <label>Child Count</label>
                <asp:TextBox ID="txtChildCount" CssClass="form-control" required="required"  runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Adult Count</label>
                <asp:TextBox ID="txtAdultCount"  required="required" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
            <div class="form-group">
                <label>Date</label>
                <asp:TextBox ID="txtDate"  required="required" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Time</label>
                <asp:TextBox ID="txtTime" runat="server" required="required"  CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Payment Received?</label>
                <asp:DropDownList ID="ddlPayment" CssClass="form-control" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="true">Yes</asp:ListItem>
                    <asp:ListItem Value="false">No</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label></label>
            </div>
        </div>
        <div class="col-lg-2">
            <br />
            <asp:Button ID="btnAddEducator"  formnovalidate="formnovalidate" runat="server" Text="Add Educator" CssClass="btn btn-default" OnClick="btnAddEducator_Click" /><br />
            <br />
            <br />
            <asp:Button ID="btnAddAnimal" formnovalidate="formnovalidate"  runat="server" Text="Add Animal" CssClass="btn btn-default" OnClick="btnAddAnimal_Click" />
            <br/>
            <br />
            <div class="form-group">
           <asp:label ID="lblEducHeader" runat="server" CssClass="page-header">Program Educators</asp:label>
                <asp:BulletedList ID="blEducators" runat="server"></asp:BulletedList>
                <asp:Button ID="btnClearEducators" formnovalidate="formnovalidate"  CssClass="btn btn-xs" runat="server" Text="Clear" OnClick="btnClearEducators_Click" />
            </div>
            <div class="form-group">
                <asp:label ID="lblAnimalHeader" runat="server" CssClass="page-header">Program Animals</asp:label>
                <asp:BulletedList ID="blAnimals" runat="server"></asp:BulletedList>
                <asp:Button ID="btnClearAnimals" formnovalidate="formnovalidate"  CssClass="btn btn-xs" runat="server" Text="Clear" OnClick="btnClearAnimals_Click" />
            </div>
            <div id="btn">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-group-justified" Text="Commit Program" OnClick="btnSubmit_Click" /><br /><br />
                <asp:Button ID="btnClearAll" runat="server" formnovalidate="formnovalidate" CausesValidation="false" CssClass="btn btn-group-justified btn-primary"  Text="Clear All" OnClick="btnClearAll_Click" />
            </div><br />
            <asp:Label runat="server" ID="lblError"></asp:Label>
            <div id="testing" class="container">
                <asp:Label runat="server" CssClass="label-primary">Testing</asp:Label>
                <asp:Button ID="btnPopulate" CssClass="btn btn-sm" runat="server" formnovalidate="formnovalidate"  Text="Populate" OnClick="btnPopulate_Click" />
                <%--<asp:Button ID="Button2" runat="server" Text="Button" />--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

