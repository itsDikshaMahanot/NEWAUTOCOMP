using System;
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
        if (casenumber.Text == String.Empty | serialnumber.Text == String.Empty | partnerserialnumber.Text == String.Empty | single.Checked != true & multiple.Checked != true)
        {
            Label1.Text = " Required all Fields";
        }
        else
        {
            Response.Redirect("Disksearch.aspx");

        }
    }
}