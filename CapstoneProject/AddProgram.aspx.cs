using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddAnimal_Click(object sender, EventArgs e)
    {
        string animal = ddlAnimals.SelectedItem.ToString();
        blAnimals.Items.Add(animal);
    }

    protected void btnAddEducator_Click(object sender, EventArgs e)
    {
        string educator = ddlEducators.SelectedItem.ToString();
        blEducators.Items.Add(educator);
    }
}