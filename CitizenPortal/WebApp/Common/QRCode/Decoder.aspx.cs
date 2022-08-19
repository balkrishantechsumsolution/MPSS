using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ThoughtWorks.QRCode.Codec;
using ThoughtWorks.QRCode.Codec.Data;

namespace CitizenPortal.WebApp.Common.QRCode
{
    public partial class Decoder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDecode_Click(object sender, EventArgs e)
        {
            try
            {
                QRCodeDecoder decoder = new QRCodeDecoder();
                //QRCodeDecoder.Canvas = new ConsoleCanvas();
                String decodedString = decoder.decode(new QRCodeBitmapImage(new Bitmap(QRFileUpload.PostedFile.InputStream)));
                txtDecodedData.Text = decodedString;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
        }

    }
}