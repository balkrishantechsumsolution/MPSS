using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Net.Mail;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

namespace CitizenPortal.WebApp.Login
{
    public partial class NewForgetPassword : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
        string UType = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Type"] == null) { Response.Redirect("/customError.aspx?ID="); return; }
            if (Request.QueryString["Type"].ToString() == "") return;
            if (Request.QueryString["Type"].ToString() != null)
            {
                UType = Request.QueryString["Type"].ToString();
                TypeU.Value = UType;
            }
            if (!IsPostBack)
            {
                lblHeaderDetails.Visible = true;
                lblHeaderDetails.Text = "Forget Password";
                pnlfindmyaccount.Visible = false;
                Panel1.Visible = true;
                rbtnMobile.Checked = true;
                rbtnLoginId.Checked = false;
                pnlMobile.Visible = true;
                pnlLoginId.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false;
                txtMobile.Text = "";
                txtFather.Text = "";
                txtEmail.Text = "";
                txtDBO.Text = "";
                rbtnMobileForPnl3.Checked = true;
                rbtnEmailForPnl3.Checked = false;
                txtOPT.Text = "";
                captcha.Text = "";
                TextBox3.Text = "";
                btnCancelFindAccount.Visible = false;
            }
            
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            string str = "";
            if (ViewState["OTPConfirmaitonType"].ToString() == "Username" && txtResendOTP.Text != "")
            {
                if (UType == "G2G")
                {
                    str = "select * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.ProfileId = e2.aadhaarnumber where e1.mobileno='" + TextBox1.Text + "'and isActive=1";
                }
                else
                {
                    str = "select * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.ProfileId = e2.aadhaarnumber where e1.mobile='" + TextBox1.Text + "'and isActive=1";
                }

                //string str = "select * from citizenUserMasterTB where mobile='" + TextBox1.Text + "'";
                SqlDataAdapter da = new SqlDataAdapter(str, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    TextBox1.BorderColor = System.Drawing.Color.White;
                    captcha.BorderColor = System.Drawing.Color.White;
                    string loginid = dt.Rows[0]["loginid"].ToString();
                    HiddenField1.Value = loginid;
                    string value = SendOtpForUsername("", TextBox1.Text, "");
                    //string value = GenerateMobileOTP("", TextBox1.Text, "");
                    DataTable dtt = ConvertJSONToDataTable(value);
                    string data = dtt.Rows[0]["appid"].ToString();
                    HiddenField2.Value = data;
                    string otp = data.Substring(14, 6);
                    ViewState["GenerateOTP"] = otp;
                    DataTable dtOTP = GetOTP(data);
                    txtLoginIdForOTP.Text = loginid;
                    ViewState["OTPConfirmaitonType"] = "Username";
                    txtResendOTP.Text = TextBox1.Text;
                    txtOPT.Text = "";
                    captcha.Text = "";
                    txtMobile.Text = "";
                    txtFather.Text = "";
                    txtEmail.Text = "";
                    txtDBO.Text = "";
                    txtEmailReSend.Text = "";
                    pnlLoginId.Visible = false;
                    pnlLoginId.Visible = false;
                    pnlOtTPMobile.Visible = true;
                    pnlResentMobileNumber.Visible = false;
                    lblResendOTP.Visible = false;

                    pnlResendOTPbyEmailId.Visible = false;
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    rbtnMobileForPnl3.Checked = true;
                    rbtnEmailForPnl3.Checked = false;
                    captcha.Text = "";
                    TextBox3.Text = "";

                    Button4.Enabled = false;
                    Response.Write("<script>alert('Reset Password Validation!</br/>OTP sent on your Mobile Number, please check & verify it !');</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "ShowReSMS();", true);
                    
                    captcha.BorderColor = System.Drawing.Color.White;
                    TextBox1.BorderColor = System.Drawing.Color.White;
                    txtLoginIdForOTP.Visible = false;
                    divloginid.Visible = false;

                    pnlUsername.Visible = false;
                    pnlsendotpforfindmyaccount.Visible = true;
                    pnlfindmyaccount.Visible = false;
                    txtUsername.Visible = false;
                    btnfindmyaccount.Visible = false;
                    btnfindmyaccountsendotp.Visible = true;
                    ltlFinfmyaccount.Visible = true;
                }
            }
            if (txtResendOTP.Text != "" && ViewState["OTPConfirmaitonType"].ToString() != "Username")
            {
                
                DataTable dt = new DataTable();

                if (UType == "G2G")
                {
                    str = "select top 1 * from Dept_G2GProfileMasterTb where mobileNo='" + txtResendOTP.Text + "' and IsActive = 1 order by RowId desc";
                    SqlDataAdapter da = new SqlDataAdapter(str, con);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nSent OTP on this Mobile Number : '+ '" + dt.Rows[0]["mobileno"].ToString() + "' + '  & Please Verify it!')</script>");
                        string loginid = dt.Rows[0]["LoginID"].ToString();
                        HiddenField1.Value = loginid;
                        string value = GenerateMobileOTP("", txtResendOTP.Text, "");
                        DataTable dtt = ConvertJSONToDataTable(value);
                        string data = dtt.Rows[0]["appid"].ToString();
                        HiddenField2.Value = data;
                        string otp = data.Substring(14, 6);
                        ViewState["GenerateOTP"] = otp;
                        DataTable dtOTP = GetOTP(data);
                        txtLoginIdForOTP.Text = loginid;
                        ViewState["OTPConfirmaitonType"] = "M";
                        //Response.Write("<script>alert('Please check resend OTP on your Mobile Number !')</script>");
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                    }
                }
                else
                {
                    str = "select * from citizenUserMasterTB where mobile='" + txtResendOTP.Text + "'";
                    SqlDataAdapter da = new SqlDataAdapter(str, con);
                    da.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nSent OTP on this Mobile Number : '+ '" + dt.Rows[0]["mobileno"].ToString() + "' + '  & Please Verify it!')</script>");
                        string loginid = dt.Rows[0]["profileID"].ToString();
                        HiddenField1.Value = loginid;
                        string value = GenerateMobileOTP("", txtResendOTP.Text, "");
                        DataTable dtt = ConvertJSONToDataTable(value);
                        string data = dtt.Rows[0]["appid"].ToString();
                        HiddenField2.Value = data;
                        string otp = data.Substring(14, 6);
                        ViewState["GenerateOTP"] = otp;
                        DataTable dtOTP = GetOTP(data);
                        txtLoginIdForOTP.Text = loginid;
                        ViewState["OTPConfirmaitonType"] = "M";
                        //Response.Write("<script>alert('Please check resend OTP on your Mobile Number !')</script>");
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                    }
                }


                
                //da.Fill(dt);
                //if (dt.Rows.Count > 0)
                //{
                //    Response.Write("<script>alert('Reset Password Validation!\\nSent OTP on this Mobile Number : '+ '" + dt.Rows[0]["mobile"].ToString() + "' + '  & Please Verify it!')</script>");
                //    string loginid = dt.Rows[0]["profileID"].ToString();
                //    HiddenField1.Value = loginid;
                //    string value = GenerateMobileOTP("", txtResendOTP.Text, "");
                //    DataTable dtt = ConvertJSONToDataTable(value);
                //    string data = dtt.Rows[0]["appid"].ToString();
                //    HiddenField2.Value = data;
                //    string otp = data.Substring(14, 6);
                //    ViewState["GenerateOTP"] = otp;
                //    DataTable dtOTP = GetOTP(data);
                //    txtLoginIdForOTP.Text = loginid;
                //    ViewState["OTPConfirmaitonType"] = "M";
                //    //Response.Write("<script>alert('Please check resend OTP on your Mobile Number !')</script>");
                //    Panel2.Visible = true;
                //    Panel3.Visible = false;
                //    txtOPT.Text = "";
                //}
            }
            if (txtEmailReSend.Text != "")
            {
                if (UType == "G2G")
                {
                    str = "select * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.loginid = e2.aadhaarnumber where e1.loginid = '" + txtLoginId.Text + "' and isActive=1";
                }
                else
                {
                    str = "select * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.loginid = e2.aadhaarnumber where e1.loginid = '" + txtLoginId.Text + "' and isActive=1";
                }

                SqlDataAdapter da = new SqlDataAdapter(str, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    string loginid = dt.Rows[0]["profileID"].ToString();
                    HiddenField1.Value = loginid;

                    string value = GenerateMobileOTP("", "", txtEmailReSend.Text);
                    DataTable dtt = ConvertJSONToDataTable(value);
                    string data = dtt.Rows[0]["appid"].ToString();
                    HiddenField2.Value = data;
                    string otp = data.Substring(13, 6);
                    ViewState["GenerateOTP"] = otp;
                    DataTable dtOTP = GetOTP(data);
                    string appid = dtt.Rows[0]["appid"].ToString();

                    string username = dt.Rows[0]["username"].ToString();
                    sendMail(username, otp, txtLoginId.Text);
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease check resend OTP on your mail !')</script>");
                    txtOPT.Text = "";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "";

            if (UType == "G2G")
            {
                forDept.Visible = false;
                forDeptDOB.InnerText = "Date Of Joining";
            }
            if (UType == "Citizen")
            {
                forDept.Visible = true;
                forDeptDOB.InnerText = "Date Of Birth";
            }

            if (lbtnLostLoginID.Text == "Have you lost your Login ID ?" && rbtnMobile.Checked == false && rbtnLoginId.Checked == false)
            {
                if (TextBox1.Text != "")
                {
                    Regex phoneNumpattern = new Regex(@"^[789]\d{9}$");

                    //Regex phoneNumpattern = new Regex(@"^((\+){0,1}91(\s){0,1}(\-){0,1}(\s){0,1}){0,1}9[0-9](\s){0,1}(\-){0,1}(\s){0,1}[1-9]{1}[0-9]{7}$");
                    if (phoneNumpattern.IsMatch(TextBox1.Text))
                    {
                        if (captcha.Text != "")
                        {
                            if (captcha.Text == Session["LoginCaptchaTest"].ToString())
                            {
                                if (UType == "G2G")
                                {
                                    str = "select * from Dept_G2GProfileMasterTb where mobileno='" + TextBox1.Text + "' and IsActive = 1";
                                }
                                if (UType == "Citizen")
                                {
                                    str = "select * from citizenUserMasterTB where mobile='" + TextBox1.Text + "'  and IsActive = 1";
                                }
                                SqlDataAdapter da = new SqlDataAdapter(str, con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    captcha.BorderColor = System.Drawing.Color.White;
                                    Panel2.Visible = false;
                                    // Panel3.Visible = true;
                                    pnlUsername.Visible = true;
                                    pnlsendotpforfindmyaccount.Visible = false;
                                    pnlfindmyaccount.Visible = true;
                                    txtUsername.Visible = true;
                                    btnfindmyaccount.Visible = true;
                                    btnfindmyaccountsendotp.Visible = false;
                                    ltlFinfmyaccount.Visible = false;

                                    txtLoginId.Text = TextBox2.Text;
                                    pnlLoginId.Visible = false;
                                    pnlLoginId.Visible = false;
                                    pnlOtTPMobile.Visible = true;

                                    Panel1.Visible = false;
                                    //TextBox1.Text = "";
                                    TextBox2.Text = "";
                                    txtLoginIdForOTP.Text = TextBox1.Text;
                                    txtResendOTP.Text = TextBox1.Text;
                                    txtOPT.Text = "";
                                    // captcha.Text = "";
                                    txtMobile.Text = "";
                                    txtFather.Text = "";
                                    txtEmail.Text = "";
                                    txtDBO.Text = "";
                                    pnlResendOTPbyEmailId.Visible = false;
                                    pnlForMobilePnl3.Visible = true;
                                    pnlForEmailPnl3.Visible = false;
                                    rbtnMobileForPnl3.Checked = true;
                                    rbtnEmailForPnl3.Checked = false;
                                    captcha.Text = "";
                                    TextBox3.Text = "";
                                }
                                else
                                {
                                    Response.Write("<script>alert('Reset Password Validation!\\nEntered Mobile Number is not registered!')</script>");
                                    captcha.Text = "";
                                    captcha.BorderColor = System.Drawing.Color.White;
                                    TextBox1.BorderColor = System.Drawing.Color.Red;
                                    TextBox1.Text = "";
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Reset Password Validation!\\nPlease enter correct Captcha!')</script>");
                                captcha.Text = "";
                                captcha.BorderColor = System.Drawing.Color.Red;
                                TextBox1.BorderColor = System.Drawing.Color.White;
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Captcha !')</script>");
                            captcha.BorderColor = System.Drawing.Color.Red;
                            TextBox1.BorderColor = System.Drawing.Color.White;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nPlease enter valid Mobile Number!')</script>");
                        Response.Write("");
                        TextBox1.Text = "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Mobile Number!')</script>");
                    TextBox1.BorderColor = System.Drawing.Color.Red;
                    rbtnLoginId.Checked = false;
                    rbtnMobile.Checked = true;
                }
            }
            else if (TextBox1.Text != "" && rbtnMobile.Checked == true && rbtnLoginId.Checked == false)
            {
                if (TextBox1.Text != "")
                {
                    Regex phoneNumpattern = new Regex(@"^[789]\d{9}$");
                    if (phoneNumpattern.IsMatch(TextBox1.Text))
                    {
                        if (captcha.Text != "")
                        {
                            if (captcha.Text == Session["LoginCaptchaTest"].ToString())
                            {
                                if (UType == "G2G")
                                {
                                    str = "select * from  Dept_G2GProfileMasterTb where MobileNo='" + TextBox1.Text + "' and isActive=1";
                                }
                                if (UType == "Citizen")
                                {
                                    str = "select * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.ProfileId = e2.aadhaarnumber where e1.mobile='" + TextBox1.Text + "' and e1.isActive=1";
                                }

                                //string str = "select * from citizenUserMasterTB where mobile='" + TextBox1.Text + "'";
                                SqlDataAdapter da = new SqlDataAdapter(str, con);
                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    TextBox1.BorderColor = System.Drawing.Color.White;
                                    captcha.BorderColor = System.Drawing.Color.White;
                                    string loginid = dt.Rows[0]["loginid"].ToString();
                                    HiddenField1.Value = loginid;

                                    string value = GenerateMobileOTP("", TextBox1.Text, "");
                                    DataTable dtt = ConvertJSONToDataTable(value);
                                    string data = dtt.Rows[0]["appid"].ToString();
                                    HiddenField2.Value = data;
                                    string otp = data.Substring(14, 6);
                                    ViewState["GenerateOTP"] = otp;
                                    DataTable dtOTP = GetOTP(data);
                                    txtLoginIdForOTP.Text = loginid;
                                    ViewState["OTPConfirmaitonType"] = "M";
                                    txtResendOTP.Text = TextBox1.Text;
                                    txtOPT.Text = "";
                                    captcha.Text = "";
                                    txtMobile.Text = "";
                                    txtFather.Text = "";
                                    txtEmail.Text = "";
                                    txtDBO.Text = "";
                                    txtEmailReSend.Text = "";
                                    pnlLoginId.Visible = false;
                                    pnlLoginId.Visible = false;
                                    pnlOtTPMobile.Visible = true;
                                    pnlResentMobileNumber.Visible = true;

                                    txtResendOTP.Text = TextBox1.Text;
                                    pnlResendOTPbyEmailId.Visible = false;
                                    Panel1.Visible = false;
                                    Panel2.Visible = true;
                                    Panel3.Visible = false;
                                    rbtnMobileForPnl3.Checked = true;
                                    rbtnEmailForPnl3.Checked = false;
                                    captcha.Text = "";
                                    TextBox3.Text = "";
                                    if(UType=="G2G")
                                    {                                        
                                        Button4.Enabled = false;
                                        Response.Write("<script>alert('Reset Password Validation!\\nOTP sent on your Mobile Number : '+ '" + dt.Rows[0]["MobileNo"].ToString() + "' +' , please check & verify it !');</script>");
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "ShowReSMS();", true);

                                    }
                                    if (UType=="Citizen")
                                    {
                                        Button4.Enabled = false;
                                        Response.Write("<script>alert('Reset Password Validation!\\nOTP sent on your Mobile Number : '+ '" + dt.Rows[0]["Mobile"].ToString() + "' +' , please check & verify it !');</script>");
                                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", "ShowReSMS();", true);

                                    }
                                    captcha.BorderColor = System.Drawing.Color.White;
                                    TextBox1.BorderColor = System.Drawing.Color.White;
                                    pnlfindmyaccount.Visible = false;
                                }
                                else
                                {
                                    Response.Write("<script>alert('Reset Password Validation!\\nEntered Mobile Number is not registered!')</script>");
                                    captcha.Text = "";
                                    captcha.BorderColor = System.Drawing.Color.White;
                                    TextBox1.BorderColor = System.Drawing.Color.Red;
                                    TextBox1.Text = "";
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Reset Password Validation!\\nPlease enter correct Captcha !')</script>");
                                captcha.Text = "";
                                captcha.BorderColor = System.Drawing.Color.Red;
                                TextBox1.BorderColor = System.Drawing.Color.White;
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Captcha !')</script>");
                            captcha.BorderColor = System.Drawing.Color.Red;
                            TextBox1.BorderColor = System.Drawing.Color.White;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nPlease enter valid Mobile Number !')</script>");
                        Response.Write("");
                        TextBox1.Text = "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Mobile Number !')</script>");
                    TextBox1.BorderColor = System.Drawing.Color.Red;
                    rbtnLoginId.Checked = false;
                    rbtnMobile.Checked = true;
                }
            }
            else if (TextBox1.Text == "" && rbtnMobile.Checked == true)
            {
                Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Mobile Number !')</script>");
                TextBox1.BorderColor = System.Drawing.Color.Red;
                rbtnLoginId.Checked = false;
                rbtnMobile.Checked = true;
            }

            if (TextBox2.Text != "" && rbtnMobile.Checked == false && rbtnLoginId.Checked == true)
            {
                if (TextBox3.Text != "")
                {
                    if (TextBox3.Text == Session["LoginCaptchaTest"].ToString())
                    {
                        ViewState["otpConfirmaiton"] = "E";

                        if (UType == "G2G")
                        {
                            str = "select * from Dept_G2GProfileMasterTb where loginId='" + TextBox2.Text + "' and isActive=1";
                        }
                        if (UType == "Citizen")
                        {
                            str = "select * from CitizenUserMasterTb where loginId='" + TextBox2.Text + "'and isActive=1";
                        }

                        SqlDataAdapter da = new SqlDataAdapter(str, con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            captcha.BorderColor = System.Drawing.Color.White;
                            Panel2.Visible = false;
                            Panel3.Visible = true;
                            txtLoginId.Text = TextBox2.Text;
                            pnlLoginId.Visible = false;
                            pnlLoginId.Visible = false;
                            pnlOtTPMobile.Visible = true;

                            Panel1.Visible = false;
                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            txtLoginIdForOTP.Text = TextBox1.Text;
                            txtResendOTP.Text = TextBox1.Text;
                            txtOPT.Text = "";
                            // captcha.Text = "";
                            txtMobile.Text = "";
                            txtFather.Text = "";
                            txtEmail.Text = "";
                            txtDBO.Text = "";
                            pnlResendOTPbyEmailId.Visible = false;
                            pnlForMobilePnl3.Visible = true;
                            pnlForEmailPnl3.Visible = false;
                            rbtnMobileForPnl3.Checked = true;
                            rbtnEmailForPnl3.Checked = false;
                            captcha.Text = "";
                            TextBox3.Text = "";
                            pnlfindmyaccount.Visible = false;
                        }
                        else
                        {
                            Panel2.Visible = false;
                            Panel3.Visible = false;

                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            txtOPT.Text = "";
                            txtMobile.Text = "";
                            txtFather.Text = "";
                            txtEmail.Text = "";
                            txtDBO.Text = "";
                            captcha.Text = "";

                            TextBox3.BorderColor = System.Drawing.Color.White;
                            TextBox2.BorderColor = System.Drawing.Color.Red;
                            Response.Write("<script>alert('Reset Password Validation!\\nEntered Login ID is not a valid Login ID!')</script>");
                            TextBox3.Text = "";
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nPlease enter correct Captcha !')</script>");

                        TextBox2.BorderColor = System.Drawing.Color.White;
                        TextBox3.BorderColor = System.Drawing.Color.Red;
                        TextBox3.Text = "";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease enter captcha  !')</script>");
                    TextBox3.BorderColor = System.Drawing.Color.Red;
                    TextBox2.BorderColor = System.Drawing.Color.White;
                    TextBox3.Text = "";
                }
            }
            else if (TextBox2.Text == "" && rbtnLoginId.Checked == true)
            {
                Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Login ID !')</script>");
                TextBox1.BorderColor = System.Drawing.Color.Red;
                TextBox2.BorderColor = System.Drawing.Color.Red;
                rbtnLoginId.Checked = true;
                rbtnMobile.Checked = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string s = "";
            string value = "";

            if (UType == "G2G")
            {
                forDept.Visible = false;
                forDeptDOB.InnerText = "Date Of Joining";
            }
            if (UType == "Citizen")
            {
                forDept.Visible = true;
                forDeptDOB.InnerText = "Date Of Birth";
            }

            if (ViewState["OTPConfirmaitonType"].ToString() == "Username")
            {
                if (txtOPT.Text != "")
                {
                    string generateOTP = ViewState["GenerateOTP"].ToString();

                    string loginid = HiddenField1.Value;
                    string appid = HiddenField2.Value;
                    value = SendUsername("", appid, txtOPT.Text, txtLoginIdForOTP.Text);
                    DataTable dtt = ConvertJSONToDataTable(value);
                    int status = Convert.ToInt32(dtt.Rows[0]["intstatus"].ToString());
                    if (status == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Reset Password Validation!\\nLogin ID SMS to registered Mobile Number !');window.location='/Account/Login';</script>'");

                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        txtResendOTP.Text = "";
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        rbtnMobile.Checked = true;
                        rbtnLoginId.Checked = false;
                        pnlMobile.Visible = true;
                        pnlLoginId.Visible = false;
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.White;
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nOTP does not match!')</script>");
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter OTP !')</script>");
                    txtMobile.Text = "";
                    txtFather.Text = "";
                    txtEmail.Text = "";
                    txtDBO.Text = "";
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    txtOPT.Text = "";
                    txtOPT.BorderColor = System.Drawing.Color.Red;
                }
            }
            else if (ViewState["OTPConfirmaitonType"].ToString() == "MB")
            {
                if (txtOPT.Text != "")
                {
                    string generateOTP = ViewState["GenerateOTP"].ToString();

                    string loginid = HiddenField1.Value;
                    string appid = HiddenField2.Value;

                    if(UType=="G2G")
                    {
                        value = SendForgetPassword("", appid, txtOPT.Text, txtLoginIdForOTP.Text, UType);
                    }

                    if (UType == "Citizen")
                    {
                        value = SendSMS("", appid, txtOPT.Text, txtLoginIdForOTP.Text);
                    }

                    DataTable dtt = ConvertJSONToDataTable(value);
                    int status = Convert.ToInt32(dtt.Rows[0]["intstatus"].ToString());
                    if (status == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Reset Password Validation!\\nLogin ID and Password sent to registered Mobile Number !');window.location='/Account/Login';</script>'");

                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        txtResendOTP.Text = "";
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        rbtnMobile.Checked = true;
                        rbtnLoginId.Checked = false;
                        pnlMobile.Visible = true;
                        pnlLoginId.Visible = false;
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.White;
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nOTP does not match !')</script>");
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter OTP !')</script>");
                    txtMobile.Text = "";
                    txtFather.Text = "";
                    txtEmail.Text = "";
                    txtDBO.Text = "";
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    txtOPT.Text = "";
                    txtOPT.BorderColor = System.Drawing.Color.Red;
                }
            }
            else if (ViewState["OTPConfirmaitonType"].ToString() == "M")
            {
                if (txtOPT.Text != "")
                {
                    string generateOTP = ViewState["GenerateOTP"].ToString();

                    string loginid = HiddenField1.Value;
                    string appid = HiddenField2.Value;

                    if (UType == "G2G")
                    {
                        value = SendForgetPassword("", appid, txtOPT.Text, txtLoginIdForOTP.Text, UType);
                    }

                    if (UType == "Citizen")
                    {
                        value = SendSMS("", appid, txtOPT.Text, txtLoginIdForOTP.Text);
                    }

                    DataTable dtt = ConvertJSONToDataTable(value);
                    int status = Convert.ToInt32(dtt.Rows[0]["intstatus"].ToString());
                    if (status == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Reset Password Validation!\\nLogin ID and Password sent to registered Mobile Number !');window.location='/Account/Login';</script>'");

                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        txtResendOTP.Text = "";
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        rbtnMobile.Checked = true;
                        rbtnLoginId.Checked = false;
                        pnlMobile.Visible = true;
                        pnlLoginId.Visible = false;
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.White;
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nOTP does not match !')</script>");
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease enter OTP !')</script>");
                    txtMobile.Text = "";
                    txtFather.Text = "";
                    txtEmail.Text = "";
                    txtDBO.Text = "";
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    txtOPT.Text = "";
                    txtOPT.BorderColor = System.Drawing.Color.Red;
                }
            }
            else if (ViewState["OTPConfirmaitonType"].ToString() == "E")
            {
                if (txtOPT.Text != "")
                {
                    string generateOTP = ViewState["GenerateOTP"].ToString();

                    string loginid = HiddenField1.Value;
                    string appid = HiddenField2.Value;
                    value = SendSMS("", appid, txtOPT.Text, txtLoginIdForOTP.Text);
                    DataTable dtt = ConvertJSONToDataTable(value);
                    int status = Convert.ToInt32(dtt.Rows[0]["intstatus"].ToString());

                    if (status == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Reset Password Validation!\\nLogin ID and Password sent to your Email ID !');window.location='/Account/Login';</script>'");

                        if (UType == "G2G")
                        {
                            s = "select * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.profileid = e2.aadhaarnumber where e1.loginid = '" + txtLoginId.Text + "' and isActive=1";
                        }
                        if (UType == "Citizen")
                        {
                            s = "select * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.profileid = e2.aadhaarnumber where e1.loginid = '" + txtLoginId.Text + "' and isActive=1";
                        }

                        SqlDataAdapter dAdap = new SqlDataAdapter(s, con);
                        DataTable dtable = new DataTable();
                        dAdap.Fill(dtable);
                        string password = dtable.Rows[0]["password"].ToString();
                        string username = dtable.Rows[0]["username"].ToString();
                        sendMailUsernamePassword(username, password, txtLoginIdForOTP.Text);

                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        Panel1.Visible = true;
                        Panel2.Visible = false;
                        Panel3.Visible = false;
                        pnlMobile.Visible = true;
                        pnlLoginId.Visible = false;
                        rbtnMobile.Checked = true;
                        rbtnLoginId.Checked = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.White;
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nOTP does not match !')</script>");
                        txtResendOTP.Text = "";
                        txtMobile.Text = "";
                        txtFather.Text = "";
                        txtEmail.Text = "";
                        txtDBO.Text = "";
                        Panel1.Visible = false;
                        Panel2.Visible = true;
                        Panel3.Visible = false;
                        rbtnMobile.Checked = true;
                        rbtnLoginId.Checked = false;
                        txtOPT.Text = "";
                        txtOPT.BorderColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease enter OTP !')</script>");
                    txtResendOTP.Text = "";
                    txtMobile.Text = "";
                    txtFather.Text = "";
                    txtEmail.Text = "";
                    txtDBO.Text = "";
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    rbtnMobile.Checked = true;
                    rbtnLoginId.Checked = false;
                    txtOPT.Text = "";
                    txtOPT.BorderColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string s = "";
            string str = "";
            DataTable dt = new DataTable();

            if (UType == "G2G")
            {
                forDept.Visible = false;
                forDeptDOB.InnerText = "Date Of Joining";

                DateTime datetimeValue;
                string date = txtDBO.Text;
                string[] formats = { "dd/mm/yyyy" };

                if (txtDBO.Text == "")
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Date Of Joining !')</script>");
                    txtDBO.BorderColor = System.Drawing.Color.Red;
                    txtEmail.Text = "";
                    txtMobile.Text = "";
                }
                else if (txtDBO.Text != "")
                {
                    if (!DateTime.TryParseExact(date, formats, System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out datetimeValue))
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nPlease enter correct format of Date Of Joining !')</script>");
                        txtDBO.BorderColor = System.Drawing.Color.Red;
                    }

                    if (rbtnMobileForPnl3.Checked == true)
                    {
                        if (txtMobile.Text == "" || txtMobile.Text == null)
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Mobile Number!')</script>");
                            txtMobile.BorderColor = System.Drawing.Color.Red;
                            txtEmail.BorderColor = System.Drawing.Color.White;
                            txtDBO.BorderColor = System.Drawing.Color.White;
                            rbtnMobileForPnl3.Checked = true;
                            rbtnEmailForPnl3.Checked = false;
                        }
                    }

                    if (rbtnEmailForPnl3.Checked == true)
                    {
                        if (txtEmail.Text == "" || txtEmail.Text == null)
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Email ID!')</script>");
                            txtMobile.BorderColor = System.Drawing.Color.White;
                            txtEmail.BorderColor = System.Drawing.Color.Red;
                            txtDBO.BorderColor = System.Drawing.Color.White;
                            rbtnMobileForPnl3.Checked = true;
                            rbtnEmailForPnl3.Checked = false;
                        }
                    }

                    if (DateTime.TryParseExact(date, formats, System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out datetimeValue))
                    {
                        if (txtMobile.Text != "" || txtEmail.Text != "")
                        {
                            DateTime DOB = DateTime.ParseExact(txtDBO.Text, "dd/mm/yyyy", CultureInfo.CurrentCulture);
                            string FormattedDOB = DOB.ToString("yyyy-mm-dd");

                            if (UType == "G2G")
                            {
                                s = "select * from  Dept_G2GProfileMasterTb where LoginID='" + txtLoginId.Text + "' and JoiningDate ='" + FormattedDOB + "' and MobileNo ='" + txtMobile.Text + "' and isActive=1";
                            }

                            SqlDataAdapter ad = new SqlDataAdapter(s, con);

                            ad.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                if (txtMobile.Text != "" && txtEmail.Text == "")
                                {
                                    Regex phoneNumpattern = new Regex(@"^[789]\d{9}$");
                                    if (phoneNumpattern.IsMatch(txtMobile.Text))
                                    {
                                        Response.Write("<script>alert('Reset Password Validation!\\nOTP SMS on registered Mobile Number, please check & verify it !')</script>");
                                        string loginid = dt.Rows[0]["LoginID"].ToString();
                                        HiddenField1.Value = loginid;
                                        string value = GenerateMobileOTP("", txtMobile.Text, "");
                                        DataTable dtt = ConvertJSONToDataTable(value);
                                        string data = dtt.Rows[0]["Appid"].ToString();
                                        HiddenField2.Value = data;
                                        string otp = data.Substring(14, 6);
                                        ViewState["GenerateOTP"] = otp;
                                        DataTable dtOTP = GetOTP(data);
                                        txtLoginIdForOTP.Text = loginid;
                                        ViewState["OTPConfirmaitonType"] = "M";
                                        txtResendOTP.Text = txtMobile.Text;
                                        txtLoginIdForOTP.Text = txtLoginId.Text;
                                        txtEmailReSend.Text = "";
                                        pnlResentMobileNumber.Visible = true;
                                        txtResendOTP.Text = txtMobile.Text;
                                        pnlResendOTPbyEmailId.Visible = false;
                                        Panel2.Visible = true;
                                        Panel3.Visible = false;
                                        rbtnMobile.Checked = true;
                                        rbtnLoginId.Checked = false;
                                        txtEmail.Text = "";
                                        txtMobile.Text = "";
                                        ViewState["OTPConfirmaitonType"] = "MB";
                                        txtMobile.BorderColor = System.Drawing.Color.White;
                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Valid Mobile Number!')</script>");
                                        Panel1.Visible = false;
                                        Panel2.Visible = false;
                                        Panel3.Visible = true;
                                        txtEmail.Text = "";
                                        txtMobile.Text = "";
                                        txtMobile.BorderColor = System.Drawing.Color.Red;
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Valid Mobile Number!')</script>");
                                    Response.Write("");
                                    TextBox1.Text = "";
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Reset Password Validation!\\nEnter Correct Date Of Joining or Mobile No.!')</script>");
                                txtMobile.BorderColor = System.Drawing.Color.Red;
                                txtEmail.BorderColor = System.Drawing.Color.White;
                                txtDBO.BorderColor = System.Drawing.Color.Red;
                                txtMobile.Text = "";
                                txtDBO.Text = "";
                                txtEmail.Text = "";
                            }

                            if (txtMobile.Text == "" && txtEmail.Text != "")
                            {
                                if (UType == "G2G")
                                {
                                    str = "select * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.ProfileId=e2.aadhaarnumber where e1.loginid='" + txtLoginId.Text + "' and e2.dateofbirth ='" + FormattedDOB + "' and isActive=1";
                                }

                                SqlDataAdapter da = new SqlDataAdapter(str, con);

                                da.Fill(dt);
                                if (dt.Rows.Count > 0)
                                {
                                    string loginid = dt.Rows[0]["profileID"].ToString();
                                    HiddenField1.Value = loginid;

                                    string value = GenerateMobileOTP("", "", txtEmail.Text);
                                    DataTable dtt = ConvertJSONToDataTable(value);
                                    string data = dtt.Rows[0]["appid"].ToString();
                                    HiddenField2.Value = data;
                                    string otp = data.Substring(13, 6);
                                    ViewState["GenerateOTP"] = otp;
                                    DataTable dtOTP = GetOTP(data);
                                    string appid = dtt.Rows[0]["appid"].ToString();
                                    string username = dt.Rows[0]["username"].ToString();
                                    sendMail(username, otp, txtLoginId.Text);
                                    Panel2.Visible = true;
                                    Panel3.Visible = false;
                                    ViewState["OTPConfirmaitonType"] = "E";
                                    txtLoginIdForOTP.Text = txtLoginId.Text;
                                    txtEmailReSend.Text = txtEmail.Text;
                                    txtResendOTP.Text = "";
                                    pnlLoginId.Visible = false;
                                    pnlOtTPMobile.Visible = true;
                                    pnlResentMobileNumber.Visible = false;
                                    pnlResendOTPbyEmailId.Visible = true;
                                    rbtnMobile.Checked = true;
                                    rbtnLoginId.Checked = false;
                                    txtResendOTP.Text = txtEmail.Text;
                                    txtMobile.Text = "";
                                    txtEmail.BorderColor = System.Drawing.Color.White;
                                    Response.Write("<script>alert('Reset Password Validation!\\nOTP sent to your Email ID : '+ '" + txtEmail.Text + "' + ' , please check & verify it !')</script>");
                                }
                                else
                                {
                                    Response.Write("<script>alert('Reset Password Validation!\\nEmail ID does not exists !')</script>");
                                    Panel1.Visible = false;
                                    Panel2.Visible = false;
                                    Panel3.Visible = true;
                                    txtEmail.Text = "";
                                    txtMobile.Text = "";
                                    txtEmail.BorderColor = System.Drawing.Color.Red;
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nEnter Date Of Joining and Mobile No. !')</script>");
                            txtMobile.BorderColor = System.Drawing.Color.White;
                            txtEmail.BorderColor = System.Drawing.Color.White;
                            txtDBO.BorderColor = System.Drawing.Color.Red;
                            txtMobile.Text = "";
                            txtDBO.Text = "";
                            txtEmail.Text = "";
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Mobile Number Or Email ID !')</script>");
                        txtMobile.BorderColor = System.Drawing.Color.Red;
                        txtEmail.BorderColor = System.Drawing.Color.Red;
                        txtDBO.BorderColor = System.Drawing.Color.White;
                        rbtnMobileForPnl3.Checked = true;
                        rbtnEmailForPnl3.Checked = false;
                    }
                }
            }

            if (UType == "Citizen")
            {
                forDept.Visible = true;
                forDeptDOB.InnerText = "Date Of Birth";

                try
                {
                    DateTime datetimeValue;
                    string date = txtDBO.Text;
                    string[] formats = { "dd/mm/yyyy" };

                    if (txtFather.Text == "" && txtDBO.Text == "")
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\n1.Please Enter Father Name !" + "\\n2.Please enter Date Of Birth !')</script>");
                        txtFather.BorderColor = System.Drawing.Color.Red;
                        txtDBO.BorderColor = System.Drawing.Color.Red;
                        txtEmail.Text = "";
                        txtMobile.Text = "";
                    }
                    else if (txtFather.Text == "" && txtDBO.Text != "")
                    {
                        if (!DateTime.TryParseExact(date, formats, System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out datetimeValue))
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter correct format of Date Of Birth !')</script>");
                            txtFather.BorderColor = System.Drawing.Color.White;
                            txtDBO.BorderColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Father Name !')</script>");
                            txtFather.BorderColor = System.Drawing.Color.Red;
                            txtDBO.BorderColor = System.Drawing.Color.White;
                        }
                    }
                    else if (txtFather.Text != "" && txtDBO.Text == "")
                    {
                        Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Date Of Birth !')</script>");
                        //txtFather.BorderColor = System.Drawing.Color.White;
                        //txtDBO.BorderColor = System.Drawing.Color.Red;
                        if (!DateTime.TryParseExact(date, formats, System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out datetimeValue))
                        {
                            txtFather.BorderColor = System.Drawing.Color.White;
                            txtDBO.BorderColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter correct format of Date Of Birth !')</script>");
                            txtFather.BorderColor = System.Drawing.Color.White;
                            txtDBO.BorderColor = System.Drawing.Color.Red;
                        }
                    }
                    else if (txtFather.Text != "" && txtDBO.Text != "")
                    {
                        if (DateTime.TryParseExact(date, formats, System.Globalization.CultureInfo.InvariantCulture, DateTimeStyles.None, out datetimeValue))
                        {
                            if (txtMobile.Text != "" || txtEmail.Text != "")
                            {
                                DateTime DOB = DateTime.ParseExact(txtDBO.Text, "dd/mm/yyyy", CultureInfo.CurrentCulture);
                                string FormattedDOB = DOB.ToString("yyyy-mm-dd");

                                if (UType == "G2G")
                                {
                                    s = "select top 1 * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.profileid=e2.aadhaarnumber where e2.careof='" + txtFather.Text + "' and e2.dateofbirth ='" + FormattedDOB + "' and isActive=1";
                                }
                                else
                                {
                                    s = "select top 1 * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.profileid=e2.aadhaarnumber where e2.careof='" + txtFather.Text + "' and e2.dateofbirth ='" + FormattedDOB + "' and isActive=1";
                                }

                                SqlDataAdapter ad = new SqlDataAdapter(s, con);
                                DataTable d = new DataTable();
                                ad.Fill(d);
                                if (d.Rows.Count > 0)
                                {
                                    if (txtMobile.Text != "" && txtEmail.Text == "")
                                    {
                                        Regex phoneNumpattern = new Regex(@"^[789]\d{9}$");
                                        // Regex phoneNumpattern = new Regex(@"^((\+){0,1}91(\s){0,1}(\-){0,1}(\s){0,1}){0,1}9[0-9](\s){0,1}(\-){0,1}(\s){0,1}[1-9]{1}[0-9]{7}$");
                                        if (phoneNumpattern.IsMatch(txtMobile.Text))
                                        {
                                            if (UType == "G2G")
                                            {
                                                str = "select * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.profileid=e2.aadhaarnumber where e1.loginid='" + txtLoginId.Text + "' and e2.dateofbirth ='" + FormattedDOB + "'and e2.careof ='" + txtFather.Text + "' and isActive=1";
                                            }
                                            else
                                            {
                                                str = "select * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.profileid=e2.aadhaarnumber where e1.loginid='" + txtLoginId.Text + "' and e2.dateofbirth ='" + FormattedDOB + "'and e2.careof ='" + txtFather.Text + "' and isActive=1";
                                            }

                                            SqlDataAdapter da = new SqlDataAdapter(str, con);

                                            da.Fill(dt);

                                            if (dt.Rows.Count > 0)
                                            {
                                                Response.Write("<script>alert('Reset Password Validation!\\nOTP SMS on registered Mobile Number, please check & verify it !')</script>");
                                                string loginid = dt.Rows[0]["profileID"].ToString();
                                                HiddenField1.Value = loginid;
                                                string value = GenerateMobileOTP("", txtMobile.Text, "");
                                                DataTable dtt = ConvertJSONToDataTable(value);
                                                string data = dtt.Rows[0]["appid"].ToString();
                                                HiddenField2.Value = data;
                                                string otp = data.Substring(14, 6);
                                                ViewState["GenerateOTP"] = otp;
                                                DataTable dtOTP = GetOTP(data);
                                                txtLoginIdForOTP.Text = loginid;
                                                ViewState["OTPConfirmaitonType"] = "M";
                                                txtResendOTP.Text = txtMobile.Text;
                                                txtLoginIdForOTP.Text = txtLoginId.Text;
                                                txtEmailReSend.Text = "";
                                                pnlResentMobileNumber.Visible = true;
                                                txtResendOTP.Text = txtMobile.Text;
                                                pnlResendOTPbyEmailId.Visible = false;

                                                Panel2.Visible = true;
                                                Panel3.Visible = false;
                                                rbtnMobile.Checked = true;
                                                rbtnLoginId.Checked = false;
                                                txtEmail.Text = "";
                                                txtMobile.Text = "";
                                                ViewState["OTPConfirmaitonType"] = "MB";
                                                txtMobile.BorderColor = System.Drawing.Color.White;
                                            }
                                            else
                                            {
                                                Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Valid Mobile Number!')</script>");
                                                Panel1.Visible = false;
                                                Panel2.Visible = false;
                                                Panel3.Visible = true;
                                                txtEmail.Text = "";
                                                txtMobile.Text = "";
                                                txtMobile.BorderColor = System.Drawing.Color.Red;
                                            }
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Valid Mobile Number!')</script>");
                                            Response.Write("");
                                            TextBox1.Text = "";
                                        }
                                    }
                                    else if (txtMobile.Text == "" && txtEmail.Text != "")
                                    {
                                        if (UType == "G2G")
                                        {
                                            str = "select * from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.ProfileId=e2.aadhaarnumber where e1.loginid='" + txtLoginId.Text + "' and e2.dateofbirth ='" + FormattedDOB + "' and e2.careof ='" + txtFather.Text + "' and isActive=1";
                                        }
                                        if (UType == "Citizen")
                                        {
                                            str = "select * from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.ProfileId=e2.aadhaarnumber where e1.loginid='" + txtLoginId.Text + "' and e2.dateofbirth ='" + FormattedDOB + "' and e2.careof ='" + txtFather.Text + "' and isActive=1";
                                        }

                                        SqlDataAdapter da = new SqlDataAdapter(str, con);

                                        da.Fill(dt);
                                        if (dt.Rows.Count > 0)
                                        {
                                            string loginid = dt.Rows[0]["profileID"].ToString();
                                            HiddenField1.Value = loginid;

                                            string value = GenerateMobileOTP("", "", txtEmail.Text);
                                            DataTable dtt = ConvertJSONToDataTable(value);
                                            string data = dtt.Rows[0]["appid"].ToString();
                                            HiddenField2.Value = data;
                                            string otp = data.Substring(13, 6);
                                            ViewState["GenerateOTP"] = otp;
                                            DataTable dtOTP = GetOTP(data);
                                            string appid = dtt.Rows[0]["appid"].ToString();

                                            string username = dt.Rows[0]["username"].ToString();
                                            sendMail(username, otp, txtLoginId.Text);
                                            //  Response.Write("<script>alert('Email sent!')</script>");

                                            Panel2.Visible = true;
                                            Panel3.Visible = false;
                                            ViewState["OTPConfirmaitonType"] = "E";
                                            // txtLoginIdForOTP.Text = txtLoginId.Text;
                                            txtLoginIdForOTP.Text = txtLoginId.Text;
                                            txtEmailReSend.Text = txtEmail.Text;
                                            txtResendOTP.Text = "";
                                            pnlLoginId.Visible = false;

                                            pnlOtTPMobile.Visible = true;
                                            pnlResentMobileNumber.Visible = false;
                                            pnlResendOTPbyEmailId.Visible = true;

                                            rbtnMobile.Checked = true;
                                            rbtnLoginId.Checked = false;
                                            txtResendOTP.Text = txtEmail.Text;
                                            txtMobile.Text = "";
                                            txtEmail.BorderColor = System.Drawing.Color.White;
                                            Response.Write("<script>alert('Reset Password Validation!\\nOTP sent to your Email ID : '+ '" + txtEmail.Text + "' + ' , please check & verify it !')</script>");
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Reset Password Validation!\\nEmail ID does not exists !')</script>");
                                            Panel1.Visible = false;
                                            Panel2.Visible = false;
                                            Panel3.Visible = true;
                                            txtEmail.Text = "";
                                            txtMobile.Text = "";
                                            txtEmail.BorderColor = System.Drawing.Color.Red;
                                        }
                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert('Reset Password Validation!\\nEnter correct Father Name & Date Of Birth !')</script>");
                                    txtMobile.BorderColor = System.Drawing.Color.White;
                                    txtEmail.BorderColor = System.Drawing.Color.White;
                                    txtDBO.BorderColor = System.Drawing.Color.Red;
                                    txtFather.BorderColor = System.Drawing.Color.Red;
                                    txtMobile.Text = "";
                                    txtFather.Text = "";
                                    txtDBO.Text = "";
                                    txtEmail.Text = "";
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Mobile Number Or Email ID !')</script>");
                                txtMobile.BorderColor = System.Drawing.Color.Red;
                                txtEmail.BorderColor = System.Drawing.Color.Red;
                                txtDBO.BorderColor = System.Drawing.Color.White;
                                txtFather.BorderColor = System.Drawing.Color.White;
                                rbtnMobileForPnl3.Checked = true;
                                rbtnEmailForPnl3.Checked = false;
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Reset Password Validation!\\nPlease enter Date Of Birth in correct format !')</script>");
                            txtFather.BorderColor = System.Drawing.Color.White;
                            txtDBO.BorderColor = System.Drawing.Color.Red;
                            txtDBO.Text = "";
                            txtMobile.Text = "";
                            txtEmail.Text = "";
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nPlease Try Again !')</script>");
                }
            }
        }

        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        private static List<Tuple<string, string>> GetSessionValues()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();

            return nvc;
        }

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GenerateMobileOTP(string prefix, string Data, string email)
        {
            string noNewLines = Data.Replace("\n", "");

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GenerateMobileOTP(prefix, Data, email);
                }
            }

            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string SendSMS(string prefix, string Data, string EnteredOTP, string profileid)
        {
            string noNewLines = EnteredOTP.Replace("\n", "");

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.SendSMSOnMobile(Data, EnteredOTP, profileid);
                }
            }
            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string SendForgetPassword(string prefix, string Data, string EnteredOTP, string ProfileID,string UType)
        {
            string noNewLines = EnteredOTP.Replace("\n", "");

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.SendForgetPassword(Data, EnteredOTP, ProfileID,UType);
                }
            }
            return text;
        }

        protected void rbtnMobile_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnMobile.Checked == true)
            {
                pnlMobile.Visible = true;
                pnlLoginId.Visible = false;
                rbtnLoginId.Checked = false;
                captcha.Text = "";
                TextBox1.BorderColor = System.Drawing.Color.White;
                TextBox2.BorderColor = System.Drawing.Color.White;
                TextBox3.Text = "";
            }
        }

        protected void rbtnLoginId_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnLoginId.Checked == true)
            {
                pnlMobile.Visible = false;
                pnlLoginId.Visible = true;
                rbtnMobile.Checked = false;
                rbtnLoginId.Checked = true;
                TextBox1.BorderColor = System.Drawing.Color.White;
                TextBox2.BorderColor = System.Drawing.Color.White;
            }
        }

        protected void rbtnMobileForPnl3_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnMobileForPnl3.Checked == true)
            {
                pnlMobile.Visible = true;
                pnlLoginId.Visible = false;
                rbtnLoginId.Checked = false;
                pnlForMobilePnl3.Visible = true;
                pnlForEmailPnl3.Visible = false;
                //rbtnEmailForPnl3.Visible = false;
                rbtnEmailForPnl3.Checked = false;
                txtMobile.Text = "";
                txtEmail.Text = "";
                txtFather.BorderColor = System.Drawing.Color.White;
                txtDBO.BorderColor = System.Drawing.Color.White;
                txtMobile.BorderColor = System.Drawing.Color.White;
            }
        }

        protected void rbtnEmailForPnl3_CheckedChanged(object sender, EventArgs e)
        {
            if (rbtnEmailForPnl3.Checked == true)
            {
                txtFather.BorderColor = System.Drawing.Color.White;
                txtDBO.BorderColor = System.Drawing.Color.White;
                txtEmail.BorderColor = System.Drawing.Color.White;
                pnlMobile.Visible = true;
                pnlLoginId.Visible = false;
                rbtnLoginId.Checked = false;
                pnlForMobilePnl3.Visible = false;
                pnlForEmailPnl3.Visible = true;
                rbtnMobileForPnl3.Checked = false;
                // rbtnMobileForPnl3.Visible = true;
                txtMobile.Text = "";
                txtEmail.Text = "";
            }
        }

        protected void btnfindmyaccount_Click(object sender, EventArgs e)
        {
            string s = "";

            if (txtUsername.Text != "")
            {
                if (UType == "G2G")
                {
                    s = "select top 1 * from  Dept_G2GProfileMasterTb  where firstname='" + txtUsername.Text + "'and mobileNo='" + TextBox1.Text + "' and isActive=1";
                }
                if (UType == "Citizen")
                {
                    s = "select top 1 * from  citizenusermastertb  where firstname='" + txtUsername.Text + "'and mobile='" + TextBox1.Text + "' and isActive=1";
                }

                SqlDataAdapter ad = new SqlDataAdapter(s, con);
                DataTable d = new DataTable();
                ad.Fill(d);
                if (d.Rows.Count > 0)
                {
                    string otp = TextBox1.Text.Substring(0, 4);

                    string text = "<span style='font-weight: bold'> " + otp + " XXXXXX</span> ";

                    ltlFinfmyaccount.Text = "Get a verification code by text message at :  " + text;
                    pnlUsername.Visible = false;
                    pnlsendotpforfindmyaccount.Visible = true;
                    ltlFinfmyaccount.Visible = true;
                    btnfindmyaccountsendotp.Visible = true;
                    txtUsername.Visible = false;
                    btnfindmyaccount.Visible = false;
                    txtUsername.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('Reset Password Validation!\\nEnter correct Username !')</script>");

                    txtUsername.BorderColor = System.Drawing.Color.Red;

                    txtUsername.Text = "";
                }
            }
            else
            {
                Response.Write("<script>alert('Reset Password Validation!\\nPlease Enter Username !')</script>");

                txtUsername.BorderColor = System.Drawing.Color.Red;

                txtUsername.Text = "";
            }
        }

        protected void btnfindmyaccountsendotp_Click(object sender, EventArgs e)
        {
            string str = "";

            if (UType == "G2G")
            {
                str = "select* from  Dept_G2GProfileMasterTb e1 inner join aadhaardatatb e2 on e1.ProfileId = e2.aadhaarnumber where e1.mobileNo='" + TextBox1.Text + "' and isActive=1";
            }
            if (UType == "Citizen")
            {
                str = "select* from  citizenusermastertb e1 inner join aadhaardatatb e2 on e1.ProfileId = e2.aadhaarnumber where e1.mobile='" + TextBox1.Text + "' and isActive=1";
            }

            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                TextBox1.BorderColor = System.Drawing.Color.White;
                captcha.BorderColor = System.Drawing.Color.White;
                string loginid = dt.Rows[0]["loginid"].ToString();
                HiddenField1.Value = loginid;
                string value = SendOtpForUsername("", TextBox1.Text, "");
                //string value = GenerateMobileOTP("", TextBox1.Text, "");
                DataTable dtt = ConvertJSONToDataTable(value);
                string data = dtt.Rows[0]["appid"].ToString();
                HiddenField2.Value = data;
                string otp = data.Substring(14, 6);
                ViewState["GenerateOTP"] = otp;
                DataTable dtOTP = GetOTP(data);
                txtLoginIdForOTP.Text = loginid;
                ViewState["OTPConfirmaitonType"] = "Username";
                txtResendOTP.Text = TextBox1.Text;
                txtOPT.Text = "";
                captcha.Text = "";
                txtMobile.Text = "";
                txtFather.Text = "";
                txtEmail.Text = "";
                txtDBO.Text = "";
                txtEmailReSend.Text = "";
                pnlLoginId.Visible = false;
                pnlLoginId.Visible = false;
                pnlOtTPMobile.Visible = true;
                pnlResentMobileNumber.Visible = false;
                lblResendOTP.Visible = false;

                pnlResendOTPbyEmailId.Visible = false;
                Panel1.Visible = false;
                Panel2.Visible = true;
                Panel3.Visible = false;
                rbtnMobileForPnl3.Checked = true;
                rbtnEmailForPnl3.Checked = false;
                captcha.Text = "";
                TextBox3.Text = "";
                Response.Write("<script>alert('Reset Password Validation!\\nOTP SMS on registered Mobile Number, please check & verify it !')</script>");
                captcha.BorderColor = System.Drawing.Color.White;
                TextBox1.BorderColor = System.Drawing.Color.White;
                txtLoginIdForOTP.Visible = false;
                divloginid.Visible = false;

                pnlUsername.Visible = false;
                pnlsendotpforfindmyaccount.Visible = true;
                pnlfindmyaccount.Visible = false;
                txtUsername.Visible = false;
                btnfindmyaccount.Visible = false;
                btnfindmyaccountsendotp.Visible = true;
                ltlFinfmyaccount.Visible = true;
            }
        }

        protected void lbtnLostLoginID_Click(object sender, EventArgs e)
        {
            pnlMobile.Visible = true;
            pnlLoginId.Visible = false;
            pnlRadioBuuton.Visible = false;
            pnlMobile.Visible = true;
            TextBox1.BorderColor = System.Drawing.Color.White;
            TextBox2.BorderColor = System.Drawing.Color.White;
            captcha.Text = "";
            TextBox3.Text = "";
            lblHeaderDetails.Visible = true;
            lblHeaderDetails.Text = "User Details";
            btnCancelFindAccount.Visible = true;
            rbtnMobile.Checked = false;
            rbtnLoginId.Checked = false;
        }

        protected void btnCancelFindAccount_Click(object sender, EventArgs e)
        {
            lblHeaderDetails.Visible = true;
            lblHeaderDetails.Text = "Forget Password";
            pnlfindmyaccount.Visible = false;
            Panel1.Visible = true;
            rbtnMobile.Checked = true;
            rbtnLoginId.Checked = false;
            pnlMobile.Visible = true;
            pnlLoginId.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            txtMobile.Text = "";
            txtFather.Text = "";
            txtEmail.Text = "";
            txtDBO.Text = "";
            rbtnMobileForPnl3.Checked = true;
            rbtnEmailForPnl3.Checked = false;
            txtOPT.Text = "";
            captcha.Text = "";
            TextBox3.Text = "";
            btnCancelFindAccount.Visible = false;
            TextBox1.Text = "";
            pnlRadioBuuton.Visible = true;

            TextBox1.BorderColor = System.Drawing.Color.White;
            TextBox2.BorderColor = System.Drawing.Color.White;
            captcha.Text = "";
            TextBox3.Text = "";

            btnCancelFindAccount.Visible = false;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string SendOtpForUsername(string prefix, string Data, string email)
        {
            string noNewLines = Data.Replace("\n", "");

            ////OTP_DT viewModel = ToObjectFromJSON<OTP_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.SendOtpForUsername(prefix, Data, email);
                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string SendUsername(string prefix, string Data, string EnteredOTP, string profileid)
        {
            string noNewLines = EnteredOTP.Replace("\n", "");

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.SendUsername(Data, EnteredOTP, profileid);
                }
            }

            return text;
        }

        public static string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
            Random randNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;
            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }

        public void sendMailUsernamePassword(string username, string password, string loginid)
        {
            //string otp = ViewState["EmailOTP"].ToString();
            MailMessage Msg = new MailMessage();

            Msg.From = new MailAddress("info@g2cservices.in");

            Msg.To.Add(txtEmailReSend.Text);

            Msg.Subject = "User ID and new Password from Lokaseba Adhikara Odisha";
            string body = "Hello , " + username + "";

            //body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("ForgetPassword.aspx", "CS_Activation.aspx?ActivationCode=" + otp) + "'>Click here to activate your account.</a>";
            body += "<br /><br />Your Login ID '" + loginid + "' & new Password '" + password + "' ";
            // body += "<br /><br />& Password '" + password + "' ";
            body += "<br /><br />From Lokaseba Adhikara Odisha. ";
            body += "<br /><br />Thanks.";
            Msg.Body = body;
            Msg.IsBodyHtml = true;
            //Msg.Body = "Your APPID is '" + Session["AppId"].ToString() + "'  and Password is '" + Session["NewPassword"].ToString() + "' ";

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("info@g2cservices.in", "G@C#0nl!ne");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            try
            {
                //Response.Write("<script>alert('Please check your Email for new Username & Password !')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Reset Password Validation!\\nPlease try again for forget password !')</script>");
            }
        }

        public void sendMail(string username, string otp, string appid)
        {
            //string otp = ViewState["GenerateOTP"].ToString();
            MailMessage Msg = new MailMessage();

            Msg.From = new MailAddress("info@g2cservices.in");
            if (txtEmail.Text != "")
            {
                Msg.To.Add(txtEmail.Text);
            }
            if (txtEmailReSend.Text != "")
            {
                Msg.To.Add(txtEmailReSend.Text);
            }
            Msg.Subject = "OTP from Lokaseba Adhikara Odisha";
            string body = "Hello ," + username + "";

            //body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("ForgetPassword.aspx", "CS_Activation.aspx?ActivationCode=" + otp) + "'>Click here to activate your account.</a>";
            body += "<br /><br />OTP for Forget Password of Lokaseba Adhikara Odisha : '" + otp + "' ";
            body += "<br /><br />From Lokaseba Adhikara Odisha - CAP, Odisha Govt.";
            body += "<br /><br />Thanks";
            Msg.Body = body;
            Msg.IsBodyHtml = true;
            //Msg.Body = "Your APPID is '" + Session["AppId"].ToString() + "'  and Password is '" + Session["NewPassword"].ToString() + "' ";

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("info@g2cservices.in", "G@C#0nl!ne");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            try
            {
                //Response.Write("<script>alert('Please check Email for confirmation OTP!')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Reset Password Validation!\\nFailed !"+ex.Message+"')</script>");
            }
        }

        private DataTable GetOTP(string jsonString)
        {
            DataTable dt = new DataTable();
            //strip out bad characters
            string[] jsonParts = Regex.Split(jsonString.Replace("[", "").Replace("]", ""), "},{");

            //hold column names
            List<string> dtColumns = new List<string>();

            //get columns
            foreach (string jp in jsonParts)
            {
                //only loop thru once to get column names
                string[] propData = Regex.Split(jp.Replace("{", "").Replace("}", ""), ",");
                foreach (string rowData in propData)
                {
                    try
                    {
                        int idx = rowData.IndexOf("_");
                        string n = rowData.Substring(0, idx - 1);
                        string v = rowData.Substring(idx + 1);
                        if (!dtColumns.Contains(n))
                        {
                            dtColumns.Add(n.Replace("\"", ""));
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(string.Format("Error Parsing Column Name : {0}", rowData));
                    }
                }
                break; // TODO: might not be correct. Was : Exit For
            }

            //build dt
            foreach (string c in dtColumns)
            {
                dt.Columns.Add(c);
            }
            //get table data
            foreach (string jp in jsonParts)
            {
                string[] propData = Regex.Split(jp.Replace("{", "").Replace("}", ""), ",");
                DataRow nr = dt.NewRow();
                foreach (string rowData in propData)
                {
                    try
                    {
                        int idx = rowData.IndexOf("_");
                        string n = rowData.Substring(0, idx - 1).Replace("\"", "");
                        string v = rowData.Substring(idx + 1).Replace("\"", "");
                        nr[n] = v;
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
                dt.Rows.Add(nr);
            }
            return dt;
        }

        private DataTable ConvertJSONToDataTable(string jsonString)
        {
            DataTable dt = new DataTable();
            //strip out bad characters
            string[] jsonParts = Regex.Split(jsonString.Replace("[", "").Replace("]", ""), "},{");

            //hold column names
            List<string> dtColumns = new List<string>();

            //get columns
            foreach (string jp in jsonParts)
            {
                //only loop thru once to get column names
                string[] propData = Regex.Split(jp.Replace("{", "").Replace("}", ""), ",");
                foreach (string rowData in propData)
                {
                    try
                    {
                        int idx = rowData.IndexOf(":");
                        string n = rowData.Substring(0, idx - 1);
                        string v = rowData.Substring(idx + 1);
                        if (!dtColumns.Contains(n))
                        {
                            dtColumns.Add(n.Replace("\"", ""));
                        }
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(string.Format("Error Parsing Column Name : {0}", rowData));
                    }
                }
                break; // TODO: might not be correct. Was : Exit For
            }

            //build dt
            foreach (string c in dtColumns)
            {
                dt.Columns.Add(c);
            }
            //get table data
            foreach (string jp in jsonParts)
            {
                string[] propData = Regex.Split(jp.Replace("{", "").Replace("}", ""), ",");
                DataRow nr = dt.NewRow();
                foreach (string rowData in propData)
                {
                    try
                    {
                        int idx = rowData.IndexOf(":");
                        string n = rowData.Substring(0, idx - 1).Replace("\"", "");
                        string v = rowData.Substring(idx + 1).Replace("\"", "");
                        nr[n] = v;
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
                dt.Rows.Add(nr);
            }
            return dt;
        }
    }
}