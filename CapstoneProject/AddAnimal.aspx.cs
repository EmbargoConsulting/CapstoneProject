using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// 
///
/// 

public partial class AddAnimal : System.Web.UI.Page
{

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Animal animal = new Animal(txtAnimalName.Text, ddlAnimalType.SelectedItem.Text, txtAnimalDesc.Text, true, DateTime.Now, "User");
        Animal.insertAnimal(animal);
        clear();
    }

    protected void clear()
    {
        txtAnimalName.Text = "";
        txtAnimalDesc.Text = "";
        ddlAnimalType.SelectedIndex = 0;
    }
}