<%@ Page Language="C#" Title="Add Program" AutoEventWireup="true" CodeFile="AddProgram.aspx.cs" Inherits="Default2" MasterPageFile="~/Child.master" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">

    <h2 class="page-header">Add a Program</h2>

    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>Organization Name</label>
                <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>On or Off Site?</label>
                <asp:DropDownList ID="ddlOnSite" runat="server" class="form-control">
                    <asp:ListItem>On Site</asp:ListItem>
                    <asp:ListItem>Off Site</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                    <asp:ListItem>Completed</asp:ListItem>
                    <asp:ListItem>Scheduled</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtAddress" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>City</label>
                <asp:TextBox ID="txtCity" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>County</label>
            <asp:TextBox ID="txtCounty"  CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Program Type</label>
                <asp:DropDownList ID="ddlProgramType" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
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
                    <asp:ListItem Value="1">Bird</asp:ListItem>
                    <asp:ListItem Value="2">Possum</asp:ListItem>
                
                </asp:DropDownList>

            </div>
            <div class="form-group">
                <label>Child Count</label>
                <asp:TextBox ID="txtChildCount" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Adult Count</label>
                <asp:TextBox ID="txtAdultCount" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
            <div class="form-group">
                <label>Date</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Time</label>
                <asp:TextBox ID="txtTime" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Payment Received?</label>
                <asp:DropDownList ID="ddlPayment" CssClass="form-control" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label></label>
            </div>
        </div>
        <div class="col-lg-2">
            <br />
            <asp:Button ID="btnAddEducator" runat="server" Text="Add Educator" CssClass="btn btn-default" OnClick="btnAddEducator_Click" /><br />
            <br />
            <br />
            <asp:Button ID="btnAddAnimal" runat="server" Text="Add Animal" CssClass="btn btn-default" OnClick="btnAddAnimal_Click" />
            <br/>
            <br />
            <div class="form-group">
           <asp:label ID="lblEducHeader" runat="server" CssClass="page-header">Program Educators</asp:label>
                <asp:BulletedList ID="blEducators" runat="server"></asp:BulletedList>
                <asp:Button ID="btnClearEducators" CssClass="btn btn-xs" runat="server" Text="Clear" />
            </div>
            <div class="form-group">
                <asp:label ID="lblAnimalHeader" runat="server" CssClass="page-header">Program Animals</asp:label>
                <asp:BulletedList ID="blAnimals" runat="server"></asp:BulletedList><br />
            </div>

        </div>
       <%-- <div class="col-lg-1">
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>--%>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

