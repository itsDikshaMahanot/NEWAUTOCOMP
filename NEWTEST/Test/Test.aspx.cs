using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

public partial class Test_Test : System.Web.UI.Page
{
    string selectedFilename;
    static string selectedFileID;
    string textToSearch;
    string outputFilePath;
    string root = @"C:\Users\diksham\Desktop\temp";
    string fileName;
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (File.ReadAllText(path).Contains(domain))
        //{
        //    MessageBox.Show("There is a match");
        //}
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
                try
                {
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                }
                catch (Exception exception)
                {
                    //status.Text = "Choose the correct File with correct format";
                    exception.Message.ToString();
                }


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
                //System.Diagnostics.Debug.WriteLine(" =====>" + contentType);
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
                    status.Text = "File Uploaded";
                    BindGrid(filename);
                }
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
    protected void search_File(object sender, EventArgs e)
    {

        filename = Text2.Value;
        BindGrid(filename);
        if (sysconfigA_Result.Visible == true || sysconfigR_Result.Visible == true || generate_Temp.Enabled == true)
        {

            GridView1.Visible = true;
            sysconfigA_Result.Visible = false;
            sysconfigR_Result.Visible = false;
            sysconfigR_Result.Text = null;
            template.Text = null;

        }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //selectedFilename = GridView1.SelectedRow.Cells[3].Text;
        GridView1.DataSource = null;
        selectedFileID = GridView1.SelectedRow.Cells[1].Text;


        //result.Text = "File ID to Search :"+selectedFileID;
    }
    protected void demobutton() //to refresh the gridview index
    {
        GridView1.SelectedIndex = -1;
        deleteDir(root, outputFilePath);
    }
    protected void search_FileFromSerialNumber(string selectedFileSerial)
    {
        string fileid = selectedFileSerial;

        System.IO.Directory.CreateDirectory(root);

        // Create a file name for the file you want to create.
        fileName = "MyCurrentLogs.txt";

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
                using (var reader = cmd.ExecuteReader(CommandBehavior.SequentialAccess))
                {
                    if (reader.Read())
                    {
                        // again, we map the result to an SqlBytes instance
                        var bytes = reader.GetSqlBytes(0); // column ordinal, here 1st column -> 0

                        // using file stream
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
        //  by using FileInfo instance method.
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



    public void gen_Temp(string pathToFile)
    {
        bool flag = false;
        bool flagA = false;
        bool flagR = false;
        using (StreamReader reader = new StreamReader(outputFilePath))
        {
            string line;
            try
            {

                while ((line = reader.ReadLine()) != null)
                {
                    System.Diagnostics.Debug.WriteLine(">-----------------<" + line);
                    string sysA = @"\w[a-z]+\s[-]a";
                    Regex myRegex = new Regex(sysA);
                    Console.WriteLine(line);
                    Match A = myRegex.Match(line);
                    if (A.Success)
                    {
                        flagA = true;
                        break;

                    }
                }
                while ((line = reader.ReadLine()) != null)
                {
                    System.Diagnostics.Debug.WriteLine("--------------------)" + line);
                    string sysR = @"\w[a-z]+\s[-]r";
                    Regex regex = new Regex(sysR);
                    Match R = regex.Match(line);
                    if (R.Success)
                    {
                        flagR = true;
                        break;

                    }
                }

                if (flagA == true && flagR == true)
                {
                    flag = true;

                }
                if (flagA != true || flagR != true)
                {

                    template.Text = "Choose file with both output";
                }


            }
            catch (Exception e)
            {

                e.Message.ToString();
            }


        }
        List<string> TempA = new List<string>();
        List<string> TempAS = new List<string>();
        List<string> rout = new List<string>();
        List<string> aout = new List<string>();
        string checkfail = "(Failed)";
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
                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text = "<br/>" + " RESULT : <br/>" + m.ToString() + "<br/>";
                        break;
                    }
                }
            Found1:
                while ((line = reader.ReadLine()) != null)
                {

                    System.Diagnostics.Debug.WriteLine(" =====>" + line);
                    string adapter = @"slot\s[0-9:]+\s[A-Z]+\s[A-Za-z]+\s[A-Za-z]+\s[0-9a-z]+\s[(][A-Za-z-\s]+[0-9]+\s[A-Za-z.]+\s[A-Za-z0-9,]+\s[A-Z,]+\s<.+>[)]";
                    Regex adpregex = new Regex(adapter);
                    Match adm = adpregex.Match(line);
                    if (adm.Success)
                    {
                        if (line.Contains("<UP>"))
                            TempAS.Add(adm.ToString() + "&lt;UP&gt;");
                        else if (line.Contains("<DOWN>"))
                            TempAS.Add(adm.ToString() + "&lt;DOWN&gt;");
                    }
                    System.Diagnostics.Debug.WriteLine("------>" + line);
                    //need to check for after each slot only particular adapter to show its failed disk.
                    string textregex = @"\d+\.?\d*\s?[:]\s\w*\s+[A-Z0-9_]*\s[A-Z0-9]+\s\d+\.\w*\s[0-9A-Za-z/]+\s[(][Failed]+[)]*";
                    Regex diskregex = new Regex(textregex);
                    Match ma = diskregex.Match(line);
                    if (ma.Success)
                    {
                        GridView1.Visible = false;
                        TempA.Add(ma.ToString());
                        Console.WriteLine(TempA.Count());
                    }

                    if (adpregex.Match(line).Success)
                    {
                        goto Found1;
                    }
                    GridView1.Visible = false;
                }
            }
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
                        sysconfigA_Result.Visible = false;
                        template.Visible = false;
                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text += "<br/>" + m1.ToString() + "<br/>";
                        break;
                    }
                }
            }
            using (StreamReader reader = new StreamReader(pathToFile))
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
                        sysconfigA_Result.Visible = false;
                        // sysconfigR_Result.Visible = true;
                        //template.Visible = true;
                        rout.Add(m3.ToString());
                        Console.WriteLine(rout.Count());
                    }
                }
            }
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line.Contains(checkfail))
                    {
                        string test = @"([A-Z0-9]+[_][A-Z0-9]+)+";
                        Regex tregex = new Regex(test);
                        Match m31 = tregex.Match(line);
                        if (m31.Success)
                        {
                            GridView1.Visible = false;
                            sysconfigA_Result.Visible = false;
                            // template.Visible = true;
                            aout.Add("   Model : " + m31.ToString());
                            Console.WriteLine(aout.Count());
                        }
                    }

                }
            }

        }
        System.Diagnostics.Debug.WriteLine("Temp A : " + TempA.Count() + " ROUT : " + rout.Count() + " AOUT : " + aout.Count());
        for (int i = 0; i < TempA.Count(); i++)
        {
            sysconfigR_Result.Text += "<br/>" + rout[i] + "   " + "Model:      " + "    "+ aout[i];
        }
    }




    protected void generate_Temp_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex != -1)
        {
            GridView1.Visible = false;
            sysconfigR_Result.Visible = true;
            search_FileFromSerialNumber(selectedFileID);
            template.Visible = true;
            gen_Temp(outputFilePath);
            deleteDir(root, outputFilePath);
            demobutton();
        }
    }

}

