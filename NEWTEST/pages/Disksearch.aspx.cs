using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Disksearch : System.Web.UI.Page
{
    string query;
    protected void Page_Load(object sender, EventArgs e)
    {
        string connetionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;       
        con = new SqlConnection(connetionString);
        con.Open();
        if (!string.IsNullOrEmpty(Request.QueryString.ToString()))
        {
            string srl = Request.QueryString["sr"];
            string psrl = Request.QueryString["psr"];
             query = "select [Case_No.] , Case_Status,Symptom,Date_Open,Date_closed from Tool_Main where [Serial_No.] = '" + srl + "' and [Partner_Serial_No] ='" + psrl + "'  ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    else if(query == null)
        {
            Label2.Text= "No Duplicate case found";
        }
    }
    protected void chcekASUP_Click(object sender, EventArgs e)
    {
        Response.Redirect("ASUP.aspx");
    }
}