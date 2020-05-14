using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Loginbtn_Click(object sender, EventArgs e)
    {
        string connetionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        con = new SqlConnection(connetionString);
        string username = Page.Request.Form["username"].ToString();
        string password = Page.Request.Form["password"].ToString(); 
        con.Open();
        String query = "select * from  Login where Username='" + username + "' and Password='" + password + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        if (sdr.Read() != true)
        {
            Label1.Text = "Invalid credentials !";
        }
        else
        {
            Response.Redirect("Dashboard.aspx");

        }
        con.Close();
        //Response.Redirect("Dashboard.aspx");
    }
}