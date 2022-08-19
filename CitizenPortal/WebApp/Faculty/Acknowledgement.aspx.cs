using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Faculty
{
    public partial class Acknowledgement : AdminBasePage
    {
        string mYear,mSemester, mDepartment, mCourse, mProgram, mSubject;

        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["EY"] == null) return;
            if (Request.QueryString["SE"] == null) return;            
            //if (Request.QueryString["DC"] == null) return;

            mSemester = Request.QueryString["SE"].ToString();
            mYear = Request.QueryString["EY"].ToString();
            //mDepartment = Request.QueryString["DC"].ToString();

            if (Request.QueryString["CC"] != null)
                mCourse = Request.QueryString["CC"].ToString();
            if (Request.QueryString["PC"] != null)
                mProgram = Request.QueryString["PC"].ToString();
            if (Request.QueryString["DC"] != null)
                mDepartment = Request.QueryString["DC"].ToString();
            if (Request.QueryString["SC"] == null)
                mSubject = Request.QueryString["SC"].ToString();


            DataSet dt = m_G2GDashboardBLL.RecommendedFacultyList(mYear, mSemester, mDepartment, mCourse, mProgram, mSubject);
            DataTable dtSummary = dt.Tables[0];
            DataTable dtSubject = dt.Tables[1];

            DataTable dtFaculty = null;

            string previousSubject = "", Subject = "";

            divDetail.Controls.Clear();
            for (int i = 0; i < dtSubject.Rows.Count; i++)
            {               
                Subject = dtSubject.Rows[i]["SubjectName"].ToString();

                DataView dv = dtSummary.DefaultView;
                dv.RowFilter = "SubjectName='" + Subject + "'";
                dtFaculty = dv.ToTable();

                divDetail.Controls.Add(new LiteralControl("<table>"));
                divDetail.Controls.Add(new LiteralControl("<tbody>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));

                //Start Subject Details-- Table Start, Generate first 3 lines here
                divDetail.Controls.Add(new LiteralControl("<table cellspacing='0' cellpadding='0' style='width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;'>"));
                divDetail.Controls.Add(new LiteralControl("<tbody>"));
                
                divDetail.Controls.Add(new LiteralControl("<tr>"));

                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='width: 15%; background-color: #F8F8F8; font-weight: bold; color: #F8F8F8; text-align: left; border: 1px solid #999; font-size: 16px; padding: 5px; background-color: #F8F8F8; color: #000;'>Course</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; font-size: 17px;'>" + dtSubject.Rows[i]["Award"].ToString() + "</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; background-color: #F8F8F8; color: #000;font-size: 17px;'>Semester</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;font-size: 16px;'>" + dtSubject.Rows[i]["Semester"].ToString() + "</td> "));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; background-color: #F8F8F8; color: #000;font-size: 16px;'>Exam Session</td> "));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;font-size: 17px;'>" + dtSubject.Rows[i]["Session"].ToString() + "</td> "));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='width: 15%; background-color: #F8F8F8; font-weight: bold; color: #F8F8F8; text-align: left; border: 1px solid #999; font-size: 16px; padding: 5px; background-color: #F8F8F8; color: #000;'>Program</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; font-size: 17px;' colspan='5'>" + dtSubject.Rows[i]["ProgramName"].ToString() + "</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='width: 15%; background-color: #F8F8F8; font-weight: bold; color: #F8F8F8; text-align: left; border: 1px solid #999; font-size: 16px; padding: 5px; background-color: #F8F8F8; color: #000;'>Department</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; font-size: 17px;' colspan='5'>" + dtSubject.Rows[i]["Department"].ToString() + "</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='width: 15%; background-color: #F8F8F8; font-weight: bold; color: #F8F8F8; text-align: left; border: 1px solid #999; font-size: 16px; padding: 5px; background-color: #F8F8F8; color: #000;'>Subject</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; font-size: 17px;' colspan='5'>" + dtSubject.Rows[i]["SubjectName"].ToString() + "</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));


                //divDetail.Controls.Add(new LiteralControl("<td style='width: 15%; background-color: #F8F8F8; font-weight: bold; color: #F8F8F8; text-align: left; border: 1px solid #999;font-size: 17px; padding: 5px;background-color: #F8F8F8;color: #000;'>Department</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; font-size: 17px;'>"));
                //divDetail.Controls.Add(new LiteralControl(dtSubject.Rows[i]["Department"].ToString()+ "</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;background-color: #F8F8F8;color: #000;'>Course</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px;font-weight: bold; '>"));
                //divDetail.Controls.Add(new LiteralControl(dtSubject.Rows[i]["Award"].ToString() + "</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; background-color: #F8F8F8;color: #000;'>Program</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px;font-weight: bold; '>"));
                //divDetail.Controls.Add(new LiteralControl(dtSubject.Rows[i]["ProgramName"].ToString() + "</td>"));
                //divDetail.Controls.Add(new LiteralControl("</tr>"));
                //divDetail.Controls.Add(new LiteralControl("<tr>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='width: 15%; background-color: #F8F8F8; font-weight: bold; color: #F8F8F8; text-align: left; border: 1px solid #999; font-size: 17px;padding: 5px;background-color: #F8F8F8;color: #000;'>Subject</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;font-size: 17px; '>"));
                //divDetail.Controls.Add(new LiteralControl(dtSubject.Rows[i]["SubjectName"].ToString() + "</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;background-color: #F8F8F8;color: #000;'>Semester</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px;font-weight: bold; '>"));
                //divDetail.Controls.Add(new LiteralControl(dtSubject.Rows[i]["Semester"].ToString() + "</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; background-color: #F8F8F8;color: #000;'>Exam Session</td>"));
                //divDetail.Controls.Add(new LiteralControl("<td style='color: #000000; text-align: left; border: 1px solid #999; padding: 5px;font-weight: bold; '>"));
                //divDetail.Controls.Add(new LiteralControl(dtSubject.Rows[i]["Session"].ToString() + "</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("</tbody>"));
                divDetail.Controls.Add(new LiteralControl("</table>"));


                divDetail.Controls.Add(new LiteralControl("<table cellspacing='0' cellpadding='0' style='width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;'>"));
                divDetail.Controls.Add(new LiteralControl("<tbody>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #F8F8F8;' >Sl.</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #F8F8F8;'>Faculty ID</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #F8F8F8;'>Faculty Name</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #F8F8F8;'>College</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #F8F8F8;'>Total Experience</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #F8F8F8;' >Detail</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                
                for (int j = 0; j < dtFaculty.Rows.Count; j++)
                {
                    int a = j + 1;
                    //Print Faculty Data
                    divDetail.Controls.Add(new LiteralControl("<tr>"));
                    
                    divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; border: 1px solid #999; text-align: center;font-weight: bold; '>"));
                    divDetail.Controls.Add(new LiteralControl(+a+"</td>"));
                    divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; border: 1px solid #999; text-align: left;font-weight: bold; '>"));
                    divDetail.Controls.Add(new LiteralControl(dtFaculty.Rows[j]["FacultyID"].ToString() + "</td>"));
                    divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; border: 1px solid #999; text-align: left;font-weight: bold; '>"));
                    divDetail.Controls.Add(new LiteralControl(dtFaculty.Rows[j]["FacultyName"].ToString() + "</td>"));
                    divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; border: 1px solid #999; text-align: left;font-weight: bold; '>"));
                    divDetail.Controls.Add(new LiteralControl(dtFaculty.Rows[j]["College"].ToString() + "</td>"));
                    divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; border: 1px solid #999; text-align: left;font-weight: bold; '>"));
                    divDetail.Controls.Add(new LiteralControl(dtFaculty.Rows[j]["ExperianceTotal"].ToString() + "</td>"));
                    divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; border: 1px solid #999; text-align: center;cursor:pointer' onclick='javascript: TakeAction("+dtFaculty.Rows[j]["ProfileID"].ToString() +");'>View</td>"));
                    divDetail.Controls.Add(new LiteralControl("</tr>"));
                }

                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("<tr>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("<td style='padding: 8px; color: #000; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left;'>&nbsp;</td>"));
                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("</tbody>"));
                divDetail.Controls.Add(new LiteralControl("</table>"));

                divDetail.Controls.Add(new LiteralControl("</tr>"));
                divDetail.Controls.Add(new LiteralControl("</tbody>"));
                divDetail.Controls.Add(new LiteralControl("</table><br/><br/>"));
                //End Subject Details-- Table End

                dtFaculty = null;              
            }

            
        }
    }
}