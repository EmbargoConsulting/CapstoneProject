using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Animal
/// </summary>
public class Animal : dbConnect
{
    private int animalID;
    private string animalName;
    private string animalType;
    private string animalSpecies;
    private Boolean checkedInStatus;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Animal()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Animal(int animalID, string animalName, string animalType, string animalSpecies, bool checkedInStatus, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.AnimalID = animalID;
        this.AnimalName = animalName;
        this.AnimalType = animalType;
        this.AnimalSpecies = animalSpecies;
        this.CheckedInStatus = checkedInStatus;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public int AnimalID { get => animalID; set => animalID = value; }
    public string AnimalName { get => animalName; set => animalName = value; }
    public string AnimalType { get => animalType; set => animalType = value; }
    public string AnimalSpecies { get => animalSpecies; set => animalSpecies = value; }
    public bool CheckedInStatus { get => checkedInStatus; set => checkedInStatus = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}