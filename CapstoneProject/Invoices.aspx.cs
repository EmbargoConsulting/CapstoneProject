using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invoices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Session["Volunteer"] != null)
            {
                Response.Redirect("~/ViewProgram.aspx");
            }

        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Project"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        //SqlCommand com = new SqlCommand("select * from Program", con); // table name 
        //SqlDataAdapter da = new SqlDataAdapter(com);
        //DataSet ds = new DataSet();
        //da.Fill(ds);  // fill dataset
        //ddlInvoiceProgram.DataTextField = ds.Tables[0].Columns["ProgramTheme"].ToString(); // text field name of table dispalyed in dropdown
        //ddlInvoiceProgram.DataValueField = ds.Tables[0].Columns["ProgramID"].ToString();             // to retrive specific  textfield name 
        //ddlInvoiceProgram.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
        //ddlInvoiceProgram.DataBind();  //binding dropdownlist

        //SqlCommand com2 = new SqlCommand("select * from Organization", con); // table name 
        //SqlDataAdapter da2 = new SqlDataAdapter(com2);
        //DataSet ds2 = new DataSet();
        //da2.Fill(ds2);  // fill dataset
        ////ddlInvoiceOrganization.DataTextField = ds2.Tables[0].Columns["OrganizationName"].ToString(); // text field name of table dispalyed in dropdown
        ////ddlInvoiceOrganization.DataValueField = ds2.Tables[0].Columns["OrganizationID"].ToString();             // to retrive specific  textfield name 
        ////ddlInvoiceOrganization.DataSource = ds2.Tables[0];      //assigning datasource to the dropdownlist
        ////ddlInvoiceOrganization.DataBind();  //binding dropdownlist

        //ddlInvoiceOrganization.DataSource = ds2;
        //ddlInvoiceOrganization.DataTextField = "OrganizationName";
        //ddlInvoiceOrganization.DataValueField = "OrganizationID";
        //ddlInvoiceOrganization.DataBind();

        SqlCommand cmd = new SqlCommand("SELECT * FROM Program", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            ddlInvoiceProgram.Items.Add(new ListItem(dr["ProgramTheme"].ToString(), dr["ProgramID"].ToString()));
        }


        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Organization", con);
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        DataTable dt2 = new DataTable();
        da2.Fill(dt2);
        foreach (DataRow dr in dt2.Rows)
        {
            ddlInvoiceOrganization.Items.Add(new ListItem(dr["OrganizationName"].ToString(), dr["OrganizationID"].ToString()));
        }


    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        clear();
    }

    public void clear()
    {
       
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        InvoiceDataSource.Delete();
        InvoiceGridView.DataBind();
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



            Invoice invoice = new Invoice(Convert.ToInt32(txtInvoiceCode.Text), txtTotalCost.Text, pay, (ddlInvoiceProgram.SelectedIndex + 1), (ddlInvoiceOrganization.SelectedIndex + 1));
            Invoice.insertInvoice(invoice);

            btnClearAllModal_Click(sender, e);
            InvoiceGridView.DataBind();
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
