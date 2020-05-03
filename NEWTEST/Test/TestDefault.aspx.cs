﻿using System;
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
        if (result.Visible == true || sysconfigR_Result.Visible == true)
        {
            GridView1.Visible = true;
            result.Visible = false;
            sysconfigR_Result.Visible = false;
        }

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
        //textToSearch = Text1.Value;
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
        searchText(outputPath);
        sysconfigR_Click(outputPath);
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


    public void searchText(string pathToFile)
    {
        bool flag = false;

        string check = "sysconfig -a";

        using (StreamReader reader = new StreamReader(pathToFile))
        {
            string line;
            while ((line = reader.ReadLine()) != null)
            {

                if (line.Contains(check))
                {
                    flag = true;
                    break;
                }

            }

        }

        if (flag == true)
        {
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string cmndregex = @"System Serial Number:\s*[0-9]*\s[(a-zA-Z0-9-_)]*";
                    Regex myRegex = new Regex(cmndregex);
                    Console.WriteLine(line);
                    Match m = myRegex.Match(line);

                    if (m.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = true;
                        result.Text = "RESULT :<br/>" + m.ToString();
                        break;
                    }

                }

            }

            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string adapter = @"slot 0: SAS Host Adapter\s[0-9a-z]*\s[(][A-Za-z0-9]*[-][A-Za-z]*\s[A-Z0-9]*\s[a-z.]*\s[A-Z,]*\s[A-Z,]*\s[<UP>]+[<DOWN>)]*";
                    Regex adpregex = new Regex(adapter);
                    Match adm = adpregex.Match(line);
                    if (adm.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = true;
                        result.Text += "<br/> <br/>" + adm.ToString();

                    }
                }
            }
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string textregex = @"\d+\.?\d*\s?[:]\s\w*\s+[A-Z0-9_]*\s[A-Z0-9]+\s\d+\.\w*\s[0-9A-Za-z/]+\s[(][Failed]+[)]*";
                    Regex diskregex = new Regex(textregex);
                    Console.WriteLine(line);
                    Match ma = diskregex.Match(line);
                    if (ma.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = true;
                        generate_Temp.Visible = true;
                        result.Text += "<br/> <br/>" + ma.ToString();

                    }

                }

            }
        }
    }



    protected void sysconfigR_Click(string pathToFile)
    {
        bool flag = false;
        string check = "sysconfig -r";

        using (StreamReader reader = new StreamReader(pathToFile))
        {
            string line;
            while ((line = reader.ReadLine()) != null)
            {

                if (line.Contains(check))
                {
                    flag = true;
                    break;
                }

            }

        }
        if (flag == true)
        {
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string chkgex = @"Broken disks";
                    Regex chregex = new Regex(chkgex);
                    Console.WriteLine(line);
                    Match m1 = chregex.Match(line);
                    if (m1.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = false;
                        sysconfigR_Result.Visible = true;
                        generate_Temp.Visible = true;
                        sysconfigR_Result.Text = m1.ToString();
                    }
                }
            }
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string brokendisk = @"^[failed]*\s*[0-9a-z.]+\s*[0-9a-z]+\s*\w*\s*[0-9]+\s*[A-Z:]*\s+[0-9]*\s*\w*\s[0-9]*\s[0-9/]*\s[0-9/]*";
                    Regex chregex = new Regex(brokendisk);
                    Console.WriteLine(line);
                    Match m2 = chregex.Match(line);
                    if (m2.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = false;
                        sysconfigR_Result.Visible = true;
                        generate_Temp.Enabled = true;
                        sysconfigR_Result.Text +="<br/> <br/>" + m2.ToString();
                    }
                }
            }
        }
    }
}




