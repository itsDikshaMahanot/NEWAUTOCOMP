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
        if (sysconfigA_Result.Visible == true || sysconfigR_Result.Visible == true || generate_Temp.Enabled == false)
        {

            GridView1.Visible = true;
            sysconfigA_Result.Visible = false;
            sysconfigR_Result.Visible = false;
            template.Text = "";


        }

    }
    protected void DemoGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //TO DO: make script a global variable
            var script = "document.getElementByID('" + srchFile.ClientID + "').click();";
            e.Row.Attributes.Add("onclick", script);
        }
    }
    protected void demobutton() //to refresh the gridview index
    {
        GridView1.SelectedIndex = -1;
        deleteDir(root, outputFilePath);
    }



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
        if (GridView1.SelectedIndex >= -1)
        {
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
                            sysconfigA_Result.Visible = true;
                            sysconfigA_Result.Text = "RESULT :<br/>" + m.ToString();
                            break;
                        }
                    }
                }

                using (StreamReader reader = new StreamReader(pathToFile))
                {
                    string line;
                Found:
                    while ((line = reader.ReadLine()) != null)
                    {
                        string adapter = @"slot 0:\s[A-Z]+\s[A-Za-z]+\s[A-Za-z]+\s[0-9a-z]+\s[(][A-Za-z-\s]+[0-9]+\s[A-Za-z.]+\s[A-Za-z0-9,]+\s[A-Z,]+\s<.+>[)]";
                        Regex adpregex = new Regex(adapter);
                        Match adm = adpregex.Match(line);

                        if (adm.Success)
                        {
                            if (line.Contains("<UP>"))
                                sysconfigA_Result.Text += "<br/> <br/>" + adm.ToString() + "&lt;UP&gt;";
                            else if (line.Contains("<DOWN>"))
                                sysconfigA_Result.Text += "<br/> <br/>" + adm.ToString() + "&lt;DOWN&gt;";

                            while ((line = reader.ReadLine()) != null)
                            {
                                System.Diagnostics.Debug.WriteLine(line);
                                //need to check for after each slot only particular adapter to show its failed disk.
                                string textregex = @"\d+\.?\d*\s?[:]\s\w*\s+[A-Z0-9_]*\s[A-Z0-9]+\s\d+\.\w*\s[0-9A-Za-z/]+\s[(][Failed]+[)]*";
                                Regex diskregex = new Regex(textregex);
                                Console.WriteLine(line);
                                Match ma = diskregex.Match(line);
                                if (ma.Success)
                                {
                                    GridView1.Visible = false;
                                    sysconfigA_Result.Visible = true;
                                    generate_Temp.Enabled = false;
                                    sysconfigA_Result.Text += "<br/> <br/>" + ma.ToString();
                                }

                                if (adpregex.Match(line).Success)
                                {
                                    if (line.Contains("<UP>"))
                                        sysconfigA_Result.Text += "<br/> <br/>" + adm.ToString() + "&lt;UP&gt;";
                                    else if (line.Contains("<DOWN>"))
                                        sysconfigA_Result.Text += "<br/> <br/>" + adm.ToString() + "&lt;DOWN&gt;";
                                    goto Found;
                                }
                            }
                            GridView1.Visible = false;
                            sysconfigA_Result.Visible = true;
                        }
                    }
                }
            }
        }
    }

    protected void sysconfig_r_Search(string pathToFile)
    {
        bool flag = false;
        string check = "sysconfig -r";

        if (GridView1.SelectedIndex >= 1)
        {
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
                            sysconfigA_Result.Visible = false;
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
                            sysconfigA_Result.Visible = false;
                            template.Visible = false;
                            sysconfigR_Result.Visible = true;
                            sysconfigR_Result.Text += "<br/> <br/>" + m2.ToString();
                        }
                    }
                }
            }
            deleteDir(root, outputFilePath);
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
            string checkfail = "(Failed)";
            string checkF = "failed";
            List<string> rout = new List<string>();
            List<string> aout = new List<string>();
            List<string> diskAddrList = new List<string>();

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
                        sysconfigA_Result.Visible = false;
                        sysconfigR_Result.Visible = false;
                        template.Visible = true;
                        rout.Add(m3.ToString());
                        Console.WriteLine(rout.Count());
                    }
                    if (line.Contains(checkF))
                    {
                        System.Diagnostics.Debug.WriteLine("Current Line :::::::::: ",line);
                        string disk = @"\b\w[0-9.]+";
                        Regex disktest = new Regex(disk);
                        Match m33 = disktest.Match(line);
                        System.Diagnostics.Debug.WriteLine("Current Check Line :::::::::: ", m33.ToString());

                        if (m33.Success)
                        {
                            GridView1.Visible = false;
                            sysconfigA_Result.Visible = false;
                            sysconfigR_Result.Visible = false;
                            template.Visible = true;                          
                            diskAddrList.Add(m33.ToString());
                            System.Diagnostics.Debug.WriteLine("Disk Addr=============>>>", m33.ToString());
                            Console.WriteLine(diskAddrList.Count());
                            // template.ForeColor = System.Drawing.Color.Green;
                        }
                        foreach(string a in diskAddrList)
                        {
                            System.Diagnostics.Debug.WriteLine(a);

                        }
                    }
                    for (i = 0; i < diskAddrList.Count(); i++)
                    {
                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text = rout[i] + "     "+diskAddrList[i] + "<br>";
                    }
                }

            }


            using (StreamReader reader = new StreamReader(outputFilePath))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line.Contains(checkfail))
                    {
                        string test = @"([A-Z0-9]+[_][A-Z0-9]+)+";
                        // string disk = @"[0-9.a-z]+";
                        Regex tregex = new Regex(test);
                        // Regex disktest = new Regex(disk);
                        Match m31 = tregex.Match(line);
                        // Match m32 = disktest.Match(line);
                        if (m31.Success)
                        {
                            GridView1.Visible = false;
                            sysconfigA_Result.Visible = false;
                            sysconfigR_Result.Visible = false;
                            template.Visible = true;
                            aout.Add("   Model : " + m31.ToString());
                        }
                        //if (m32.Success)
                        //{
                        //    GridView1.Visible = false;
                        //    sysconfigA_Result.Visible = false;
                        //    sysconfigR_Result.Visible = false;
                        //    template.Visible = true;
                        //    diskAddrList.Add(m32.ToString());
                        //    template.ForeColor = System.Drawing.Color.Green;
                        //}
                    }

                }
            }

            if (aout.Count >= 0 && rout.Count >= 0 && diskAddrList.Count >= 0)
            {
                for (i = 0; i < aout.Count(); i++)
                {
                    template.Text += rout[i] + " \t" + aout[i] + "<br>" + "Replace Disk at shelf : " + diskAddrList[i] + "<br>";
                }
            }
        }

        generate_Temp.Enabled = false;
    }

    protected void sysconfigA_Click(object sender, EventArgs e)
    {
        if(GridView1.SelectedIndex != -1) { 
        sysconfigR_Result.Text = null;
        template.Visible = false;
        search_FileFromSerialNumber(selectedFileID);
        sysconfig_a_Search(outputFilePath);
        demobutton();
            //generate_Temp.Enabled = true;
        }
    }

    protected void sysconfigR_Click(object sender, EventArgs e)
    {
        if (GridView1.SelectedIndex != -1)
        {
            sysconfigA_Result.Text = null;
            template.Visible = false;
            search_FileFromSerialNumber(selectedFileID);
            sysconfig_r_Search(outputFilePath);
            demobutton();
            generate_Temp.Enabled = true;
        }
    }


    protected void generate_Temp_Click(object sender, EventArgs e)
    {
        sysconfigA_Result.Text = null;
        sysconfigR_Result.Text = null;
        search_FileFromSerialNumber(selectedFileID);
        template.Visible = true;
        gen_Temp(outputFilePath);
        deleteDir(root, outputFilePath);
    }


}




