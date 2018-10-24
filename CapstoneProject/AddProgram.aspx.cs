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
                lblError.Visible = false;
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
                lblError.Visible = false;
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
        clearEducators();
    }

    protected void clearEducators()
    {
        blEducators.Items.Clear();
        tempEducators.Clear();
        blEducators.Visible = false;
        btnClearEducators.Visible = false;
        lblEducHeader.Visible = false;
    }

    protected void btnClearAnimals_Click(object sender, EventArgs e)
    {
        clearAnimals();
    }

    protected void clearAnimals()
    {
        blAnimals.Items.Clear();
        tempAnimals.Clear();
        blAnimals.Visible = false;
        btnClearAnimals.Visible = false;
        lblAnimalHeader.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if(tempEducators.Count > 0 && tempAnimals.Count > 0)
        {
            lblError.Visible = false;

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
            Program tempProgram = new Program(tempOnOffSite, status, tempOrgName, address, reportMonth, date, time, type, childCount, adultCount, paymentReceived, city, county, tempAnimals, tempEducators);

            //Pass object to commit function of class and get the inserted row's ID
            int programID = Program.commitProgram(tempProgram);

            //Iterate through arrays 
            foreach (string i in tempEducators)
            {

            }
        } else { lblError.Text = "Please select at least one educator and one animal"; }
        
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        txtAddress.Text = "";
        txtCity.Text = "";
        txtCounty.Text = "";
        txtChildCount.Text = "";
        txtAdultCount.Text = "";
        txtDate.Text = "";
        txtTime.Text = "";
        txtOrgName.Text = "";
        clearAnimals();
        clearEducators();

    }

    protected void btnPopulate_Click(object sender, EventArgs e)
    {
        Random rand = new Random();
        string randID = rand.Next(1,999).ToString();
        txtAddress.Text = rand.Next(20, 99).ToString() + " Test Road";
        txtCity.Text = "Springfield";
        txtCounty.Text = "Rockingham";
        txtChildCount.Text = rand.Next(1,30).ToString();
        txtAdultCount.Text = rand.Next(1,30).ToString();
        txtDate.Text = DateTime.Now.AddMonths(rand.Next(1,5)).AddDays(rand.Next(0,30)).ToShortDateString();
        txtTime.Text = DateTime.Now.AddHours(rand.Next(1,3)).AddMinutes(rand.Next(1,60)).ToShortTimeString();
        txtOrgName.Text = "Test Org " + randID;
    }
}