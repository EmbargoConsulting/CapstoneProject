<%@ Page Title="Organizations" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true" CodeFile="Organizations.aspx.cs" Inherits="Organizations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">
 <div class="row">
     <div class="col-lg-12">
        <h2 class="page-header"><i class="fa fa-building icons"></i>Add an Organization</h2>
    </div>
</div>
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>Organization Name</label>
                <asp:TextBox ID="txtOrgName" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>City</label>
                <asp:TextBox ID="txtOrgCity" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Zip</label>
                <asp:TextBox ID="txtOrgZip" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>State</label>
                <asp:DropDownList ID="DropDownListState" runat="server" required="required" class="form-control">
                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                    <asp:ListItem Value="CA">California</asp:ListItem>
                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                    <asp:ListItem Value="NY">New York</asp:ListItem>
                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Organization Email</label>
                <asp:TextBox ID="txtOrganizationContact" runat="server" class="form-control" required="required" placeholder="ie. wildlife@wildlifecenter.org"></asp:TextBox>
            </div>
        </div>
        <div class="col-lg-1" style="width: 40px;"><hr /></div>
        <div class="col-lg-5">
            <asp:GridView ID="GridView1" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="OrganizationID" DataSourceID="OrganizationDataSource">
                <Columns>
                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />

                    <asp:BoundField DataField="OrganizationContact" HeaderText="Email" SortExpression="OrganizationContact"/>

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
            <asp:SqlDataSource ID="OrganizationDataSource" runat="server" DeleteCommand="DELETE FROM Organization WHERE OrganizationID = @OrganizationID" ConnectionString="<%$ ConnectionStrings:Project %>" SelectCommand="SELECT [OrganizationID], [OrganizationName], [OrganizationContact] FROM [Organization]" UpdateCommand="UPDATE Organization SET OrganizationName = @OrganizationName, OrganizationContact = @OrganizationContact WHERE OrganizationID = @OrganizationID;">
                <DeleteParameters>
                    <asp:Parameter Name="OrganizationID" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OrganizationName" />
                    <asp:Parameter Name="OrganizationContact" />
                    <asp:Parameter Name="OrganizationID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
   <div class="row">
    <div class="btn-group col-lg-5" id="btnGroupAddOrg">
    <div class="col-lg-6">
        <div id="btn">
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-group-justified" Text="Save Organization" OnClick="btnSubmit_Click" /><br />
        </div>
    </div>
    <div class="col-lg-6">
        <div id="btn2">
            <asp:Button ID="btnClearAll" runat="server" CssClass="btn btn-group-justified btn-danger" Text="Clear Fields" OnClick="btnClearAll_Click" formnovalidate="formnovalidate" />
        </div>
    </div>
   </div>
   </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent2" runat="Server">
</asp:Content>

