using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            foreach (Employee employee in Employee.getEmployeeList())
            {
                ddlEducators.Items.Insert(index, new ListItem(employee.getFullName(), employee.EmployeeID.ToString()));
            }

            index = 0;

            foreach (Animal animal in Animal.getAnimalList())
            {
                ddlAnimals.Items.Insert(index, new ListItem(animal.AnimalName, animal.AnimalID.ToString()));
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
     
        string type = ddlProgramType.SelectedItem.ToString();
        string teacher = txtTeacher.Text;
        string teacherEmail = txtEmail.Text;
        string grade = txtGrade.Text;
        string state = ddlState.Text;
        string Country = ddlCountry.Text;
        int child = Int32.Parse(txtChildCount.Text);
        int adult = Int32.Parse(txtAdultCount.Text);
        DateTime date = DateTime.Parse(txtDate.Text);
        DateTime time = DateTime.Parse(txtTime.Text);

        Random rand = new Random();

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

        OnlineProgram newProgram = new OnlineProgram(state, Country, grade, teacher, teacherEmail, date, time, type, type, child, adult, tempAnimals, tempEducators);

        OnlineProgram.insertOnlineProgram(newProgram);
        clearText();


        
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        clearText();
    }

    protected void btnPopulate_Click(object sender, EventArgs e)
    {
        Random rand = new Random();
        string randID = rand.Next(1,999).ToString();
        txtChildCount.Text = rand.Next(1,30).ToString();
        txtAdultCount.Text = rand.Next(1,30).ToString();
        txtDate.Text = DateTime.Now.AddMonths(rand.Next(1,5)).AddDays(rand.Next(0,30)).ToShortDateString();
        txtTime.Text = DateTime.Now.AddHours(rand.Next(1,3)).AddMinutes(rand.Next(1,60)).ToShortTimeString();
        txtTeacher.Text = "Test Teacher " + randID;
        txtEmail.Text = "teacher@school.com";
        txtGrade.Text = rand.Next(1, 8).ToString();
        ddlProgramType.SelectedIndex = rand.Next(1, 18);
        ddlState.SelectedIndex = rand.Next(1, 50);
        ddlCountry.SelectedIndex = rand.Next(1, 239);
    }

    protected void clearText()
    {
        txtTeacher.Text = "";
        txtEmail.Text = "";
        txtGrade.Text = "";
        ddlState.SelectedIndex = 0;
        ddlCountry.SelectedIndex = 0;
        txtChildCount.Text = "";
        txtAdultCount.Text = "";
        txtDate.Text = "";
        txtTime.Text = "";
        ddlEducators.SelectedIndex = 0;
        ddlAnimals.SelectedIndex = 0;
        ddlProgramType.SelectedIndex = 0;

    }
}