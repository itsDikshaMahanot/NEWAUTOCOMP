using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_KbDrop : System.Web.UI.Page
{
    string connetionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    SqlConnection con;
    SqlCommand cmd;
    SqlDataAdapter da;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(connetionString);
    }

    

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedIndex == 0)
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
        }
        if (DropDownList1.SelectedIndex == 1)
        {
            con.Open();
            string query = "select * from kbData where kb_type ='Failed' ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }

        if (DropDownList1.SelectedIndex == 2)
        {
            con.Open();
            String query = "select * from  kbData where kb_type = 'Alert' ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }
        if (DropDownList1.SelectedIndex == 3)
        {
            con.Open();
            String query = "select * from  kbData where kb_type = 'Multipath Error' ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }
        if (DropDownList1.SelectedIndex == 5)
        {
            con.Open();
            String query = "select * from  kbData where kb_type = 'multi-Disk Failure' ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }
        if (DropDownList1.SelectedIndex == 4)
        {
            con.Open();
            String query = "select * from  kbData where kb_type = 'multi-disk error' ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter();
            GridView1.DataSource = cmd.ExecuteReader();
            GridView1.DataBind();
            con.Close();
        }
    }
}