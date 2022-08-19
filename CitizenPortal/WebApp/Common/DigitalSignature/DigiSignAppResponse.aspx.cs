using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Common
{
    public partial class DigiSignAppResponse : System.Web.UI.Page
    {
        string m_AppID, m_ServiceID;
        WorkFlowBLL m_WorkFlowBLL = new WorkFlowBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string AppID = string.Empty;

                try
                {

                    AppID = Request["AppID"].ToString();

                    if (Request["SignedPdf"] != null && Request["SignedPdf"] != "")
                    {
                        byte[] byteData = Convert.FromBase64String(Request["SignedPdf"]);

                        string signFile = AppID + "_" + DateTime.Now.ToString("yyyyMMddhhmmss") + "_Digi.pdf";
                        string SignedFileName = Server.MapPath("/Uploads/" + AppID + "/");

                        string PdfPath;
                        PdfPath = SignedFileName + "\\" + signFile;
                        if (File.Exists(PdfPath))
                        {
                            File.Delete(PdfPath);
                        }

                        using (FileStream wFile = new FileStream(SignedFileName + signFile, FileMode.Create))
                        {
                            wFile.Write(byteData, 0, byteData.Length);
                            wFile.Close();

                            if (File.Exists(PdfPath))
                            {


                            }
                        }

                        bool t_Result = false;

                        //t_Result = m_WorkFlowBLL.SendAppInWorkFlow(m_ServiceID, m_AppID, t_StageID, t_ActionID, t_Remarks, t_CreatedBy, t_IPAddress);                        
                        //t_Result = m_WorkFlowBLL.UpdatePDFDetails(m_AppID);

                        string t_Destination = "";
                        t_Destination = "/WebApp/G2G/ShowPDF.aspx?AppID=" + AppID + "&FName=" + signFile;

                        Response.Redirect(t_Destination, false);
                    }
                    else
                    {
                    }

                }
                catch (Exception ex)
                {
                }
            }
        }


    }
}