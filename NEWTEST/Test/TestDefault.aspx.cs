using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_TestDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (IsPostBack)
            {
                //BindGrid();            
                //this.BindGrid();

            }
        }
    }

    protected void BindGrid(String filename)
    {
        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id, serialno, name, Content_Type, size from Upload_Log where serialno = " + filename;
                cmd.Connection = con;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
            }
        }

    }


    //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    //{ 
    //    //creating checkbox column//

    //   CheckBox checkbox = new CheckBox();

    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        checkbox.ID = "chkChecked";
    //        checkbox.AutoPostBack = false;
    //        e.Row.Cells[0].Controls.Add(checkbox);
    //    }

    //}


    protected void Button1_Click(object sender, EventArgs e)
    {

        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        string srno = serialnumber.Value;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                double file_size = fs.Length / 1024;
                string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into Upload_Log values (@Name, @Content_Type, @Data, @Size,@serialno)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@Name", filename);
                        cmd.Parameters.AddWithValue("@Content_Type", contentType);
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@Size", file_size);
                        cmd.Parameters.AddWithValue("@serialno", srno);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
        Response.Redirect(Request.Url.AbsoluteUri);
    }



    protected void search_File(object sender, EventArgs e)
    {
        string filename = Text2.Value;
        // GridView1.Columns[0].HeaderText = "Choose";
        BindGrid(filename);
    }
    string selectedFilename;
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        selectedFilename = GridView1.SelectedRow.Cells[3].Text;
        //if(selectedFilename != null)
        //{
        //    result.Text = "Selcted file : " + selectedFilename;
        //}
    }
    protected void search_Content(object sender, EventArgs e)
    {
        if (selectedFilename != null)
        {
            string file = Text1.Value;


        }
    }


}



