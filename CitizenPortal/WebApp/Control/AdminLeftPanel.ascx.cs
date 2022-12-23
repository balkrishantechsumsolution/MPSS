using CitizenPortalLib.BLL;
using CitizenPortalLib.PortalViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Control
{
    public partial class AdminLeftPanel : System.Web.UI.UserControl
    {
        string m_UserID, ProfileID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblUser.InnerHtml = Session["FullName"].ToString();
            lblDate.InnerHtml = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            List<MenuDataModel> objMenuData = null;

            CitizenRegistrationBLL m_CitizenRegistrationBLL = new CitizenRegistrationBLL();

            string sessionUserType = "";

            pnlMenu.Controls.Add(new LiteralControl("<div class='navbar-default sidebar' role='navigation'>"));
            pnlMenu.Controls.Add(new LiteralControl("<div class='sidebar-nav leftpnlbg_grey navbar-collapse'>"));

            pnlMenu.Controls.Add(new LiteralControl("<nav>"));
            pnlMenu.Controls.Add(new LiteralControl("<ul class='nav nv_bg' id='side-menu'>"));

            if (Session["UserType"] != null && Session["UserType"].ToString() != "")
            {
                sessionUserType = Session["UserType"].ToString();
            }

            if (Request.QueryString["UID"] != null && Request.QueryString["UID"].ToString() != "")
            {
                ProfileID = Request.QueryString["UID"].ToString();
            }


            if (sessionUserType.ToUpper() == "2")
            {
                string HomePageURL = Session["HomePage"].ToString();
                HyperLink Hyl = new HyperLink();
                {
                    Hyl.NavigateUrl = HomePageURL;
                    Hyl.Text = "Dashboard";

                }
                m_UserID = Session["LoginID"].ToString();
                DataSet dt = m_CitizenRegistrationBLL.GetG2GUserDetails(m_UserID);
                DataTable dtApp = dt.Tables[0];





                pnlMenu.Controls.Add(new LiteralControl("<li class='pleft0 pright0'>"));
                pnlMenu.Controls.Add(new LiteralControl("<div class='profile_bg'>"));
                pnlMenu.Controls.Add(new LiteralControl("<div class='profile'>"));
                //pnlMenu.Controls.Add(new LiteralControl("<img runat='server' src='" + dtApp.Rows[0]["ApplicantImageStr"].ToString() + "' name='ProfilePhoto' id='ProfileImg'/>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("<div class='UserDetail'>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-key'></i> <span class='fntsize13' id='lblUser' runat ='server'> " + Session["LoginID"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-mobile-phone' ></i> <span class='fntsize13' id='lblMobile' runat='server'> " + dtApp.Rows[0]["MobileNo"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-envelope'></i> <span class='fntsize13' id='lblEmail' runat ='server'>" + dtApp.Rows[0]["EmailID"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-user'></i> <span class='fntsize13'><b>Name :</b> " + dtApp.Rows[0]["FirstName"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-pencil'></i> <span class='fntsize13'><b>Designation : </b> " + dtApp.Rows[0]["Designation"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));



                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a id='lpEditProfile'  href ='/WebApp/G2G/AdminDeptPage.aspx' ><i class='fa fa-edit fa-fw'></i> Edit Profile </ a > "));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));




                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a id='lpApprovalList'  href ='/WebApp/Kiosk/MPSS/ApprovalList.aspx' ><i class='fa fa-edit fa-fw'></i>ApprovalList</ a > "));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));


                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a id='lpChangePassword'  href ='/WebApp/G2G/ChangePassword.aspx' ><i class='fa fa-eye fa-fw'></i> Change Password </ a > "));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));


                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href = '/Account/LogOff'><i class='fa fa-lock fa-fw'></i> Logout</a>"));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));



            }

            if (sessionUserType.ToUpper() == "3")
            {
                string HomePageURL = Session["HomePage"].ToString();
                HyperLink Hyl = new HyperLink();
                {
                    Hyl.NavigateUrl = HomePageURL;
                    Hyl.Text = "Dashboard";

                }
                m_UserID = Session["LoginID"].ToString();
                DataSet dt = m_CitizenRegistrationBLL.GetG2GUserDetails(m_UserID);
                DataTable dtApp = dt.Tables[0];





                pnlMenu.Controls.Add(new LiteralControl("<li class='pleft0 pright0'>"));
                pnlMenu.Controls.Add(new LiteralControl("<div class='profile_bg'>"));
                pnlMenu.Controls.Add(new LiteralControl("<div class='profile'>"));
                //pnlMenu.Controls.Add(new LiteralControl("<img runat='server' src='" + dtApp.Rows[0]["ApplicantImageStr"].ToString() + "' name='ProfilePhoto' id='ProfileImg'/>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("<div class='UserDetail'>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-key'></i> <span class='fntsize13' id='lblUser' runat ='server'> " + Session["LoginID"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-mobile-phone' ></i> <span class='fntsize13' id='lblMobile' runat='server'> " + dtApp.Rows[0]["MobileNo"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-envelope'></i> <span class='fntsize13' id='lblEmail' runat ='server'>" + dtApp.Rows[0]["EmailID"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-user'></i> <span class='fntsize13'><b>Name :</b> " + dtApp.Rows[0]["FirstName"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-pencil'></i> <span class='fntsize13'><b>Designation : </b> " + dtApp.Rows[0]["Designation"].ToString() + "</span></p>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));



                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a id='lpEditProfile'  href ='/WebApp/G2G/AdminDeptPage.aspx' ><i class='fa fa-edit fa-fw'></i> Edit Profile </ a > "));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));




                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a id='lpApprovalList'  href ='/WebApp/Kiosk/MPSS/ApprovalList.aspx' ><i class='fa fa-edit fa-fw'></i>ApprovalList</ a > "));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));


                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a id='lpChangePassword'  href ='/WebApp/G2G/ChangePassword.aspx' ><i class='fa fa-eye fa-fw'></i> Change Password </ a > "));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));


                pnlMenu.Controls.Add(new LiteralControl("<li>"));
                pnlMenu.Controls.Add(new LiteralControl("<a href = '/Account/LogOff'><i class='fa fa-lock fa-fw'></i> Logout</a>"));
                pnlMenu.Controls.Add(new LiteralControl("</li>"));



            }

            pnlMenu.Controls.Add(new LiteralControl("</ul>"));

            pnlMenu.Controls.Add(new LiteralControl("</nav>"));

            pnlMenu.Controls.Add(new LiteralControl("</div>"));
            pnlMenu.Controls.Add(new LiteralControl("</div>"));
        
    }



        void RenderMenuItem(Panel pnlMenu, List<MenuDataModel> menuList, MenuDataModel mi)
        {

            pnlMenu.Controls.Add(new LiteralControl("<ul class='nav nav-second-level'>"));


            foreach (var cp in menuList.Where(p => p.PARENTID == mi.MenuId))
            {


                //if (menuList.Count(p => p.PARENTID == cp.MenuId) > 0)
                //{
                //    pnlMenu.Controls.Add(new LiteralControl("<li><a href='flot.html'>"));
                //    pnlMenu.Controls.Add(new LiteralControl(cp.MenuHeading));

                //    pnlMenu.Controls.Add(new LiteralControl("<ul>"));

                //    RenderMenuItem(pnlMenu, menuList, cp);

                //    pnlMenu.Controls.Add(new LiteralControl("</ul>"));

                //}
                //else
                {
                    pnlMenu.Controls.Add(new LiteralControl("<li class=''>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a href ="));
                    //pnlMenu.Controls.Add(new LiteralControl("<li><a href="));                    
                    pnlMenu.Controls.Add(new LiteralControl(cp.Action));
                    pnlMenu.Controls.Add(new LiteralControl(">"));
                    pnlMenu.Controls.Add(new LiteralControl(cp.MenuHeading));
                    pnlMenu.Controls.Add(new LiteralControl("</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</li>"));
                }



            }

            pnlMenu.Controls.Add(new LiteralControl("</ul>"));

        }

    }
}