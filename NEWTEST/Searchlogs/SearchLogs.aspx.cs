using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Runtime.InteropServices.ComTypes;

public partial class Test_local : System.Web.UI.Page
{

    string root = @"C:\Users\diksham\Desktop\temp\";

    string filename, NewfileName = "MyCurrentLogs.txt";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Upload(object sender, EventArgs e)
    {
        System.IO.Directory.CreateDirectory(root);

        if (serialnumber.Value != string.Empty)
        {
            if (FileUpload1.HasFile == true)
            {
                filename = NewfileName;
                // string contentType = FileUpload1.PostedFile.ContentType;
                //string srno = serialnumber.Value;
                FileUpload1.SaveAs(@"C:\Users\diksham\Desktop\temp\" + filename);
                Console.WriteLine(filename);
                status.Text = "File Uploaded : " + Path.GetFileName(FileUpload1.PostedFile.FileName);
                sysconfigR_Result.Text = "";
            }
            else
            {
                status.Text = " Can not upload file";
            }
        }
        else
        {
            status.Text = "enter the serial number";
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
    public void gen_Temp()
    {
        string pathToFile = null;
        if (NewfileName != null)
        {
            pathToFile = System.IO.Path.Combine(root, NewfileName);
        }

        bool flag = false;
        bool flagA = false;
        bool flagR = false;
        using (StreamReader reader = new StreamReader(pathToFile))
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

                    sysconfigR_Result.Text = "Choose file with both output";
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
        List<string> dout = new List<string>();
        List<string> haout = new List<string>();
        List<string> shelfout = new List<string>();
        List<string> bayout = new List<string>();
        string checkfail = "(Failed)";
        string modelout = null;

        if (flag == true)
        {
            //checking the serial number from sysconfig-a
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

                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text = "<br/>" + " RESULT : <br/>" + m.ToString() + "<br/>";
                        break;
                    }
                }
                //checking  the slot of host adapter(like 0a or 0b)and it status
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

                        TempA.Add(ma.ToString());
                        Console.WriteLine(TempA.Count());
                    }

                    if (adpregex.Match(line).Success)
                    {
                        goto Found1;
                    }

                }
            }
            //checking model Name from sysonfig-a(like AFF, FAS,etc)
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    System.Diagnostics.Debug.WriteLine("++++++>" + line);
                    if (line.Contains("Model Name:"))
                    {
                        string model1 = @"\w[A-Z]+[\s]?[A-Z0-9a-z]+";
                        Regex m1regex = new Regex(model1);
                        Match mm1 = m1regex.Match(line);
                        if (mm1.Success)
                        {
                            modelout = mm1.ToString();
                            break;
                        }
                    }
                }
                //Checking of failed disk address in sysonfig-a(like 0a.11.10)
                while ((line = reader.ReadLine()) != null)
                {
                    System.Diagnostics.Debug.WriteLine("!!!!!!!!" + line);
                    if (line.Contains("failed"))
                    {
                        string HA = @"\b[0-9]+[a-z]+";  //(checking for adapter(0a)
                        Regex HAregex = new Regex(HA);
                        Match ha = HAregex.Match(line);
                        if (ha.Success)
                        {
                            haout.Add(ha.ToString());
                        }
                        string shelf = @"\b\w[0-9]+";   //checking for shelf(like 11)
                        Regex shelfregex = new Regex(shelf);
                        Match Shelf = shelfregex.Match(line);
                        if (Shelf.Success)
                        {
                            shelfout.Add(Shelf.ToString());
                        }
                    }
                }
            }
            //checking for bay number in file
            using (StreamReader reader = new StreamReader(pathToFile))
            {
                string line;
                while ((line = reader.ReadLine()) != null)
                {
                    if (line.Contains("failed"))
                    {
                        string bay = @"[0-9]+\s";
                        Regex bayregex = new Regex(bay);
                        Match Bay = bayregex.Match(line);
                        if (Bay.Success)
                        {
                            bayout.Add(Bay.ToString());
                        }

                    }
                }

                System.Diagnostics.Debug.WriteLine(" HA : " + haout.Count() + "shelf :" + shelfout.Count() + "bay" + bayout.Count());

                for (int i = 0; i < TempA.Count(); i++)
                {
                    if (modelout != null)
                        sysconfigR_Result.Text += "<br/>" + "Replace Disk on Channel : " + haout[i].PadRight(3, '-') + "on Shelf :-" + shelfout[i].PadRight(5, '-') + " on Bay :" + bayout[i].PadRight(6, '-') + "Filer: " + modelout;
                    else
                        sysconfigR_Result.Text = "Select the correct file";
                }

            }
            // expression for Broken disk
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
                        sysconfigR_Result.Visible = true;
                        sysconfigR_Result.Text += "<br/> <br/>" + m1.ToString() + "<br/>";
                        break;
                    }
                }
            }
            /// Expression to check for failed disk in sysconfig-r
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

                        // sysconfigR_Result.Visible = true;
                        //template.Visible = true;
                        rout.Add(m3.ToString());
                        Console.WriteLine(rout.Count());
                    }
                }
            }
            // expression for checking MODEL NUMBER in sysconfig-a
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
                            aout.Add(m31.ToString());
                            Console.WriteLine(aout.Count());
                        }
                    }

                }
            }
            // checking and retrving from database the part number acc to model number
            string connetionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection con;
            SqlDataReader datareader;
            SqlCommand cmd;
            con = new SqlConnection(connetionString);

            if (aout != null)
            {
                for (int i = 0; i < aout.Count(); i++)
                {
                    con.Open();

                    string query = "select Drive_Part_Number from Diskparts where Model_Number = '" + aout[i] + "'";
                    cmd = new SqlCommand(query, con);
                    datareader = cmd.ExecuteReader();
                    while (datareader.Read())
                        dout.Add(datareader.GetString(0));
                    con.Close();
                }
            }
        }
        //Displaying the failed disk with its part number
        System.Diagnostics.Debug.WriteLine("Temp A : " + TempA.Count() + " ROUT : " + rout.Count() + " AOUT : " + aout.Count() + "HA" + haout.Count());
        for (int i = 0; i < TempA.Count(); i++)
        {
            if (modelout != null)
                sysconfigR_Result.Text += "<br/>" + rout[i].PadRight(40, '-') + "Part Number :" + dout[i].PadLeft(40, '-');
        }
    }

    protected void generate_Temp_Click(object sender, EventArgs e)
    {
        sysconfigR_Result.Visible = true;
        gen_Temp();
        deleteDir(root, NewfileName);
    }
}

