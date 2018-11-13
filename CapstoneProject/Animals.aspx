<%@ Page Language="C#" Title="Animals" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Animals.aspx.cs" Inherits="Animals" MasterPageFile="~/Child.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">

<div class="row">
    <div class="col-lg-12">
        <h2 class="page-header"><i class="fa fa-paw icons"></i>View Animals</h2>
    </div>
</div>
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



    <!-- Modal -->
    <div class="modal fade" id="animalModal" tabindex="-1" role="dialog" aria-labelledby="animalModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 400px;" role="document">
            <div class="modal-content">
                <div class="modal-header">                    
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="animalModalLabel">Add a New Animal</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label">Animal Name</label>
                        <asp:TextBox ID="txtAnimalName" runat="server" class="form-control" required="required"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label">Animal Type</label>
                        <asp:DropDownList ID="ddlAnimalType" runat="server" required="required" class="form-control">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="Bird">Bird</asp:ListItem>
                            <asp:ListItem Value="Mammal">Mammal</asp:ListItem>
                            <asp:ListItem Value="Reptile">Reptile</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div id="btn">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-group-justified" Text="Add Animal" OnClick="btnSubmit_Click" /><br />
                    </div>
                    <!-- Button is not visible until it works correctly -->
                    <div id="btn2">
                        <asp:Button ID="btnClearAll" visible="false" runat="server" CssClass="btn btn-group-justified btn-danger" CausesValidation="false" Text="Clear Fields" OnClick="btnClearAll_Click" formnovalidate="formnovalidate" />
                    </div>


                </div>
            </div>
        </div>
    </div>
    <%--    <div class="col-lg-4">--%>
    <%--             <div class="input-group custom-search-form">
            <asp:TextBox ID="txtSearchAnimals" CssClass="form-control" runat="server"></asp:TextBox>
            <span class="input-group-btn">
                            <asp:LinkButton ID="btnSearchAnimals" CssClass="btn btn-primary" OnClick="btnSearchAnimals_Click" runat="server"><span aria-hidden="true" class="glyphicon glyphicon-search"</span></asp:LinkButton>
            </span>
        </div>--%>




    <%--<asp:GridView ID="MainGridView"  AutoGenerateColumns="false" DataSourceID="mainDataSource" DataKeyNames="AnimalID" CssClass="table table-bordered" runat="server" OnSorting="MainGridView_Sorting" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                <asp:BoundField HeaderText="Animal Name" DataField="AnimalName" SortExpression="AnimalName" />
                <asp:BoundField HeaderText="Programs" DataField="Programs" SortExpression="Programs" />
                <asp:BoundField HeaderText="People" DataField="People" SortExpression="People" />
            </Columns>
        </asp:GridView>--%>
    <%--</div>--%>


    <div class="col-lg-12">
        <div class="row">
            <div class="col-lg-3">
                <label class="form-control-label">Select an animal: </label>
                <asp:DropDownList ID="ddlAnimals" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlAnimals_SelectedIndexChanged" runat="server">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-5">
                <div class="form-group">
                   <label class="form-control-label"> or Enter Name:</label>
                <div class="row">
                    <asp:TextBox Width="150px" ID="txtSearch" runat="server" CssClass="form-control col-lg-8"></asp:TextBox>
                    <asp:Button ID="btnSearchAnimal" formnovalidate="formnovalidate" CausesValidation="false" CssClass="btn btn-small col-lg-2" runat="server" Text="Search" OnClick="btnSearchAnimal_Click"/>
                </div>
                </div>

            </div>

           <div id="btnGroupAnimals">
            <div class="col-lg-2">
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#animalModal" id="btnAddAnimal">
                    New Animal</button>
            </div>
            <div class="col-lg-2">
                <button type="button" class="btn btn-danger">Clear Animal Tables</button>
            </div>

            </div>
        </div>
        <div id="output" runat="server" class="col-lg-offset-3"></div>
    </div>
    <div id="tableau" runat="server">
