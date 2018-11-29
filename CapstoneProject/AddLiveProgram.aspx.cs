using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.Net;
using System.IO;


public partial class Default2 : System.Web.UI.Page
{
    private static List<int> tempEducators = new List<int>();
    private static List<int> tempAnimals = new List<int>();

    protected void Page_Load(object sender, EventArgs e)
    {

        //On first load
        if (!Page.IsPostBack)
        {
            

            tempEducators = new List<int>();
            tempAnimals = new List<int>();


            //Populate DropDown
            int index = 0;
            foreach(Employee employee in Employee.getEmployeeList())
            {
                if(employee.Active == true)
                {
                    ddlEducators.Items.Insert(index, new ListItem(employee.getFullName(), employee.EmployeeID.ToString()));
                }
            }

            index = 0;

            foreach(Animal animal in Animal.getAnimalList())
            {
                if(animal.Active == true)
                {
                    ddlAnimals.Items.Insert(index, new ListItem(animal.AnimalName, animal.AnimalID.ToString()));
                }
            }

            index = 1;

            foreach(Organization org in Organization.getOrgList())
            {
                ddlOrgName.Items.Insert(index, new ListItem(org.OrganizationName, org.OrganizationID.ToString()));
                index++;
            }

        }
    }



    public bool checkValue(int valueToCheck, string typeToCheck)
    {
        if (typeToCheck == "educator")
        {
            foreach (int s in tempEducators)
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
            foreach (int s in tempAnimals)
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





    protected void btnSubmit_Click(object sender, EventArgs e)
    {

            //lblError.Visible = false;
            Random rand = new Random();

        //Grab data from form
            string org = ddlOrgName.SelectedValue;
            int OnOffSite = Int16.Parse(ddlOnSite.SelectedValue);
            string status = ddlStatus.SelectedItem.Text;
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
            int orgID = int.Parse(ddlOrgName.SelectedValue);
    

            foreach (ListItem item in ddlAnimals.Items)
            {
                if (item.Selected)
                {
                    tempAnimals.Add(Int32.Parse(item.Value));
                }
            }

        foreach (ListItem item in ddlEducators.Items)
        {
            if (item.Selected)
            {
                tempEducators.Add(Int32.Parse(item.Value));
            }
        }

        //Create new object based on data
        LiveProgram tempProgram = new LiveProgram(orgID, status, rand.Next(100,999).ToString(), date, time, type, childCount, adultCount, tempAnimals, tempEducators, address, OnOffSite, city, county);
        //Pass object to commit function of class and get the inserted row's ID
        LiveProgram.insertLiveProgram(tempProgram);
        //tempProgram.ProgramID = programID;

        //GetDistance("38.1247668,-79.1203594");


        clearText();
        tempEducators.Clear();
        tempAnimals.Clear();
        
    }

    //public int GetDistance(string destination)
    //{
    //    int distance = 0;
    //    string origin = "38.0392748,-78.914256";
    //    string url = @"http://maps.googleapis.com/maps/api/distancematrix/xml?origins=" + origin + "&destinations=" + destination + "&key=AIzaSyCXAToR0WV_uUkLQWuwDGWvr3JO0D2x100";

    //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
    //    WebResponse response = request.GetResponse();
    //    Stream dataStream = response.GetResponseStream();
    //    StreamReader sreader = new StreamReader(dataStream);
    //    string responsereader = sreader.ReadToEnd();
    //    response.Close();

    //    DataSet ds = new DataSet();
    //    ds.ReadXml(new XmlTextReader(new StringReader(responsereader)));
    //    if (ds.Tables.Count > 0)
    //    {
    //        if (ds.Tables["element"].Rows[0]["status"].ToString() == "OK")
    //        {
    //            lblDuration.Text = ds.Tables["duration"].Rows[0]["text"].ToString();
    //            lblDistance.Text = ds.Tables["distance"].Rows[0]["text"].ToString();
    //        }
    //    }
    //    return distance;
    //}

    protected void clearText()
    {
        ddlOnSite.SelectedIndex = 0;
        ddlStatus.SelectedIndex = 0;
        txtAddress.Text = "";
        txtCity.Text = "";
        txtCounty.Text = "";
        txtChildCount.Text = "";
        txtAdultCount.Text = "";
        txtDate.Text = "";
        txtTime.Text = "";
        ddlOnSite.SelectedIndex = 0;
        ddlStatus.SelectedIndex = 0;
        ddlPayment.SelectedIndex = 0;
        ddlPayment.SelectedIndex = 0;
        ddlEducators.SelectedIndex = 0;
        ddlAnimals.SelectedIndex = 0;
        ddlProgramType.SelectedIndex = 0;

    }


    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        clearText();
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
        ddlOrgName.SelectedIndex = 1;
        ddlPayment.SelectedIndex = rand.Next(1, 2);
        ddlProgramType.SelectedIndex = rand.Next(1, 18);
        ddlOnSite.SelectedIndex = rand.Next(1, 2);
        ddlStatus.SelectedIndex = rand.Next(1, 2);

    }





}