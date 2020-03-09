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
         "> EMS LOG FILE  <br/> For cluster : cluster1::> event log show  <br/> For 7 MODE : node1 >ems event status <br/><br/>" +
         "> SYSCONFIG -A <br/> For cluster : cluster1::> system node run -node {nodename|local} sysconfig -a ><br/> For 7 MODE : node1 > sysconfig -a <br/><br/>" +
         "> SYSCONFIG -R <br/> For cluster : cluster1::>system node run -node {nodename|local} sysconfig -r <br/> For 7 MODE : node1 > sysconfig -r";
    }

    protected void btnAOD_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logs.aspx");
    }
}