<%--<div class='tableauPlaceholder' id='viz1541960194854' style='position: relative'><noscript><a href='#'><img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Vi&#47;VisualReportMonthly&#47;AnimalReport&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='VisualReportMonthly&#47;AnimalReport' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Vi&#47;VisualReportMonthly&#47;AnimalReport&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /></object></div>--%>                <script type='text/javascript'>                    var divElement = document.getElementById('viz1541960194854');                    var vizElement = divElement.getElementsByTagName('object')[0];                    vizElement.style.width='100%';vizElement.style.height=(divElement.offsetWidth*0.75)+'px';                    var scriptElement = document.createElement('script');                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                </script>    </div>

    <div class="col-lg-8">
        <div id="details" runat="server">
            <div id="panelMonth2" class="panel panel-default" runat="server">
                <div id="panelMonth" runat="server" class="panel panel-heading">Monthly Break-Down for All Past Programs</div>
                <div class="panel panel-body">
                    <asp:GridView ID="DetailsGridView" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" DataKeyNames="AnimalID">
                        <HeaderStyle />
                        <Columns>
                            <asp:BoundField HeaderText="Month" DataField="Month" SortExpression="AnimalName" />
                            <asp:BoundField HeaderText="On-Site" DataField="On-Site" SortExpression="Programs" />
                            <asp:BoundField HeaderText="Off-Site" DataField="Off-Site" SortExpression="People" />
                            <asp:BoundField HeaderText="Total Programs" DataField="Total Programs" SortExpression="AnimalName" />
                            <asp:BoundField HeaderText="Children" DataField="Children" SortExpression="Programs" />
                            <asp:BoundField HeaderText="Adults" DataField="Adults" SortExpression="People" />
                        </Columns>
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
                            <asp:Button ID="Button2" formnovalidate="formnovalidate" CausesValidation="false" class="btn btn-primary" runat="server" Text="Export to Excel" OnClick="btnExport1_Click"/>
              
                </div>
            </div>

            <div id="panelYear2" class="panel panel-default" runat="server">
                <div id="panelYear" runat="server" class="panel panel-heading">Yearly Break-Down</div>
                <div class="panel panel-body">
                    <asp:GridView ID="yearGridView" AutoGenerateColumns="false" CssClass="table table-bordered" DataKeyNames="AnimalID" runat="server">
                        <Columns>
                            <asp:BoundField HeaderText="Year" DataField="Year" SortExpression="AnimalName" />
                            <asp:BoundField HeaderText="On-Site" DataField="On-Site" SortExpression="Programs" />
                            <asp:BoundField HeaderText="Off-Site" DataField="Off-Site" SortExpression="People" />
                            <asp:BoundField HeaderText="Total Programs" DataField="Total Programs" SortExpression="AnimalName" />
                            <asp:BoundField HeaderText="Children" DataField="Children" SortExpression="Programs" />
                            <asp:BoundField HeaderText="Adults" DataField="Adults" SortExpression="People" />
                            <asp:BoundField HeaderText="Total People" DataField="Total People" />
                        </Columns>
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
                                                <asp:Button ID="Button1" formnovalidate="formnovalidate" CausesValidation="false" class="btn btn-primary" runat="server" Text="Export to Excel" OnClick="btnExport2_Click"/>

                </div>

            </div>

        
            <div class="panel panel-default">
                <div id="Div1" runat="server" class="panel panel-heading">Total Breakdown</div>
                <div class="panel panel-body">
                    <asp:GridView ID="GridView1" AutoGenerateColumns="false" CssClass="table table-bordered" DataKeyNames="AnimalID" runat="server">

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
                                                <asp:Button ID="Button4" formnovalidate="formnovalidate" CausesValidation="false" class="btn btn-primary" runat="server" Text="Export to Excel" OnClick="btnExport3_Click"/>

                </div>

            </div>

        </div>


    <div runat="server" id="results"></div>



    <%--    <asp:SqlDataSource ID="mainDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT Animal.AnimalID, Animal.AnimalName, COUNT(Program.ProgramID) AS 'Programs', SUM(Program.ChildAttendance) + SUM(Program.AdultAttendance) as 'People' FROM Animal INNER JOIN AnimalProgram ON Animal.AnimalID = AnimalProgram.AnimalID INNER JOIN Program ON AnimalProgram.ProgramID = Program.ProgramID GROUP BY Animal.AnimalName, Animal.AnimalID"></asp:SqlDataSource>

    <asp:SqlDataSource ID="yearDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT DATEPART(YEAR, Program.DateTime) AS 'Year', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY Animal.AnimalID, DATEPART(Year, Program.DateTime)">
        <SelectParameters>
            <asp:ControlParameter ControlID="MainGridView"  Name="AnimalID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="detailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT DATEPART(MONTH, Program.DateTime) as num, DATENAME(month, Program.DateTime) AS 'Month', COUNT(CASE WHEN OnOffSite = 1 THEN 1 END) AS 'On-Site', COUNT(CASE WHEN LiveProgram.OnOffSite = 0 THEN 1 END) AS 'Off-Site', COUNT(*) AS 'Total Programs',  SUM(Program.ChildAttendance) AS 'Children', SUM(Program.AdultAttendance) AS 'Adults', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) AS 'Total People', Animal.AnimalID FROM LiveProgram INNER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID INNER JOIN AnimalProgram ON Program.ProgramID = AnimalProgram.ProgramID INNER JOIN Animal ON AnimalProgram.AnimalID = Animal.AnimalID WHERE Animal.AnimalID = @AnimalID GROUP BY DATENAME(month, Program.DateTime), Animal.AnimalID, DATEPART(month, Program.DateTime) ORDER BY Datepart(month, program.datetime) asc">
        <SelectParameters>
            <asp:ControlParameter ControlID="MainGridView" Name="AnimalID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>--%>

</asp:Content>

