using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_ASUP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnON_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logs.aspx");
    }

    protected void btnOFF_Click(object sender, EventArgs e)
    {
        Label1.Text = " COLLECT THE FOLLOWING LOGS FROM THE CUSTOMER <br/>" +
         "> EMS LOG FILE <br/>" +
         "> SYSCONFIG -A <br/>" +
         "> SYSCONFIG -R ";
    }

    protected void btnAOD_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logs.aspx");
    }
}