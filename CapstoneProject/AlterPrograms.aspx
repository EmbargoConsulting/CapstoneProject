<%@ Page Title="" Language="C#" MasterPageFile="~/Child.master" %>

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
                <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Date</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Time</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Program Type</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="form-group">
                    <label>Educators</label>
                    <asp:DropdownList ID="ddlEducators" runat="server" CssClass="form-control">
                        <asp:ListItem>Raina</asp:ListItem>
                        <asp:ListItem>Alex</asp:ListItem>
                        <asp:ListItem>Ed</asp:ListItem>
                        <asp:ListItem>Shelly</asp:ListItem>
                        <asp:ListItem>Peg</asp:ListItem>
                        <asp:ListItem>Lydia</asp:ListItem>
                        <asp:ListItem>Doug</asp:ListItem>
                        <asp:ListItem>Amanda</asp:ListItem>
                    </asp:DropdownList>
                <asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn btn-default"/>
            </div>
            <div class="form-group">
                    <label></label>
            </div>
            <div class="form-group">
                    <label></label>
            </div>
            <div class="form-group">
                    <label></label>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

