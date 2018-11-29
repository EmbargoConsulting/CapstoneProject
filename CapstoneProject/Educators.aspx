<%@ Page Language="C#" Title="Educators" AutoEventWireup="true" CodeFile="Educators.aspx.cs" Inherits="Educators" MasterPageFile="~/Child.master" validaterequest="false" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">

    <div class="modal fade" id="educatorModal" tabindex="-1" role="dialog" aria-labelledby="educatorModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 400px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="educatorModalLabel">Add a New educator</h5>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="form-group">
                            <label>First Name</label>
                            <asp:textbox id="txtEmpFirst" runat="server" class="form-control" required="required" maxlength="50"></asp:textbox>
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <asp:textbox id="txtEmpLast" runat="server" class="form-control" required="required" maxlength="50"></asp:textbox>
                        </div>
                        <div class="form-group">
                            <label>Educator Type</label>
                            <asp:dropdownlist id="ddlEmpType" runat="server" required="required" class="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Salaried">Salaried</asp:ListItem>
                    <asp:ListItem Value ="Volunteer">Volunteer</asp:ListItem>
                </asp:dropdownlist>
                        </div>
                    </div>

                    <div id="btn">
                        <asp:button id="Button1" runat="server" cssclass="btn btn-success btn-group-justified" text="Save Educator" onclick="btnSubmit_Click" />
                        <br />
                    </div>

                    <!-- Button is not visible until it works correctly -->
                    <div id="btn2">
                        <asp:button id="Button2" runat="server" visible="false" cssclass="btn btn-group-justified btn-danger" causesvalidation="false" text="Clear Fields" onclick="btnClearAll_Click" formnovalidate="formnovalidate" />
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header"><i class="fa fa-user icons"></i>Educators</h2>
        </div>
    </div>
    <div class="row">


        <div class="col-lg-1" style="width: 40px;"></div>
        <div class="col-lg-6">
            <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" cssclass="table table-bordered" cellpadding="4" datakeynames="EmployeeID" datasourceid="SqlDataSource_ViewEmployee" gridlines="None" onrowdeleting="GridView1_RowDeleting" autogenerateeditbutton="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="Last Name" />
                    <asp:BoundField DataField="EmployeeType" HeaderText="Educator Type" SortExpression="Employee Type"/>
                    <asp:CheckBoxField DataField="Active" HeaderText="Active?" SortExpression="Active" />
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
            </asp:gridview>
            <div class="row">
                <div class="col-lg-offset-6">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#educatorModal" id="btnAddEducator">
                        New Educator</button>
                    <asp:button id="ExcelExport" runat="server" cssclass="btn  btn-primary" text="Export to Excel" onclick="btnExcelExport_Click" formnovalidate="formnovalidate" />

                </div>

            </div>
            <asp:sqldatasource id="SqlDataSource_ViewEmployee" runat="server" connectionstring="<%$ ConnectionStrings:Project %>" selectcommand="SELECT [EmployeeID], [FirstName], [MiddleName], [LastName], [EmployeeType], [Active] FROM [Employee]" deletecommand="DELETE FROM Employee WHERE EmployeeID = @EmployeeID" updatecommand="UPDATE Employee set FirstName = @firstname, EmployeeType = @EmployeeType, LastName = @lastname, Active=@active WHERE EmployeeID = @EmployeeID;">
         <DeleteParameters>
                    <asp:Parameter Name="EmployeeID"/>
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName"/>
                    <asp:Parameter Name="EmployeeType"/>
                    <asp:Parameter Name="LastName"/>
                    <asp:Parameter Name="Active"/>

                </UpdateParameters>
            </asp:sqldatasource>
        </div>
    </div>





</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

