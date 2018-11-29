<%@ Page Title="" Language="C#" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>




<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Tableau Functionality"></asp:Label>
    <div class="btn-group">
    <asp:Button ID="btnOn" runat="server" Text="On" />
    <asp:Button ID="btnOff" runat="server" Text="Off" />
    </div>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" Runat="Server">
</asp:Content>

