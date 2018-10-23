using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    private static List<string> tempEducators = new List<string>();
    private static List<string> tempAnimals = new List<string>();

    protected void Page_Load(object sender, EventArgs e)
    {

        //On first load
        if (!Page.IsPostBack)
        {
            blAnimals.Visible = false;
            blEducators.Visible = false;
            btnClearEducators.Visible = false;
            tempEducators = new List<string>();
            tempAnimals = new List<string>();
            lblAnimalHeader.Visible = false;
            lblEducHeader.Visible = false;

            
        }
    }

    protected void btnAddAnimal_Click(object sender, EventArgs e)
    {
        string animal = ddlAnimals.SelectedItem.ToString();
        if (checkValue(animal, "animal"))
        {
            tempAnimals.Add(animal);
            blAnimals.Items.Add(animal);
            blAnimals.Visible = true;
            lblAnimalHeader.Visible = true;
        }
    }

    protected void btnAddEducator_Click(object sender, EventArgs e)
    {
        string educator = ddlEducators.SelectedItem.ToString();
        if (checkValue(educator, "educator")){
            blEducators.Items.Add(educator);
            tempEducators.Add(educator);
            btnClearEducators.Visible = true;
            blEducators.Visible = true;
            lblEducHeader.Visible = true;
        }

    }

    public bool checkValue(string valueToCheck, string typeToCheck)
    {
        if (typeToCheck == "educator")
        {
            foreach (string s in tempEducators)
            {
                if (s.Equals(valueToCheck))
                {
                    return false;
                }
            }
            return true;
        }
        else if (typeToCheck == "animal")
        {
            foreach (string s in tempAnimals)
            {
                if (s.Equals(valueToCheck))
                {
                    return false;
                }
            }
            return true;
        }
        else
        {
            //Error message
            return false;
        }
    }

}