<%@ Page Language="C#" Title="Educators" AutoEventWireup="true" CodeFile="Educators.aspx.cs" Inherits="Educators" MasterPageFile="~/Child.master" %>

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
                <asp:TextBox ID="txtEmpFirst" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>        
            <div class="form-group">
                <label>Last Name</label>
                <asp:TextBox ID="txtEmpLast" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Educator Type</label>
                <asp:DropDownList ID="ddlEmpType" runat="server"  required="required"  class="form-control">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Salaried">Salaried</asp:ListItem>
                    <asp:ListItem Value ="Volunteer">Volunteer</asp:ListItem>
                </asp:DropDownList>
            </div>
					</div>

                    <div id="btn">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success btn-group-justified" Text="Save Educator" OnClick="btnSubmit_Click" /><br />
                    </div>

                    <!-- Button is not visible until it works correctly -->
                    <div id="btn2">
                        <asp:Button ID="Button2" runat="server" Visible="false" CssClass="btn btn-group-justified btn-danger" CausesValidation="false" Text="Clear Fields" OnClick="btnClearAll_Click" formnovalidate="formnovalidate" />
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header"><i class="fa fa-user icons"></i> Educators</h2>
        </div>
    </div>
    <div class="row">


        <div class="col-lg-1" style="width: 40px;"></div>
        <div class="col-lg-6">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" CellPadding="4" DataKeyNames="Employee ID" DataSourceID="SqlDataSource_ViewEmployee" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="First Name" HeaderText="First Name" SortExpression="First Name" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name" SortExpression="Last Name" ItemStyle-Width="10%" />
                    <asp:BoundField DataField="Employee Type" HeaderText="Educator Type" SortExpression="Employee Type" ItemStyle-Width="10%" />
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
            <div class="row">
             <div class="col-lg-offset-6">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#educatorModal" id="btnAddEducator">
                New Educator</button> 
                    <asp:Button ID="ExcelExport" runat="server" CssClass="btn  btn-primary" Text="Export to Excel" OnClick="btnExcelExport_Click" formnovalidate="formnovalidate" />
                
             </div>
         
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource_ViewEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [EmployeeID] as 'Employee ID', [FirstName] as 'First Name', [MiddleName] as 'Middle Name', [LastName] as 'Last Name', [EmployeeType] as 'Employee Type' FROM [Employee]"></asp:SqlDataSource>

    </div>




</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

