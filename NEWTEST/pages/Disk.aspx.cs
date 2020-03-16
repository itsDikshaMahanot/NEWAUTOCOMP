﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Disk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {

        string sr = serialnumber.Text;
        string psr = partnerserialnumber.Text;
        string asup_status = null;
        //string asup_on = on.Text;
        //string asup_aod = aod.Text;
        //string asup_off = off.Text;
        if (on.Checked == true) asup_status = "ON";
        else if (aod.Checked == true) asup_status = "AOD";
        else asup_status = "OFF";

        string category = category2.SelectedItem.Value;
        if (casenumber.Text == string.Empty | serialnumber.Text == string.Empty | partnerserialnumber.Text == string.Empty | single.Checked != true & multiple.Checked != true | category2.Items.FindByText(" ") != null)
        {
            Label1.Text = " Required all Fields";
        }
        else
        {
            //Response.Redirect(string.Format("Disksearch.aspx?sr={0}&psr={1}&category={2}", sr, psr,asup_on,asup_aod,asup_off,category));
            Response.Redirect(string.Format("Disksearch.aspx?sr={0}&psr={1}&asup_status={2}&category={3}", sr, psr, asup_status, category));
        }
       
    }

    protected void category2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}