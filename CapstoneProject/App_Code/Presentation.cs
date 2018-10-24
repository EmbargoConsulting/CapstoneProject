using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Presentation
/// </summary>
public class Presentation : dbConnect
{
    private int programID;
    private int orgID;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Presentation()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Presentation(int programID, int orgID)
    {
        this.programID = programID;
        this.orgID = orgID;
    }

    public int ProgramID { get => programID; set => programID = value; }
    public int OrgID { get => orgID; set => orgID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}