<%@ Page Title="Invoices" Language="C#" MasterPageFile="~/Child.master" AutoEventWireup="true" CodeFile="Invoices.aspx.cs" Inherits="Invoices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="Server">
  <div class="row">
      <div class="col-lg-12">
            <h2 class="page-header"><i class="fa fa-dollar icons"></i>Add an Invoice</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div class="form-group">
                <label>Hold</label>
                <asp:TextBox ID="txtBox1" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Hold</label>
                <asp:TextBox ID="txtBox2" runat="server" class="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Hold</label>
                <asp:TextBox ID="txtBox3" runat="server" class="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Hold</label>
                <asp:TextBox ID="txtBox4" runat="server" class="form-control" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="col-lg-1" style="width: 40px;"><hr /></div>
        
    </div>
   <div class="row">
    <div class="btn-group col-lg-4" id="btnSaveInvoice">
    <div class="col-lg-6">
        <div id="btn">
            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-group-justified" Text="Save Invoice" OnClick="btnSubmit_Click" /><br />
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

