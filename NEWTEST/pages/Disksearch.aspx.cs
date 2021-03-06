﻿using System;
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
       //connection with database and taking values from disk page and showing the output
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
            //Show all the cases related to that serial number.
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
                    syslog_tbl.Visible = false;
                    Label2.Text = "<p> Check All cases Here !! <br/> " + " Click on the link to close the case !!</p> ";
                    nextbtn.Enabled = false;
                }

                else if (asup_status.Equals("OFF"))
                {
                    syslog_tbl.Visible = true;
                    
                 
                }
            }
        }
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Disk.aspx");
    }

    //btn event when ASUP=OFF
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (asup_status.Equals("OFF"))
            Response.Redirect("~/Searchlogs/SearchLogs.aspx");
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