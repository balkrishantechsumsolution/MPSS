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
    public partial class NewLeftPanel : System.Web.UI.UserControl
    {
        string m_UserID, ProfileID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblUser.InnerHtml = Session["FullName"].ToString();

           

            lblDate.InnerHtml = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            List<MenuDataModel> objMenuData = null;
            CitizenPortalLib.BLL.MenuBLL menu = new CitizenPortalLib.BLL.MenuBLL();
            objMenuData = menu.GetAllMenus(new string[] { });
            foreach (MenuDataModel menuData in objMenuData)
            {
                if (!string.IsNullOrEmpty(menuData.HREF.Trim()))
                    menuData.HREF = "applicationUrl" + "/" + menuData.HREF + "/" + menuData.Controller + "/" + menuData.Action;
                else
                    menuData.HREF = "applicationUrl" + "/" + menuData.Controller + "/" + menuData.Action;
            }

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

            if (objMenuData != null)
            {
                if (sessionUserType.ToUpper() == "CITIZEN")
                {
                    if (Session["LoginID"].ToString() == null) return;

                    m_UserID = Session["LoginID"].ToString();

                    DataSet dt = m_CitizenRegistrationBLL.GetUserDetails(m_UserID);
                    DataTable dtApp = dt.Tables[0];

                    if (dtApp.Rows.Count != 0)
                    {

                        pnlMenu.Controls.Add(new LiteralControl("<li class='pleft0 pright0'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<div class='profile_bg'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<div class='profile'>"));

                        pnlMenu.Controls.Add(new LiteralControl("<img runat='server' src='" + dtApp.Rows[0]["ApplicantImageStr"].ToString() + "' name='ProfilePhoto' id='ProfileImg'/>"));

                        pnlMenu.Controls.Add(new LiteralControl("</div>"));
                        pnlMenu.Controls.Add(new LiteralControl("</div>"));
                        pnlMenu.Controls.Add(new LiteralControl("<div class='UserDetail'>"));
                        //pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-user'></i> <span class='fntsize13' id='lblUser' runat ='server'> " + dtApp.Rows[0]["FirstName"].ToString() + "</span></p>"));
                        //pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-mobile-phone' ></i> <span class='fntsize13' id='lblMobile' runat='server'> " + dtApp.Rows[0]["Mobile"].ToString() + "</span></p>"));
                        //pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-envelope'></i> <span class='fntsize13' id='lblEmail' runat ='server'>" + dtApp.Rows[0]["Email"].ToString() + "</span></p>"));
                        //pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-map-marker'></i> <span class='fntsize13'><b>Permanent Address :</b> <br/> " + dtApp.Rows[0]["PermanentAddress"].ToString() + "</span></p>"));
                        //pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-map-marker'></i> <span class='fntsize13'><b>Present Address : </b> <br/>" + dtApp.Rows[0]["PresentAddress"].ToString() + "</span></p>"));
                        pnlMenu.Controls.Add(new LiteralControl("</div>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "'><i class='fa fa-dashboard fa-fw'></i> Dashboard</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='#" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "'><i class='fa fa-graduation-cap fa-fw'></i> Admission</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "'><i class='fa fa-bell fa-fw'></i> Notification</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "'><i class='fa fa-table fa-fw'></i> Examination</a>"));
                 

                        pnlMenu.Controls.Add(new LiteralControl("<ul class='nav nav-second-level'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a  href = '" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "?UID=" + ProfileID + "&ProfileID=" + ProfileID + "'><i class='fa fa-long-arrow-right fa-fw'></i> Regular</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a   href ='#' ><i class='fa fa-long-arrow-right fa-fw'></i> Non Regular </ a > "));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));
                        pnlMenu.Controls.Add(new LiteralControl("</ul>"));

                        pnlMenu.Controls.Add(new LiteralControl("</li>"));


                        pnlMenu.Controls.Add(new LiteralControl("<li id='lpAdmitCard'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='#'><i class='fa fa-list-alt fa-fw'></i> Admit Card<span class='fa arrow'></span></a>"));
                        pnlMenu.Controls.Add(new LiteralControl("<ul class='nav nav-second-level'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a  href = '" + dtApp.Rows[0]["ProfileURL"].ToString() + "?UID=" + ProfileID + "&ProfileID=" + ProfileID + "'><i class='fa fa-long-arrow-right fa-fw'></i> Regular</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href ='#' ><i class='fa fa-long-arrow-right fa-fw'></i> Non Regular </ a > "));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));
                        pnlMenu.Controls.Add(new LiteralControl("</ul>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='#" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "'><i class='fa fa-laptop fa-fw'></i> Result</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href='#" + dtApp.Rows[0]["OriginalProfileID"].ToString() + "'><i class='fa fa-keyboard-o fa-fw'></i> Counterbase Application</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                        pnlMenu.Controls.Add(new LiteralControl("<li>"));
                        pnlMenu.Controls.Add(new LiteralControl("<a href = '/Account/LogOff'><i class='fa fa-lock fa-fw'></i> Logout</a>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));
                    }


                }
                else if (sessionUserType.ToUpper() == "G2G")
                {
                    string HomePageURL = Session["HomePage"].ToString();
                    HyperLink Hyl = new HyperLink();
                    {
                        Hyl.NavigateUrl = HomePageURL;
                        Hyl.Text = "Dashboard";

                    }

                    pnlMenu.Controls.Add(new LiteralControl("<li class='pleft0 pright0'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<div class='profile_bg'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<div class='profile'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<img runat='server' ProfileImg.Src = '/webApp/kiosk/Images/user_1.png' name='ProfilePhoto' id='ProfileImg'/>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                    pnlMenu.Controls.Add(new LiteralControl("<div class='UserDetail'>"));
                    pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-user'></i> <span class='fntsize13' id='lblUser' runat ='server'> " + Session["LoginID"].ToString() + "</span></p>"));
                    pnlMenu.Controls.Add(new LiteralControl("</div>"));
                    pnlMenu.Controls.Add(new LiteralControl("</li>"));

                    pnlMenu.Controls.Add(new LiteralControl("<li>"));
                    //pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/G2G/G2GDashBoard.aspx'><i class='fa fa-dashboard fa-fw'></i> Dashboard</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("<i class='fa fa-dashboard fa-fw'>"));
                    pnlMenu.Controls.Add(Hyl);
                    pnlMenu.Controls.Add(new LiteralControl("</i>"));
                    pnlMenu.Controls.Add(new LiteralControl("</li>"));

                    pnlMenu.Controls.Add(new LiteralControl("<li>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a id='lpChangePassword'  href ='/WebApp/G2G/ChangePassword.aspx' > Change Password </ a > "));
                    pnlMenu.Controls.Add(new LiteralControl("</li>"));


                    pnlMenu.Controls.Add(new LiteralControl("<li>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a href = '/Account/LogOff'> Logout</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</li>"));

                }
                else if (sessionUserType.ToUpper() == "KIOSK")
                {

                    if (Request.QueryString["UID"] != null)
                    {
                        string t_UID = Request.QueryString["UID"].ToString();

                        DataSet dt = m_CitizenRegistrationBLL.GetUIDDetail(t_UID);
                        if (dt.Tables[0].Rows.Count != 0)
                        {
                            DataTable dtApp = dt.Tables[0];
                            pnlMenu.Controls.Add(new LiteralControl("<li class='pleft0 pright0'>"));
                            pnlMenu.Controls.Add(new LiteralControl("<div class='profile_bg'>"));
                            pnlMenu.Controls.Add(new LiteralControl("<div class='profile'>"));
                            pnlMenu.Controls.Add(new LiteralControl("<img runat='server' src='" + dtApp.Rows[0]["ApplicantImageStr"].ToString() + "' name='ProfilePhoto' id='ProfileImg'/>"));
                            pnlMenu.Controls.Add(new LiteralControl("</div>"));
                            pnlMenu.Controls.Add(new LiteralControl("</div>"));
                            pnlMenu.Controls.Add(new LiteralControl("<div class='UserDetail'>"));
                            pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-user'></i> <span class='fntsize13' id='lblUser' runat ='server'> " + dtApp.Rows[0]["FirstName"].ToString() + " (" + dtApp.Rows[0]["ProfileID"].ToString() + ")</span></p>"));
                            pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-mobile-phone' ></i> <span class='fntsize13' id='lblMobile' runat='server'> " + dtApp.Rows[0]["Mobile"].ToString() + "</span></p>"));
                            pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-envelope'></i> <span class='fntsize13' id='lblEmail' runat ='server'>" + dtApp.Rows[0]["Email"].ToString() + "</span></p>"));
                            pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-map-marker'></i> <span class='fntsize13'><b>Permanent Address :</b> <br/> " + dtApp.Rows[0]["PermanentAddress"].ToString() + "</span></p>"));
                            pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-map-marker'></i> <span class='fntsize13'><b>Present Address : </b> <br/>" + dtApp.Rows[0]["PresentAddress"].ToString() + "</span></p>"));
                            pnlMenu.Controls.Add(new LiteralControl("</div>"));
                            pnlMenu.Controls.Add(new LiteralControl("</li>"));

                            Session["FirstName"] = dtApp.Rows[0]["FirstName"].ToString();
                        }
                    }
                    else
                    {
                        pnlMenu.Controls.Add(new LiteralControl("<li class='pleft0 pright0'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<div class='profile_bg'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<div class='profile'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<img runat='server' ProfileImg.Src = '/webApp/kiosk/Images/user_1.png' name='ProfilePhoto' id='ProfileImg'/>"));
                        pnlMenu.Controls.Add(new LiteralControl("</div>"));
                        pnlMenu.Controls.Add(new LiteralControl("</div>"));
                        pnlMenu.Controls.Add(new LiteralControl("<div class='UserDetail'>"));
                        pnlMenu.Controls.Add(new LiteralControl("<p><i class='fa fa-user'></i> <span class='fntsize13' id='lblUser' runat ='server'> " + Session["LoginID"].ToString() + "</span></p>"));
                        pnlMenu.Controls.Add(new LiteralControl("</div>"));
                        pnlMenu.Controls.Add(new LiteralControl("</li>"));

                    }
                    pnlMenu.Controls.Add(new LiteralControl("<li>"));
                    pnlMenu.Controls.Add(new LiteralControl("<a href='/WebApp/Kiosk/Forms/DashboardChart.aspx'><i class='fa fa-dashboard fa-fw'></i> Dashboard</a>"));
                    pnlMenu.Controls.Add(new LiteralControl("</li>"));
                }

                pnlMenu.Controls.Add(new LiteralControl("</ul>"));

                pnlMenu.Controls.Add(new LiteralControl("</nav>"));

                pnlMenu.Controls.Add(new LiteralControl("</div>"));
                pnlMenu.Controls.Add(new LiteralControl("</div>"));
            }
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