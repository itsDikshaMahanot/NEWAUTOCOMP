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
    string asup_status;
    string psrl;
    string srl;
    string category;
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
            srl = Request.QueryString["sr"];
            psrl = Request.QueryString["psr"];
            asup_status = Request.QueryString["asup_status"];
            category = Request.QueryString["category"];

            query = "select [Case_No.] , Case_Status,Symptom,Date_Open,Date_closed,Link from Tool_Main where [Serial_No.] = '" + srl + "' and [Partner_Serial_No] ='" + psrl + "' and [ASUP_Status] ='" + asup_status + "' and [Cat_ID] ='" + category + "' ";

            cmd = new SqlCommand(query, con);
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            if (dt.Rows.Count > 0 && asup_status != string.Empty)
            {
                if (asup_status.Equals("ON") || asup_status.Equals("AOD"))
                {
                    GridView1.DataBind();
                    Label2.Text = "<p> Check All cases Here !! <br/> " + " Click on the link to close the case !!</p> ";
                }

                else if (asup_status.Equals("OFF"))
                {
                    syslog_tbl.Visible = true;
                    //Label2.Text = "<p> COLLECT THE FOLLOWING LOGS FROM THE CUSTOMER <br/></p>" 
                    //+"<p>> EMS LOG FILE  <br/>" +
                    //"For cluster :- cluster1::> event log show " +
                    //"<br/>For 7 MODE :- node1 >ems event status ><br/><br/> </p>" +
                    //"<p>> SYSCONFIG -A <br/> For cluster : cluster1::> system node run -node {nodename|local} sysconfig -a " +
                    //"<br/> For 7 MODE : node1 > sysconfig -a <br/><br/> </p>" +
                    //"<p> > SYSCONFIG -R <br/> For cluster : cluster1::>system node run -node {nodename|local} sysconfig -r " +
                    //"<br/> For 7 MODE : node1 > sysconfig -r </p>";
                 
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
        if (asup_status.Equals("OFF"))
            Response.Redirect("~/Test/Test.aspx");
        else
            Response.Redirect("Disksearch.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string idd = ((Label)e.Row.FindControl("Case_No.")).Text;
            Console.Write(idd);
            e.Row.Attributes["onclick"] = "https://smartsolvecm.netapp.com/ui/#/case/";
        }
    }
}