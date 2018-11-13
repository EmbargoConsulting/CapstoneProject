using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Invoices : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
}
