using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.DAL;

namespace CitizenPortal.WebApp.G2G.OISF.Test
{
    public partial class EncryptDecrypt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEncyptConvert_Click(object sender, EventArgs e)
        {
            try
            {
                lblEncrypt.Text=Encryption.Encrypt(txtEncrypt.Text);
               

            }
            catch (Exception)
            {

                
            }
        }

        protected void btnDecryptConvert_Click(object sender, EventArgs e)
        {
            try
            {
                lblDecrypt.Text = Encryption.Decrypt(txtDecrypt.Text);

            }
            catch (Exception)
            {
 
            }

        }
    }
}