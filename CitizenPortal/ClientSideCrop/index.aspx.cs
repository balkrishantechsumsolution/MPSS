using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class index : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtAppNo.Text.Trim()))
            {
               // MessageBox.Show("Please enter your Application No");
            }
            else
            {
                string FormId = GetRandomString();
                bool result = ImageCrop1.MoveToServiceFolder("/Quick Links/Croptest/Applicant/", txtAppNo.Text, false);
                if (!ImageCrop1.IsCroped() && result == true)
                {
                    imgOld.ImageUrl = string.Format("/Quick Links/Croptest/Applicant/{0}.jpg?rnd={1}", txtAppNo.Text, DateTime.Now.ToString());
                    imgReplace.ImageUrl = string.Format("/Quick Links/Croptest/Applicant/{0}.jpg", txtAppNo.Text);
                   // MessageBox.Show("Image save sucessfully");
                }
            }


        }
        catch (Exception ex)
        {

            throw new Exception(ex.Message);
        }

    }
    private string GetRandomString()
    {
        string strPwdchar = "0123456789";
        string strPwd = "";
        Random rnd = new Random();
        for (int i = 0; i <= 5; i++)
        {
            int iRandom = rnd.Next(0, strPwdchar.Length - 1);
            strPwd += strPwdchar.Substring(iRandom, 1);
        }
        strPwd = "OS10" + strPwd;
        return strPwd;
    }
    protected void btnReplace_Click(object sender, EventArgs e)
    {
        try
        {
            bool result = ImageCrop1.ReplacePhoto("/Quick Links/Croptest/Applicant/", txtAppNo.Text);
            if (!ImageCrop1.IsCroped() && result == true)
            {
                imgReplace.ImageUrl = string.Format("/Quick Links/Croptest/Applicant/{0}.jpg?rnd={1}", txtAppNo.Text, DateTime.Now.ToString());
                imgOld.ImageUrl = string.Format("/Quick Links/Croptest/Applicant_ClusterBackup/{0}.jpg?rnd={1}", txtAppNo.Text, DateTime.Now.ToString());
                //MessageBox.Show("Image save sucessfully");
            }


        }
        catch (Exception ex)
        {

            throw new Exception(ex.Message);
        }
    }
}
