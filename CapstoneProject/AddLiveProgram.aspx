<%@ Page Title="Live Programs" Language="C#" MasterPageFile="~/Program.master" Inherits="Default2" CodeFile="~/AddLiveProgram.aspx.cs" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>Organization Name</label>
                <asp:DropDownList ID="ddlOrgName" required="required" runat="server" class="form-control">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>On or Off Site?</label>
                <asp:DropDownList ID="ddlOnSite" runat="server" required="required" class="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="1">On Site</asp:ListItem>
                    <asp:ListItem Value="0">Off Site</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" required="required" class="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="1">Completed</asp:ListItem>
                    <asp:ListItem Value="0">Scheduled</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtAddress" required="required" runat="server" maxlength="50" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>City</label>
                <asp:TextBox ID="txtCity" CssClass="form-control" required="required" runat="server" maxlength="50"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>County</label>
                <asp:TextBox ID="txtCounty" CssClass="form-control" required="required" runat="server" maxlength="50"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Program Theme</label>
                <asp:DropDownList ID="ddlProgramType" runat="server" required="required" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Wild Winter Worlds</asp:ListItem>
                    <asp:ListItem>Home Sweet Habitat</asp:ListItem>
                    <asp:ListItem>Display</asp:ListItem>
                    <asp:ListItem>Special Request</asp:ListItem>
                    <asp:ListItem>Open House</asp:ListItem>
                    <asp:ListItem>Tour</asp:ListItem>
                    <asp:ListItem>Whoo's Awake in the Night</asp:ListItem>
                    <asp:ListItem>You are what you Eat</asp:ListItem>
                    <asp:ListItem>Critters Don't Need Litter</asp:ListItem>
                    <asp:ListItem>For Goodness Snakes</asp:ListItem>
                    <asp:ListItem>Birds of Prey</asp:ListItem>
                    <asp:ListItem>Treat to Release</asp:ListItem>
                    <asp:ListItem>Classroom Visit: Owls</asp:ListItem>
                    <asp:ListItem>Classroom Visit: Turtles</asp:ListItem>
                    <asp:ListItem>Classroom Visit: Snakes</asp:ListItem>
                    <asp:ListItem>Classroom Visit: Falcons</asp:ListItem>
                    <asp:ListItem>Classroom Visit: Opossums</asp:ListItem>
                    <asp:ListItem>Classroom Visit: Special</asp:ListItem>


                </asp:DropDownList>

            </div>
            <div class="form-group">
                <label>Payment Received?</label>
                <asp:DropDownList ID="ddlPayment" required="required" CssClass="form-control" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="true">Yes</asp:ListItem>
                    <asp:ListItem Value="false">No</asp:ListItem>
                </asp:DropDownList>
            </div>
                        <div class="form-group">
                <label>Comments</label>
                <asp:TextBox ID="TextComments" runat="server" maxlength="1000" class="form-control" placeholder="Need Keyboard? Need Electrical Outlet?"></asp:TextBox>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                <label>Educators</label>
                <asp:ListBox ID="ddlEducators" SelectionMode="Multiple" Rows="5" runat="server" CssClass="form-control"></asp:ListBox>
            </div>
            <div class="form-group">
                <label>Animals</label>
                <asp:ListBox ID="ddlAnimals" Rows="6" SelectionMode="Multiple" runat="server" CssClass="form-control"></asp:ListBox>

            </div>
            <div class="form-group">
                <label>Child Count</label>
                <asp:TextBox ID="txtChildCount" CssClass="form-control" required="required" runat="server" type="number" max="999"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Adult Count</label>
                <asp:TextBox ID="txtAdultCount" required="required" CssClass="form-control" runat="server" type="number" max="999"></asp:TextBox>

            </div>
            <div class="form-group">
                <label>Date</label>
                <asp:TextBox ID="txtDate" required="required" runat="server" CssClass="form-control" placeholder="MM/DD/YYYY" type="date"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Time</label>
                <asp:TextBox ID="txtTime" runat="server" required="required" CssClass="form-control" placeholder="ie. 2:43 PM" maxlength="10"></asp:TextBox>
            </div>
            <div class="form-group">
                <label></label>
            </div>
        </div>
        <div class="col-lg-2">
            <br />
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-group-justified" Text="Save Program" OnClick="btnSubmit_Click" /><br />
            <br />
            <asp:Button ID="btnClearAll" runat="server" formnovalidate="formnovalidate" CausesValidation="false" CssClass="btn btn-group-justified btn-danger" Text="Clear All" OnClick="btnClearAll_Click" />
        <div id="testing" class="container">
            <br />
            <asp:Label runat="server" CssClass="label-primary">Testing</asp:Label>
            <asp:Button ID="btnPopulate" CssClass="btn btn-sm" runat="server" formnovalidate="formnovalidate" Text="Populate" OnClick="btnPopulate_Click" />
        </div>        
        </div>
        <br />
        <asp:Label runat="server" ID="lblDuration"></asp:Label>
        
        <asp:Label runat="server" ID="lblDistance"></asp:Label>


    </div>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

