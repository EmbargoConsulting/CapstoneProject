using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class ViewProgram : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddlViewOptions.SelectedIndex = 0;
            MultiView1.ActiveViewIndex = 0;
        }
        if (Page.IsPostBack)
        {
            
        }

    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {

    }

    protected void editgridview_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = editgridview.Rows[e.RowIndex];
        int id = Convert.ToInt32(editgridview.DataKeys[e.RowIndex].Values["ProgramID"]);
        editDataSource.UpdateCommand = "UPDATE Program SET ProgramTheme = @theme, DateTime = @DateTime, ChildAttendance = @ChildAttendance, AdultAttendance = @AdultAttendance WHERE ProgramID = @id";
        editDataSource.UpdateParameters.Add("theme", editgridview.Rows[e.RowIndex].FindControl("ProgramTheme").ToString());
        //editDataSource.UpdateParameters.Add("contact", editgridview.DataKeys[e.RowIndex].Values["DateTime"].ToString());

        editDataSource.Update();

        editgridview.DataBind();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
           server control at run time. */
    }

    protected void btnExcelExport_Click(object sender, EventArgs e)
    {

        GridView gv = new GridView();
        string filename = "";

        switch (ddlViewOptions.SelectedValue)
        {
            case "0":
                gv = MonthlyGridView;
                filename = "MonthlyPrograms";
                break;
            case "1":
                gv = LiveGridView;
                filename = "LivePrograms";
                break;
            case "2":
                gv = OnlineGridView;
                filename = "OnlinePrograms";
                break;           

        }

        Response.ClearContent();

        Response.AppendHeader("content-disposition", "attachment;filename=" + filename + DateTime.Now.ToShortDateString() + ".xls");
        Response.ContentType = "application/excel";



        System.IO.StringWriter stringWrite = new System.IO.StringWriter();

        System.Web.UI.HtmlTextWriter htmlWrite =
        new HtmlTextWriter(stringWrite);

        gv.RenderControl(htmlWrite);

        Response.Write(stringWrite.ToString());

        Response.End();
    }


    protected void ddlViewOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = Int32.Parse(ddlViewOptions.SelectedValue);

        if (ddlViewOptions.SelectedIndex == 1) {
            outerDiv.Attributes["class"] = "col-lg-4 col-lg-offset-4";
            buttonsDiv.Attributes["class"] = "col-lg-offset-1";
            btnInvoice.Visible = true;
        }
        else
        {
            btnInvoice.Visible = false;

            outerDiv.Attributes["class"] = "col-lg-4 col-lg-offset-4";
            buttonsDiv.Attributes["class"] = "col-lg-offset-6";


        }
    }

    protected void btnSaveInvoice_Click(object sender, EventArgs e)
    {

        if (ddlInvoiceType.SelectedIndex > 0)
        {
            int pay = 1;

            if (ddlInvoicePayment.SelectedIndex == 2)
            {
                pay = 2;
            }

            Invoice invoice = new Invoice(Convert.ToInt32(txtInvoiceCode.Text), txtTotalCost.Text, pay);
            Invoice.insertInvoice(invoice);

            btnClearAllModal_Click(sender, e);
        }

        //int counter = 0;
        //foreach (GridViewRow row in LiveGridView.Rows)
        //{
        //    // Access the CheckBox
        //    CheckBox cb = (CheckBox)row.FindControl("SelectCheckBoxr");
        //    if (cb != null && cb.Checked)
        //    {
        //        // Associate this program with the entered information here


        //        // Counter that if 0 at the end displays a message "Please select at lease one program"
        //        counter += 1;
        //    }
        //    else
        //    {

        //    }

        //}
        //if (counter == 0)
        //{
        //    // Display message here "Please Select At Least One Program"

        //}

        resetModalValues();
    }

    protected void btnClearAllModal_Click(object sender, EventArgs e)
    {
        txtInvoiceCode.Text = "";
        txtTotalCost.Text = "";
        ddlInvoicePayment.SelectedIndex = 0;
    }

    protected void btnInvoice_Click(object sender, EventArgs e)
    {
        
    }


    protected void ddlInvoiceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlInvoiceType.SelectedIndex == 0)
        {
            noSelected();
        }
        if (ddlInvoiceType.SelectedIndex == 1)
        {
            onSiteSelected();
        }
        if (ddlInvoiceType.SelectedIndex == 2)
        {
            offSiteSelected();
        }
        showModal();

    }

    protected void onSiteSelected()
    {
        txtInvoiceCode.Visible = true;
        txtTotalPeople.Visible = true;
        txtPricePerPerson.Visible = true;
        txtTotalCost.Visible = true;

        lblInvoiceCode.Visible = true;
        lblTotalPeople.Visible = true;
        lblPricePerPerson.Visible = true;
        lblTotalCost.Visible = true;
        lblInvoicePayment.Visible = true;

        ddlInvoicePayment.Visible = true;

        txtAdditionalQuantity.Visible = false;
        txtMilePrice.Visible = false;
        txtOffsitePrice.Visible = false;
        txtOffsiteQuantity.Visible = false;
        txtTravelMiles.Visible = false;
        txtAdditionalPrice.Visible = false;
        

        lblAdditionalQuantity.Visible = false;
        lblAdditionalPrice.Visible = false;
        lblMilePrice.Visible = false;
        lblOffsitePrice.Visible = false;
        lblOffsiteQuantity.Visible = false;
        lblTravelMiles.Visible = false;

        resetModalValues();
    }

    protected void resetModalValues()
    {
        txtTotalPeople.Text = "0";
        txtPricePerPerson.Text = "5.00";
        txtAdditionalQuantity.Text = "0";
        txtMilePrice.Text = "0.57";
        txtTravelMiles.Text = "0";
        txtOffsitePrice.Text = "250.00";
        txtOffsiteQuantity.Text = "0";
        txtTravelMiles.Text = "0";
        txtTotalCost.Text = "0.00";
        txtAdditionalPrice.Text = "160.00";
        txtInvoiceCode.Text = "";
        ddlInvoicePayment.SelectedIndex = 0;
    }

    protected void offSiteSelected()
    {
        txtInvoiceCode.Visible = true;
        txtTotalPeople.Visible = false;
        txtPricePerPerson.Visible = false;
        txtTotalCost.Visible = true;

        lblInvoiceCode.Visible = true;
        lblTotalPeople.Visible = false;
        lblPricePerPerson.Visible = false;
        lblTotalCost.Visible = true;
        lblInvoicePayment.Visible = true;
        lblAdditionalPrice.Visible = true;

        ddlInvoicePayment.Visible = true;

        txtAdditionalPrice.Visible = true;
        txtAdditionalQuantity.Visible = true;
        txtMilePrice.Visible = true;
        txtOffsitePrice.Visible = true;
        txtOffsiteQuantity.Visible = true;
        txtTravelMiles.Visible = true;

        lblAdditionalQuantity.Visible = true;
        lblMilePrice.Visible = true;
        lblOffsitePrice.Visible = true;
        lblOffsiteQuantity.Visible = true;
        lblTravelMiles.Visible = true;

        resetModalValues();
    }

    protected void noSelected()
    {
        txtInvoiceCode.Visible = false;
        txtTotalPeople.Visible = false;
        txtPricePerPerson.Visible = false;
        txtTotalCost.Visible = false;

        lblInvoiceCode.Visible = false;
        lblTotalPeople.Visible = false;
        lblPricePerPerson.Visible = false;
        lblTotalCost.Visible = false;
        lblInvoicePayment.Visible = false;
        lblAdditionalPrice.Visible = false;

        ddlInvoicePayment.Visible = false;

        txtAdditionalPrice.Visible = false;
        txtAdditionalQuantity.Visible = false;
        txtMilePrice.Visible = false;
        txtOffsitePrice.Visible = false;
        txtOffsiteQuantity.Visible = false;
        txtTravelMiles.Visible = false;

        lblAdditionalQuantity.Visible = false;
        lblMilePrice.Visible = false;
        lblOffsitePrice.Visible = false;
        lblOffsiteQuantity.Visible = false;
        lblTravelMiles.Visible = false;

        resetModalValues();
    }

    protected void txtTextChanged(object sender, EventArgs e)
    {
        double totalCost = 0.00;
        double personCost;
        double offSiteCost;
        double additionalCost;
        double travelCost;

        if (ddlInvoiceType.SelectedIndex == 1)
        {
            personCost = Convert.ToDouble(txtTotalPeople.Text) * Convert.ToDouble(txtPricePerPerson.Text);
            totalCost = personCost;
            txtTotalCost.Text = Convert.ToString(totalCost);
        }
        if (ddlInvoiceType.SelectedIndex == 2)
        {
            offSiteCost = Convert.ToDouble(txtOffsiteQuantity.Text) * Convert.ToDouble(txtOffsitePrice.Text);
            

            additionalCost = Convert.ToDouble(txtAdditionalQuantity.Text) * Convert.ToDouble(txtAdditionalPrice.Text);
            
            travelCost = Convert.ToDouble(txtMilePrice.Text) * Convert.ToDouble(txtTravelMiles.Text);

            totalCost += (offSiteCost + additionalCost + travelCost);
            txtTotalCost.Text = Convert.ToString(totalCost);
        }

        showModal();
    }

    protected void showModal()
    {
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "$('#invoiceModal').modal('show')", true);
    }
}