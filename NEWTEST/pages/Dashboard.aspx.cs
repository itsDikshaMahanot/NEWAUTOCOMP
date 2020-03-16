using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class pages_Dashboard : System.Web.UI.Page
{
    string connetionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(connetionString);
    }        
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewPSUdashboard.aspx");
    }



    protected void Disk_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Newdashboard.aspx");
    }


}