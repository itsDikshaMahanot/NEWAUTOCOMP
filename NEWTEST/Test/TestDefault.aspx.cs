using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Text.RegularExpressions;
using System.Drawing;

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

    protected void Upload(object sender, EventArgs e)
    {
        if (serialnumber.Value != string.Empty)
        {
            if (FileUpload1.HasFile == true)
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string contentType = FileUpload1.PostedFile.ContentType;
                string srno = serialnumber.Value;
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length); //file stored in binary format.
                        double file_size = fs.Length / 1024; //size of the file
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
                status.Text = "File Uploaded";
            }
            else
                status.Text = "Select FileName";
            //Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            status.Text = "Enter the Serial Number";
        }
    }
    string filename;
    protected void search_File(object sender, EventArgs e)
    {
        filename = Text2.Value;
        BindGrid(filename);
    }

    string selectedFilename;
    static string selectedFileID;
    string textToSearch;

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        selectedFilename = GridView1.SelectedRow.Cells[3].Text;
        selectedFileID = GridView1.SelectedRow.Cells[1].Text;

        //result.Text = "File ID to Search :"+selectedFileID;
    }
    protected void search_Content(object sender, EventArgs e)
    {
        textToSearch = Text1.Value;
        string fileid = selectedFileID;
        string root = @"C:\Users\diksham\Desktop\temp";

        System.IO.Directory.CreateDirectory(root);

        // Create a file name for the file you want to create.
        string fileName = "MyCurrentLogs.txt";

        string pathString = System.IO.Path.Combine(root, fileName);

        // Verify the path that you have constructed.
        Console.WriteLine("Path to my file: {0}\n", root);

        string outputPath = pathString;

        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {

                cmd.CommandText = "select data from Upload_Log where id = " + fileid;
                cmd.Connection = con;
                con.Open();
                // Console.WriteLine("hello im here");
                using (var reader = cmd.ExecuteReader(CommandBehavior.SequentialAccess))
                {
                    if (reader.Read())
                    {
                        // again, we map the result to an SqlBytes instance
                        var bytes = reader.GetSqlBytes(0); // column ordinal, here 1st column -> 0

                        // I use a file stream, but that could be any stream (asp.net, memory, etc.)
                        if (!System.IO.File.Exists(outputPath))
                        {
                            using (System.IO.FileStream fs = System.IO.File.Create(outputPath))
                            {

                            }
                            using (var file = File.OpenWrite(outputPath))
                            {
                                bytes.Stream.CopyTo(file);
                            }
                        }


                    }
                }

                con.Close();
            }
        }
        searchText(outputPath, textToSearch);
        deleteDir(root, outputPath);

    }

    public void deleteDir(string root, string output)
    {
        // ...or by using FileInfo instance method.
        System.IO.FileInfo fi = new System.IO.FileInfo(output);
        try
        {
            fi.Delete();
        }
        catch (System.IO.IOException e)
        {
            Console.WriteLine(e.Message);
        }

        // ...or with DirectoryInfo instance method.
        System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(root);
        // Delete this dir and all subdirs.
        try
        {
            di.Delete(true);
        }
        catch (System.IO.IOException e)
        {
            Console.WriteLine(e.Message);
        }
    }

    public void searchText(string pathToFile, string diskaddr)
    {
        string cmnd = commands.SelectedItem.Value; ;
        //foreach (var line in File.ReadLines(pathToFile))
        //{
        //    line.Trim();
        //    if (line.Contains(cmnd))
        //    {
        //        result.Text = "Found";
        //        break;
        //    }
        //    else
        //    {
        //        result.Text = "Not Found";
        //        break;

        //    }
        //}

        searchCmdInFile(cmnd, diskaddr, pathToFile);

    }

    public void searchCmdInFile(string cmnd, string diskaddr, string path)
    {
        bool flag = false;

        using (StreamReader reader = new StreamReader(path))
        {
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                if (line.Contains(cmnd))
                {
                    result.ForeColor = Color.Green;
                    result.Visible = true;
                    //result.Text = "Command Found";
                    flag = true;
                    break;
                }
                else
                {
                    result.Visible = true;
                    result.ForeColor = Color.Red;
                    result.Text = "Command Not Found";
                }
            }
        }

        if (flag)
        {
            using (StreamReader reader = new StreamReader(path))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line.Contains(diskaddr))
                    {
                        result.ForeColor = Color.Green;
                        result.Visible = true;
                        result.Text = " Disk Found \n " + diskaddr +"\n" +line;
                        break;
                    }
                    else
                    {
                        result.Visible = true;
                        result.ForeColor = Color.Red;
                        result.Text = "Disk Not Found !!";
                    }
                }
            }
        }
        
    }


}



