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
using System.Collections;

public partial class Test_Search_sysconfigout : System.Web.UI.Page
{

    string selectedFilename;
    static string selectedFileID;
    string textToSearch;
    string outputFilePath;
    string root = @"C:\Users\diksham\Desktop\temp";

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
                BindGrid(filename);
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
        if (result.Visible == true || sysconfigR_Result.Visible == true || generate_Temp.Enabled == false)
        {

            GridView1.Visible = true;
            result.Visible = false;
            sysconfigR_Result.Visible = false;
            template.Text = "";


        }

    }
    //Control control;
    //public void reset(Control control)
    //{
    //    foreach (Control x in control.Controls)
    //    {
    //        if (x is Label)
    //        {
    //            (x as Label).Text = "";
    //        }
    //    }
    //}



    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //selectedFilename = GridView1.SelectedRow.Cells[3].Text;
        GridView1.DataSource = null;
        selectedFileID = GridView1.SelectedRow.Cells[1].Text;

        //result.Text = "File ID to Search :"+selectedFileID;
    }
    protected void search_FileFromSerialNumber(string selectedFileSerial)
    {
        string fileid = selectedFileSerial;

        System.IO.Directory.CreateDirectory(root);

        // Create a file name for the file you want to create.
        string fileName = "MyCurrentLogs.txt";

        string pathString = System.IO.Path.Combine(root, fileName);

        // Verify the path that you have constructed.
        Console.WriteLine("Path to my file: {0}\n", root);

        outputFilePath = pathString;

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
                        if (!System.IO.File.Exists(outputFilePath))
                        {
                            using (System.IO.FileStream fs = System.IO.File.Create(outputFilePath))
                            {

                            }
                            using (var file = File.OpenWrite(outputFilePath))
                            {
                                bytes.Stream.CopyTo(file);
                            }
                        }

                    }
                }

                con.Close();
            }
        }




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


    public void sysconfig_a_Search(string pathToFile)
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
                    string adapter = @"slot 0:\s[A-Z]+\s[A-Za-z]+\s[A-Za-z]+\s[0-9a-z]+\s[(][A-Za-z-\s]+[0-9]+\s[A-Za-z.]+\s[A-Za-z0-9,]+\s[A-Z,]+\s<.+>[)]";
                    Regex adpregex = new Regex(adapter);
                    Match adm = adpregex.Match(line);
                    if (adm.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = true;
                        if (line.Contains("&lt;UP&gt;"))
                            result.Text += "<br/> <br/>" + adm.ToString() + "&lt;UP&gt;";
                        if (line.Contains("&lt;DOWN&gt;"))
                            result.Text += "<br/> <br/>" + adm.ToString() + "&lt;UP&gt;";

                        result.Text += "<br/> <br/>" + adm.ToString() + "&lt;UP&gt;";
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
                        generate_Temp.Enabled = false;
                        result.Text += "<br/> <br/>" + ma.ToString();


                    }

                }

            }
        }
        deleteDir(root, outputFilePath);
    }

    protected void sysconfig_r_Search(string pathToFile)
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
                    Match m1 = chregex.Match(line);
                    if (m1.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = false;
                        template.Visible = false;
                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text = m1.ToString();
                        break;
                    }
                }
            }
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string brokendisk = @"failed\s+[0-9a-z.]+\s+[0-9a-z]+\s+[0-9]+\s+[0-9]+\s+[A-Z:]+\s+[0-9]+\s+[A-Z]+\s+[0-9]+\s+[0-9/]+\s+[0-9/]+";
                    Regex chregex = new Regex(brokendisk);
                    Console.WriteLine(line);
                    Match m2 = chregex.Match(line);
                    if (m2.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = false;
                        template.Visible = false;
                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text += "<br/> <br/>" + m2.ToString();


                    }
                }
            }
        }
    }

    public void gen_Temp(string pathToFile)
    {
        bool flag = false;
        string check = "Broken disks";
        using (StreamReader reader = new StreamReader(outputFilePath))
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
            int i;
            List<string> rout = new List<string>();
            List<string> aout = new List<string>();

            using (StreamReader reader = new StreamReader(outputFilePath))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {

                    string temp = @"failed\s+[0-9a-z.]+";
                    Regex tempregex = new Regex(temp);
                    Match m3 = tempregex.Match(line);
                    if (m3.Success)
                    {
                        GridView1.Visible = false;
                        result.Visible = false;
                        sysconfigR_Result.Visible = false;
                        template.Visible = true;
                        //template.Text += "Need to replace the disk given below:";
                        rout.Add(m3.ToString());

                    }
                }
            }
            using (StreamReader reader = new StreamReader(outputFilePath))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    string checkfail = "(Failed)";
                    if (line.Contains(checkfail))
                    {
                        string test = @"([A-Z0-9]+[_][A-Z0-9]+)+";
                        Regex tregex = new Regex(test);
                        Match m31 = tregex.Match(line);
                        if (m31.Success)
                        {
                            GridView1.Visible = false;
                            result.Visible = false;
                            sysconfigR_Result.Visible = false;
                            template.Visible = true;
                            //template.Text += " <br/> Model : <br/> " + m31.ToString() + "<br>";
                            aout.Add("   Model : " + m31.ToString());
                        }
                    }

                }
            }

            for (i = 0; i <= aout.Count() - 1; i++)
            {

                template.Text += rout[i] + " \t" + aout[i] + "<br>";
                
            }
            for (i = 0; i <= rout.Count() - 1; i++)
            {
                template.Text += rout[i] + "<br>";
            }
        }
        generate_Temp.Enabled = false;
    }

    protected void sysconfigA_Click(object sender, EventArgs e)
    {
        sysconfigR_Result.Text = "";
        template.Visible = false;
        search_FileFromSerialNumber(selectedFileID);
        sysconfig_a_Search(outputFilePath);
        //generate_Temp.Enabled = true;

    }

    protected void sysconfigR_Click(object sender, EventArgs e)
    {
        result.Text = "";
        template.Visible = false;
        search_FileFromSerialNumber(selectedFileID);
        sysconfig_r_Search(outputFilePath);
        generate_Temp.Enabled = true;

    }


    protected void generate_Temp_Click(object sender, EventArgs e)
    {
        result.Text = " ";
        sysconfigR_Result.Text = "";
        search_FileFromSerialNumber(selectedFileID);
        template.Visible = true;
        gen_Temp(outputFilePath);
        deleteDir(root, outputFilePath);

    }


}




