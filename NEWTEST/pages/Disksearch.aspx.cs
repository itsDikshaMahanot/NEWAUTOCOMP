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
            string asup_status = Request.QueryString["asup_status"];
            string category = Request.QueryString["category"];
            //TESTING QUERY
            query = "select [Case_No.] , Case_Status,Symptom,Date_Open,Date_closed,Link from Tool_Main where [Serial_No.] = '" + srl + "' and [Partner_Serial_No] ='" + psrl + "' and [ASUP_Status] ='" + asup_status+ "' and [Cat_ID] ='"+category+"' ";

            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;        
            //Testing Conditions

            if(dt.Rows.Count > 0 && asup_status != string.Empty)
            {
                if(asup_status.Equals("ON") || asup_status.Equals("AOD"))
                {
                    GridView1.DataBind();
                    Label2.Text = " Check All cases Here !! <br/> " +" Click on the link to close the case !! " ;
                }

                else if (asup_status.Equals("OFF"))
                {
                    Label2.Text = " COLLECT THE FOLLOWING LOGS FROM THE CUSTOMER <br/>" +
                    "> EMS LOG FILE  <br/>For cluster : cluster1::> event log show " +
                    "<br/>For 7 MODE : node1 >ems event status ><br/><br/>" +
                    "> SYSCONFIG -A <br/> For cluster : cluster1::> system node run -node {nodename|local} sysconfig -a " +
                    "<br/> For 7 MODE : node1 > sysconfig -a <br/><br/>" +
                    "> SYSCONFIG -R <br/> For cluster : cluster1::>system node run -node {nodename|local} sysconfig -r " +
                    "<br/> For 7 MODE : node1 > sysconfig -r";
                }
            }
        }
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Disk.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Test/TestDefault.aspx");
    }
}