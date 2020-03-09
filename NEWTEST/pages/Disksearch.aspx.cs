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
            string asupon = Request.QueryString["asup_on"];
            string asupaod = Request.QueryString["asup_aod"];
            string asupoff = Request.QueryString["asup_off"];
            query = "select [Case_No.] , Case_Status,Symptom,Date_Open,Date_closed from Tool_Main where [Serial_No.] = '" + srl + "' and [Partner_Serial_No] ='" + psrl + "'  ";
            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            if (dt.Rows.Count > 0)
            {
                GridView1.DataBind();
            }
            if (asupon != string.Empty | asupaod != string.Empty)
            {
                Label2.Text = "Check For duplicate case here !";
            }
            if (asupoff != string.Empty)
            {
                Label2.Text = " COLLECT THE FOLLOWING LOGS FROM THE CUSTOMER <br/>" +
                "> EMS LOG FILE  <br/>For cluster : cluster1::> event log show " +
                "<br/>For 7 MODE : node1 >ems event status ><br/><br/>" +
                "> SYSCONFIG -A <br/> For cluster : cluster1::> system node run -node {nodename|local} sysconfig -a " +
                "<br/> For 7 MODE : node1 > sysconfig -a <br/><br/>" +
                "> SYSCONFIG -R <br/> For cluster : cluster1::>system node run -node {nodename|local} sysconfig -r " +
                "<br/> For 7 MODE : node1 > sysconfig -r";
            }
            else
            {
                Label2.Text = "No Duplicate case found";
            }
        }
        con.Close();
    }
}