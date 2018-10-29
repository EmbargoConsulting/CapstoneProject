﻿using System;
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
            blAnimals.Visible = false;
            blEducators.Visible = false;
            btnClearEducators.Visible = false;
            tempEducators = new List<int>();
            tempAnimals = new List<int>();
            lblAnimalHeader.Visible = false;
            lblEducHeader.Visible = false;
            btnClearAnimals.Visible = false;

            //Populate DropDown
            int index = 1;
            foreach (Employee employee in Employee.getEmployeeList())
            {
                ddlEducators.Items.Insert(index, new ListItem(employee.getFullName(), employee.EmployeeID.ToString()));
            }

            index = 1;

            foreach (Animal animal in Animal.getAnimalList())
            {
                ddlAnimals.Items.Insert(index, new ListItem(animal.getAnimalDescription(), animal.AnimalID.ToString()));
            }

        }

    }

    protected void btnAddAnimal_Click(object sender, EventArgs e)
    {
        if (ddlAnimals.SelectedIndex > 0)
        {
            string animal = ddlAnimals.SelectedItem.ToString();
            int animalID = Int32.Parse(ddlAnimals.SelectedValue);
            if (checkValue(animalID, "animal"))
            {
                tempAnimals.Add(animalID);
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
            int educatorID = Int32.Parse(ddlEducators.SelectedValue);
            if (checkValue(educatorID, "educator"))
            {
                blEducators.Items.Add(educator);
                tempEducators.Add(educatorID);
                btnClearEducators.Visible = true;
                blEducators.Visible = true;
                lblEducHeader.Visible = true;
                lblError.Visible = false;
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

        OnlineProgram newProgram = new OnlineProgram(state, Country, grade, teacher, teacherEmail, rand.Next(111, 999), type, date, time, type, child, adult, tempAnimals, tempEducators);

        OnlineProgram.insertOnlineProgram(newProgram);


        
    }

    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        txtChildCount.Text = "";
        txtAdultCount.Text = "";
        txtDate.Text = "";
        txtTime.Text = "";
        txtTeacher.Text = "";
        txtEmail.Text = "";
        txtGrade.Text = "";
        clearAnimals();
        clearEducators();
        ddlProgramType.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;
        ddlCountry.SelectedIndex = 0;
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
        tempAnimals.Add(1);
        tempEducators.Add(1);
        blAnimals.Items.Add("Test Animal");
        blEducators.Items.Add("Test Educator");
        blAnimals.Visible = true;
        blEducators.Visible = true;
        lblAnimalHeader.Visible = true;
        lblEducHeader.Visible = true;
    }
}