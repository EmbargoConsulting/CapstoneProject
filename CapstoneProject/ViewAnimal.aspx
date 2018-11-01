<%@ Page Language="C#" Title="View Animals" AutoEventWireup="true" CodeFile="ViewAnimal.aspx.cs" Inherits="ViewAnimal" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">


    <h2 class="page-header">View Animals</h2>
    <div class="col-lg-9">
        <%--       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" CellPadding="4" DataKeyNames="Animal ID" DataSourceID="SqlDataSource_ViewAnimal" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Animal ID" HeaderText="Animal ID" InsertVisible="False" ReadOnly="True" SortExpression="Animal ID" ItemStyle-Width="5%" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species" ItemStyle-Width="10%" />
                <asp:BoundField DataField="Checked-In Status" HeaderText="Checked-In Status" SortExpression="Checked-In Status" ItemStyle-Width="10%" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
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
        --%>
        <asp:SqlDataSource ID="SqlDataSource_ViewAnimal" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [AnimalID] as 'Animal ID', [AnimalName] as 'Name', [AnimalType] as 'Type', [CheckedInStatus] as 'Checked-In Status' FROM [Animal]"></asp:SqlDataSource>
    </div>



</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">

    <div class="col-lg-4">
    <div class="panel panel-default">
        <div class="panel-body">
             <div class="input-group custom-search-form">
            <%--<input type="text" class="form-control" placeholder="Search...">--%>
            <asp:TextBox ID="txtSearchAnimals" CssClass="form-control" runat="server"></asp:TextBox>
            <span class="input-group-btn">
                <%--                <button runat="server" class="btn btn-default" onclick="showSearchData()" type="button">
                    <i class="fa fa-search"></i>
                </button>--%>
                <asp:LinkButton ID="btnSearchAnimals" CssClass="btn btn-primary" OnClick="btnSearchAnimals_Click" runat="server"><span aria-hidden="true" class="glyphicon glyphicon-search"</span></asp:LinkButton>
            </span>
        </div>
        <asp:GridView ID="MainGridView" AutoGenerateColumns="false" DataSourceID="mainDataSource" DataKeyNames="AnimalID" CssClass="table table-bordered" runat="server" OnSorting="MainGridView_Sorting" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                <asp:BoundField HeaderText="Animal Name" DataField="AnimalName" SortExpression="AnimalName" />
                <asp:BoundField HeaderText="Programs" DataField="Programs" SortExpression="Programs" />
                <asp:BoundField HeaderText="People" DataField="People" SortExpression="People" />
            </Columns>
        </asp:GridView>
    </div>
        </div>
    </div>
       
    <div class="col-lg-7">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="panel-body">
                    <div class="panel-heading">Monthly Break-Down</div>
                    <asp:GridView ID="DetailsGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" DataKeyNames="AnimalID" DataSourceID="detailsDataSource">
            <HeaderStyle />
            <Columns>
                <asp:BoundField HeaderText="Month" DataField="Month" SortExpression="AnimalName" />
                <asp:BoundField HeaderText="On-Site" DataField="On-Site" SortExpression="Programs" />
                <asp:BoundField HeaderText="Off-Site" DataField="Off-Site" SortExpression="People" />
                <asp:BoundField HeaderText="Total Programs" DataField="Total Programs" SortExpression="AnimalName" />
                <asp:BoundField HeaderText="Children" DataField="Children" SortExpression="Programs" />
                <asp:BoundField HeaderText="Adults" DataField="Adults" SortExpression="People" />
            </Columns>
        </asp:GridView>
                </div>
                 <div class="panel-body">
                    <div class="panel-heading">Yearly Break-Down</div>
        <asp:GridView ID="yearGridView" AutoGenerateColumns="false" CssClass="table table-bordered" DataKeyNames="AnimalID" DataSourceID="yearDataSource" runat="server">
               <Columns>
                <asp:BoundField HeaderText="Year" DataField="Year" SortExpression="AnimalName" />
                <asp:BoundField HeaderText="On-Site" DataField="On-Site" SortExpression="Programs" />
                <asp:BoundField HeaderText="Off-Site" DataField="Off-Site" SortExpression="People" />
                <asp:BoundField HeaderText="Total Programs" DataField="Total Programs" SortExpression="AnimalName" />
                <asp:BoundField HeaderText="Children" DataField="Children" SortExpression="Programs" />
                <asp:BoundField HeaderText="Adults" DataField="Adults" SortExpression="People" />
                <asp:BoundField HeaderText="Total People" DataField="Total People" />
            </Columns>
        </asp:GridView>

                 </div>
            </div>

        </div>
       
    </div>

    <asp:SqlDataSource ID="mainDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT Animal.AnimalID, Animal.AnimalName, COUNT(Program.ProgramID) AS 'Programs', SUM(Program.ChildAttendance) + SUM(Program.AdultAttendance) as 'People' FROM Animal INNER JOIN AnimalProgram ON Animal.AnimalID = AnimalProgram.AnimalID INNER JOIN Program ON AnimalProgram.ProgramID = Program.ProgramID GROUP BY Animal.AnimalName, Animal.AnimalID"></asp:SqlDataSource>

    <asp:SqlDataSource ID="yearDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT DATEPART(YEAR, Program.DateTime) AS 'Year', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY Animal.AnimalID, DATEPART(Year, Program.DateTime)">
        <SelectParameters>
            <asp:ControlParameter ControlID="MainGridView" Name="AnimalID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="detailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT DATEPART(MONTH, Program.DateTime) as num, DATENAME(month, Program.DateTime) AS 'Month', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY DATENAME(month, Program.DateTime), Animal.AnimalID, DATEPART(month, Program.DateTime) ORDER BY Datepart(month, program.datetime) asc">
        <SelectParameters>
            <asp:ControlParameter ControlID="MainGridView" Name="AnimalID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>

