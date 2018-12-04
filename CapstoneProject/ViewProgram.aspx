<%@ Page Language="C#" Title="Programs" AutoEventWireup="true" EnableEventValidation="false" CodeFile="ViewProgram.aspx.cs" Inherits="ViewProgram" MasterPageFile="~/Program.master" %>

<script runat="server">

</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript">
        function openModal() {
            $('#invoiceModal').modal('show');
        }
    </script>

    <div class="col-lg-10">

        <div class="row">
            <div class="col-lg-4">
<%--          <asp:Button runat="server" Text="Live Programs" OnClick="Unnamed_Click" />
          <asp:Button Text="Live Programs" BorderStyle="None" ID="Tab1" CausesValidation="false" CssClass="Initial" runat="server" OnClick="Tab1_Click1" />
          <asp:Button Text="Online Programs" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server" OnClick="Tab2_Click1" />
          <asp:Button Text="Monthly Breakdown" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"--%>

             <%-- OnClick="Tab3_Click" />--%>
                <asp:DropDownList OnSelectedIndexChanged="ddlViewOptions_SelectedIndexChanged" AutoPostBack="true" ID="ddlViewOptions" CssClass="form-control" runat="server">
                    <asp:ListItem Value="0"> Program Statistics - Monthly</asp:ListItem>
                    <asp:ListItem Value="1"> Live Programs </asp:ListItem>
                    <asp:ListItem Value="2"> Online Programs</asp:ListItem>
                    <asp:ListItem Value="3"> Edit Live Programs</asp:ListItem>
                    <asp:ListItem Value="4">Edit Online Programs</asp:ListItem>
                </asp:DropDownList>
                                    <asp:TextBox ID="TextBox1" runat="server">Search</asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" formnovalidate="formnovalidate" />
                                       

            </div>

            <div id="outerDiv" runat="server" class="col-lg-4 col-lg-offset-4">
                <div id="buttonsDiv" runat="server" class="col-lg-offset-6">


                    <asp:Button ID="btnInvoice" formnovalidate="formnovalidate" OnClientClick="return false" runat="server" Text="Add Invoice" CssClass="btn btn-primary" data-toggle="modal" data-target="#invoiceModal" Visible="false" OnClick="btnInvoice_Click"></asp:Button>
                    <asp:Button ID="ExcelExport" runat="server" CssClass="btn btn-primary" Text="Export to Excel" OnClick="btnExcelExport_Click" formnovalidate="formnovalidate" />

                </div>
            </div>

        </div>

    </div>
    <div style="height:45px;";></div>


    <div class="btn-group">
    </div>




    <div class="col-lg-10">


        <asp:MultiView ID="MultiView1" runat="server">


            <asp:View ID="View1" runat="server">
                <asp:GridView ID="MonthlyGridView" AllowPaging="true" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datasourceProgramOverview" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Live Programs" HeaderText="Live Programs" SortExpression="Live Programs" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Online Programs" HeaderText="Online Programs" SortExpression="Online Programs" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Total Programs" HeaderText="Total Programs" SortExpression="Total Programs" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Child Attendance" HeaderText="Children" SortExpression="Child Attendance" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Adult Attendance" HeaderText="Adults" SortExpression="Adult Attendance" ItemStyle-Width="10%" />
                        <asp:BoundField DataField="Total Attendance" HeaderText="Total Attendance" SortExpression="Total Attendance" ItemStyle-Width="10%" />
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
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:GridView ID="LiveGridView" AllowSorting="True" AllowPaging="True" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="datasourceLivePrograms" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Organization" HeaderText="Organization" SortExpression="Organization" />
                        <asp:BoundField DataField="Program Theme" HeaderText="Theme" SortExpression="Program Theme" />
                        <asp:BoundField DataField="Date" HeaderText="Date/Time" SortExpression="Date" />
                        <asp:BoundField DataField="Child Attendance" HeaderText="Children" SortExpression="Child Attendance" />

                        <asp:BoundField DataField="Adult Attendance" HeaderText="Adults" SortExpression="Adult Attendance" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Address" HeaderText="Street" SortExpression="Address" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                        <asp:BoundField DataField="OnOffSite" HeaderText="On/Off Site" SortExpression="OnOffSite" />
                        <asp:TemplateField HeaderText="Add Invoice">
                            <ItemTemplate>
                                <asp:CheckBox ID="SelectCheckBox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:GridView ID="OnlineGridView" AllowPaging="true" AllowSorting="true" runat="server" AutoGenerateColumns="false" CellPadding="4" DataSourceID="datasourceOnlinePrograms" ForeColor="#333333" CssClass="table table-striped table-bordered" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProgramType" HeaderText="Type" SortExpression="ProgramType" />
                        <asp:BoundField DataField="ProgramTheme" HeaderText="Theme" SortExpression="ProgramTheme" />
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                        <asp:BoundField DataField="DateTime" HeaderText="Date/Time" SortExpression="DateTime" />
                        <asp:BoundField DataField="ChildAttendance" HeaderText="Children" SortExpression="ChildAttendance" />
                        <asp:BoundField DataField="AdultAttendance" HeaderText="Adults" SortExpression="AdultAttendance" />
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
            </asp:View>
        <asp:View ID="View4" runat="server">
            <asp:GridView ID="editgridview" DataKeyNames="ProgramID" CssClass="table table-striped table-bordered" GridLines="none" AutoGenerateEditButton="true"  AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false" DataSourceID="editDataSource" runat="server">
                    <AlternatingRowStyle BackColor="White" />                
                <Columns>
                    <asp:BoundField DataField="ProgramTheme" HeaderText="Program Theme" SortExpression="ProgramTheme" />
                    <asp:BoundField DataField="DateTime" HeaderText="Date/Time" SortExpression="DateTime" />
                    <asp:BoundField DataField="ChildAttendance" HeaderText="Children" SortExpression="ChildAttendance" />
                    <asp:BoundField DataField="AdultAttendance" HeaderText="Adults" SortExpression="AdultAttendance" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                    <asp:BoundField DataField="OnOffSite" HeaderText="OnOffSite" SortExpression="OnOffSite" />
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
        </asp:View>
        <asp:View ID="View5" runat="server">
     <asp:GridView ID="editgridview2" DataKeyNames="ProgramID" CssClass="table table-striped table-bordered" GridLines="none" AutoGenerateEditButton="true" AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false" DataSourceID="editDataSource2" runat="server">
                    <AlternatingRowStyle BackColor="White" />                
                <Columns>
                    <asp:BoundField DataField="ProgramTheme" HeaderText="Program Theme" SortExpression="ProgramTheme" />
                    <asp:BoundField DataField="DateTime" HeaderText="Date/Time" SortExpression="DateTime" />
                    <asp:BoundField DataField="ChildAttendance" HeaderText="Children" SortExpression="ChildAttendance" />
                    <asp:BoundField DataField="AdultAttendance" HeaderText="Adults" SortExpression="AdultAttendance" />
                    <asp:BoundField DataField="ProgramType" HeaderText="Type" SortExpression="ProgramType" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                    <asp:BoundField DataField="TeacherName" HeaderText="Teacher Name" SortExpression="TeacherName" />
                    <asp:BoundField DataField="TeacherEmail" HeaderText="Teacher Email" SortExpression="TeacherEmail" />
                
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
        </asp:View>
        </asp:MultiView>

        <asp:SqlDataSource ID="SqlDataSource_ViewProgram" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [ProgramID] as 'Program ID', [ProgramTheme] as 'Theme', [DateTime] as 'Date and Time', [ChildAttendance] 'Child Attendance', [AdultAttendance] as 'Adult Attendance' FROM [Program]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="datasourceProgramOverview" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT DATEPART(MONTH,Program.DateTime), datename(month, program.datetime) as 'Month', COUNT(LiveProgram.ProgramID) as 'Live Programs', Count(OnlineProgram.ProgramID) as 'Online Programs', Count(*) as 'Total Programs', SUM(Program.ChildAttendance) as 'Child Attendance', SUM(Program.AdultAttendance) 'Adult Attendance', SUM(Program.AdultAttendance) + SUM(Program.ChildAttendance) as 'Total Attendance' FROM LiveProgram FULL OUTER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID FULL OUTER JOIN OnlineProgram ON Program.ProgramID = OnlineProgram.ProgramID GROUP BY datename(month, program.datetime), DATEPART(MONTH,Program.DateTime) ORDER BY DATEPART(MONTH,Program.DateTime) asc"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dataSourceLivePrograms" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT ISNULL(Organization.OrganizationName,'No Organization') as Organization, Program.ProgramTheme AS 'Program Theme', Program.DateTime AS 'Date', Program.ChildAttendance AS 'Child Attendance', Program.AdultAttendance AS 'Adult Attendance', LiveProgram.Status,  LiveProgram.Address, LiveProgram.City, LiveProgram.County, LiveProgram.OnOffSite FROM LiveProgram LEFT OUTER JOIN Program ON LiveProgram.ProgramID = Program.ProgramID FULL OUTER JOIN Invoice ON Program.ProgramID = Invoice.ProgramID LEFT OUTER JOIN Organization ON Invoice.OrganizationID = Organization.OrganizationID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="datasourceOnlinePrograms" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT OnlineProgram.ProgramType, Program.ProgramTheme, OnlineProgram.State, OnlineProgram.Country, Program.DateTime, Program.ChildAttendance, Program.AdultAttendance FROM OnlineProgram INNER JOIN Program ON OnlineProgram.ProgramID = Program.ProgramID"></asp:SqlDataSource>
        <asp:SqlDataSource ID="editDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" UpdateCommand="UPDATE Program SET ProgramTheme = @ProgramTheme, DateTime = @DateTime, ChildAttendance = @ChildAttendance, AdultAttendance = @AdultAttendance WHERE ProgramID = @ProgramID; UPDATE LiveProgram SET Status = @Status, Address=@Address, City=@City, County=@County, OnOffSite=@OnOffSite WHERE LiveProgram.ProgramID = @ProgramID" SelectCommand="SELECT Program.ProgramID, Program.ProgramTheme, Program.DateTime, Program.ChildAttendance, Program.AdultAttendance, LiveProgram.Status, LiveProgram.Address, LiveProgram.City, LiveProgram.County, LiveProgram.OnOffSite FROM Program INNER JOIN LiveProgram ON Program.ProgramID = LiveProgram.ProgramID">
            <UpdateParameters>
                    <asp:Parameter Name="ProgramID" />
                    <asp:Parameter Name="ProgramTheme" />
                    <asp:Parameter Name="DateTime" />
                    <asp:Parameter Name="ChildAttendance" />
                    <asp:Parameter Name="AdultAttendance" />
                    <asp:Parameter Name="Status" />
                    <asp:Parameter Name="Address" />
                    <asp:Parameter Name="City" />
                    <asp:Parameter Name="County" />
                    <asp:Parameter Name="OnOffSite" />


            </UpdateParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="editDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" UpdateCommand="UPDATE Program SET ProgramTheme = @ProgramTheme, DateTime = @DateTime, ChildAttendance = @ChildAttendance, AdultAttendance = @AdultAttendance WHERE ProgramID = @ProgramID; UPDATE OnlineProgram SET ProgramType = @ProgramType, State=@State, Grade=@Grade, Country=@Country, TeacherName=@TeacherName, TeacherEmail=@TeacherEmail WHERE OnlineProgram.ProgramID = @ProgramID" SelectCommand="SELECT        Program.ProgramID, Program.ProgramTheme, Program.DateTime, Program.ChildAttendance, Program.AdultAttendance, OnlineProgram.ProgramType, OnlineProgram.State, OnlineProgram.Country,  OnlineProgram.Grade, OnlineProgram.TeacherName, OnlineProgram.TeacherEmail FROM OnlineProgram INNER JOIN Program ON OnlineProgram.ProgramID = Program.ProgramID">
            <UpdateParameters>
                    <asp:Parameter Name="ProgramID" />
                    <asp:Parameter Name="ProgramTheme" />
                    <asp:Parameter Name="DateTime" />
                    <asp:Parameter Name="ChildAttendance" />
                    <asp:Parameter Name="AdultAttendance" />
                    <asp:Parameter Name="Type" />
                    <asp:Parameter Name="State" />
                    <asp:Parameter Name="Country" />
                    <asp:Parameter Name="Grade" />
                    <asp:Parameter Name="TeacherName" />
                    <asp:Parameter Name="TeacherEmail" />
                


            </UpdateParameters>
        </asp:SqlDataSource>
    </div>


    <!-- Modal for Invoices -->
    <div class="modal fade" id="invoiceModal" tabindex="-1" role="dialog" aria-labelledby="animalModalLabel" aria-hidden="true">

        <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
        <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
        <%--<link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />--%>

        <div class="modal-dialog modal-dialog-centered" style="max-width: 400px;" role="document">
            <div class="modal-content">
                <%--<asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="invoiceModalLabel">Add an Invoice</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-control-label">Invoice Type</label>
                        <asp:DropDownList ID="ddlInvoiceType" AutoPostBack="true" runat="server" class="form-control" required="required" OnSelectedIndexChanged="ddlInvoiceType_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>On-Site</asp:ListItem>
                            <asp:ListItem>Off-Site</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblInvoiceCode" runat="server" visible="false">Invoice Code</label>
                        <asp:TextBox ID="txtInvoiceCode" runat="server" class="form-control" required="required" Visible="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblTotalPeople" runat="server" visible="false">Number of People</label>
                        <asp:TextBox ID="txtTotalPeople" value="0" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblPricePerPerson" runat="server" visible="false">Price per Person</label>
                        <asp:TextBox ID="txtPricePerPerson" value="5.00" type="double" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblOffsiteQuantity" runat="server" visible="false">Off-Site Program Quantity</label>
                        <asp:TextBox ID="txtOffsiteQuantity" value="0" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblOffsitePrice" runat="server" visible="false">Price per Off-Site Program</label>
                        <asp:TextBox ID="txtOffsitePrice" value="256.00" type="double" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblAdditionalQuantity" runat="server" visible="false">Additional Program Quantity</label>
                        <asp:TextBox ID="txtAdditionalQuantity" value="0" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblAdditionalPrice" runat="server" visible="false">Price per Additional Program</label>
                        <asp:TextBox ID="txtAdditionalPrice" value="160.00" type="double" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblTravelMiles" runat="server" visible="false">Travel Miles</label>
                        <asp:TextBox ID="txtTravelMiles" value="0" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" id="lblMilePrice" runat="server" visible="false">Price per Mile</label>
                        <asp:TextBox ID="txtMilePrice" value="0.57" type="double" runat="server" class="form-control" required="required" Visible="false" AutoPostBack="true" OnTextChanged="txtTextChanged"></asp:TextBox>
                    </div>


                    <div class="form-group">
                        <label class="form-control-label" runat="server" id="lblTotalCost" visible="false">Total Cost</label>
                        <asp:TextBox ID="txtTotalCost" type="double" ReadOnly="true" BackColor="LightGray" runat="server" class="form-control" required="required" Visible="false"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="form-control-label" runat="server" id="lblInvoicePayment" visible="false">Has Payment Been Recieved?</label>
                        <asp:DropDownList ID="ddlInvoicePayment" runat="server" required="required" class="form-control" Visible="false">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Yes</asp:ListItem>
                            <asp:ListItem>No</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div id="btn">
                        <asp:Button ID="btnSaveInvoice" runat="server" CssClass="btn btn-success btn-group-justified" Text="Save Invoice" OnClick="btnSaveInvoice_Click" /><br />
                    </div>
                    <div id="btn2">
                        <asp:Button Visible="false" ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-danger" CausesValidation="false" Text="Clear Fields" formnovalidate="formnovalidate" OnClick="btnClearAllModal_Click" />
                    </div>


                </div>
                <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
            </div>
        </div>
    </div>

</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>
