using System;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace CitizenPortal.g2c.forms
{
    public partial class SIRBApplicantList : System.Web.UI.Page
    {
        KioskRegistrationBLL m_KioskRegistrationBLL = new KioskRegistrationBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        //protected void DataGridView_PreRender(object sender, EventArgs e)
        //{
        //    //DataGridView.UseAccessibleHeader = false;
        //    //DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
        //    //DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
        //    //int CellCount = DataGridView.FooterRow.Cells.Count;
        //    //DataGridView.FooterRow.Cells.Clear();
        //    //DataGridView.FooterRow.Cells.Add(new TableCell());
        //    //DataGridView.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
        //    //DataGridView.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
        //    //DataGridView.FooterRow.Cells.Add(new TableCell());

        //    //TableFooterRow tfr = new TableFooterRow();
        //    //for (int i = 0; i < CellCount; i++)
        //    //{
        //    //    tfr.Cells.Add(new TableCell());
        //    //    //tfr.Cells[i].i
        //    //    //tfr.Cells[i].ColumnSpan = CellCount;
        //    //    //tfr.Cells[0].Text = "Footer 2";
        //    //}
        //    //DataGridView.FooterRow.Controls[1].Controls.Add(tfr);
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtBirthDate.Text == "" || txtMobile.Text == "")
            {
                string m_Message = "Please enter Applicant Date of Birth and Registered Mobile Number to proceed";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (txtName.Text == "" && txtBirthDate.Text == "" && txtAppID.Text == "" && txtMobile.Text == "")
            {
                string m_Message = "Please enter at least three fields to proceed";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (captcha.Text == "")
            {
                string m_Message = "Please enter captcha to search reacord";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (Session["LoginCaptchaTest"] == null)
            {
                string m_Message = "Invalid Captcha. Please Refresh the Page to proceed";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (captcha.Text != Session["LoginCaptchaTest"].ToString())
            {
                string m_Message = "Invalid Captcha. Please Refresh the Page to proceed";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            string BirthDate = "";

            if (txtBirthDate.Text != "" && txtBirthDate.Text != null)
            {
                BirthDate = Convert.ToDateTime(txtBirthDate.Text).ToString("yyyy-MM-dd" + " 00:00:00.000");
            }

            

            //int result = 0;

            try
            {
                DataGridView.DataSource = null;
                DataTable t_Result = null;
                t_Result = m_KioskRegistrationBLL.GetSIRBApplicantList(BirthDate, txtAppID.Text, txtMobile.Text, txtName.Text);
                DataGridView.DataSource = t_Result;

                //t_Result = m_OISFBLL.GetOISFAppID(txtLogin.Text, BirthDate, txtAppID.Text, txtMobile.Text, txtRollNO.Text);
                
                if (t_Result != null && t_Result.Rows.Count > 0)
                {
                    int i;
                    DataGridView.Columns.Clear();
                    for (i = 0; i < t_Result.Columns.Count; i++)
                    {
                        BoundField test = new BoundField();
                        test.DataField = t_Result.Columns[i].ToString();
                        test.HeaderText = t_Result.Columns[i].ToString();
                        DataGridView.Columns.Add(test);
                        test = null;
                    }
                    DataGridView.DataBind();

                }
                else
                {
                    string m_Message = "No record found againt the data entered. Please enter correct information to search.";
                    divErr.InnerHtml = m_Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                }
            }
            catch (Exception ex)
            {
                btnSubmit.Visible = false;
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }

            
        }
    }
}