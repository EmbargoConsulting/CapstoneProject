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
            btnClearAnimals.Visible = false;


        }
    }

    protected void btnAddAnimal_Click(object sender, EventArgs e)
    {
        if(ddlAnimals.SelectedIndex > 0)
        {
            string animal = ddlAnimals.SelectedItem.ToString();
            if (checkValue(animal, "animal"))
            {
                tempAnimals.Add(animal);
                blAnimals.Items.Add(animal);
                blAnimals.Visible = true;
                lblAnimalHeader.Visible = true;
                btnClearAnimals.Visible = true;
            }
        }

    }

    protected void btnAddEducator_Click(object sender, EventArgs e)
    {
        if (ddlEducators.SelectedIndex > 0)
        {
            string educator = ddlEducators.SelectedItem.ToString();
            if (checkValue(educator, "educator"))
            {
                blEducators.Items.Add(educator);
                tempEducators.Add(educator);
                btnClearEducators.Visible = true;
                blEducators.Visible = true;
                lblEducHeader.Visible = true;
            }
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


    protected void btnClearEducators_Click(object sender, EventArgs e)
    {

    }

    protected void btnClearAnimals_Click(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //Grab data from form
        string tempOrgName = txtOrgName.Text;
        string tempOnOffSite = ddlOnSite.SelectedValue;
        string status = ddlStatus.SelectedValue;
        string address = txtAddress.Text;
        string city = txtCity.Text;
        string county = txtCounty.Text;
        string type = ddlProgramType.SelectedValue;
        int adultCount = int.Parse(txtAdultCount.Text);
        int childCount = int.Parse(txtChildCount.Text);
        DateTime date = DateTime.Parse(txtDate.Text);
        DateTime time = DateTime.Parse(txtTime.Text);
        bool paymentReceived = Boolean.Parse(ddlPayment.SelectedValue);
        string reportMonth = date.Month.ToString();

        //Create new object based on data
        Program tempProgram = new Program(tempOnOffSite, status, tempOrgName, address, reportMonth, date, type, childCount, adultCount, paymentReceived, city, county, tempAnimals, tempEducators);

        //Pass object to commit function of class and get the inserted row's ID
        int programID = Program.commitProgram(tempProgram);

        //Iterate through arrays 
        foreach (string i in tempEducators)
        {

        }
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {

    }
}