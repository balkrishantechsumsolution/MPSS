using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Common.QRCode
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lblQRCode_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCode.Text))
            {
                //QRCode1.GenerateQRCode(Functions.SQLInjection(txtServiceName.Text), Functions.SQLInjection(txtAppNo.Text), Functions.SQLInjection(txtTransId.Text), Functions.SQLInjection(txtTransdt.Text), Functions.SQLInjection(txtTransAmt.Text), Functions.SQLInjection(txtChannelId.Text));
                QRCode1.GenerateQRCode(txtServiceName.Text, txtAppNo.Text, txtTransId.Text, txtTransdt.Text, txtTransAmt.Text, txtChannelId.Text);
            }
            else {
                //QRCode1.GenerateQRCode(Functions.SQLInjection(txtCode.Text));
                QRCode1.GenerateQRCode(txtCode.Text);
            }
        }
    }
}