using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

namespace CitizenPortalLib
{
    public class CaptchaImage
    {
        #region Public Properties

        public Bitmap Bitmap
        {
            get { return mobjBitmap; }
        }
        #endregion
        #region Private vars

        private string mstrText;
        private int mintWidth = 200;
        private int mintHeight = 50;
        private string mstrFont = System.Drawing.FontFamily.GenericSerif.Name;
        private Bitmap mobjBitmap;
        private Random mobjRandom = new Random();
        #endregion
        #region Constr/Deconstr

        public CaptchaImage(string strText, int intWidth, int intHeight)
        {
            mstrText = strText;
            mintWidth = intWidth;
            mintHeight = intHeight;
            CreateCaptcha();
        }

        public CaptchaImage(string strText, string strFont, int intWidth, int intHeight)
        {
            mstrText = strText;
            mintWidth = intWidth;
            mintHeight = intHeight;
            Font objFont = null;
            try
            {
                objFont = new Font(strFont, 12F);
                mstrFont = strFont;
                objFont.Dispose();
            }
            catch
            { }
            finally
            {
                objFont = null;
            }
            CreateCaptcha();
        }
        ~CaptchaImage()
        {
            Dispose(false);
        }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
            Dispose(true);
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                mobjBitmap.Dispose();
        }
        #endregion
        #region CreateCaptcha

        private void CreateCaptcha()
        {
            //Create instance of bitmap object
            Bitmap objBitmap = new Bitmap(mintWidth, mintHeight, PixelFormat.Format32bppArgb);

            //Create instance of graphics object
            Graphics objGraphics = Graphics.FromImage(objBitmap);
            objGraphics.SmoothingMode = SmoothingMode.AntiAlias;
            Rectangle objRect = new Rectangle(0, 0, mintWidth, mintHeight);

            //Fill the background in a light gray pattern
            HatchBrush objHatchBrush = new HatchBrush(HatchStyle.DiagonalCross, Color.LightGray, Color.White);
            objGraphics.FillRectangle(objHatchBrush, objRect);

            //Determine the appropriate font size
            SizeF objSize;
            float flFontSize = objRect.Height + 1;
            Font objFont;
            do	//Decrease font size until text fits within the space
            {
                flFontSize--;
                objFont = new Font(mstrFont, flFontSize, FontStyle.Bold);
                objSize = objGraphics.MeasureString(mstrText, objFont);
            } while (objSize.Width > objRect.Width);

            //Format the text
            StringFormat objStringFormat = new StringFormat();
            objStringFormat.Alignment = StringAlignment.Center;
            objStringFormat.LineAlignment = StringAlignment.Center;

            //Create a path using the text and randomly warp it
            GraphicsPath objGraphicsPath = new GraphicsPath();
            objGraphicsPath.AddString(mstrText, objFont.FontFamily, (int)objFont.Style, objFont.Size, objRect, objStringFormat);
            float flV = 4F;

            //Create a parallelogram for the text to draw into
            PointF[] arrPoints =
			{
				new PointF(mobjRandom.Next(objRect.Width) / flV, mobjRandom.Next(objRect.Height) / flV),
				new PointF(objRect.Width - mobjRandom.Next(objRect.Width) / flV, mobjRandom.Next(objRect.Height) / flV),
				new PointF(mobjRandom.Next(objRect.Width) / flV, objRect.Height - mobjRandom.Next(objRect.Height) / flV),
				new PointF(objRect.Width - mobjRandom.Next(objRect.Width) / flV, objRect.Height - mobjRandom.Next(objRect.Height) / flV)
			};

            //Create the warped parallelogram for the text
            Matrix objMatrix = new Matrix();
            objMatrix.Translate(0F, 0F);
            objGraphicsPath.Warp(arrPoints, objRect, objMatrix, WarpMode.Perspective, 0F);

            //Add the text to the shape
            objHatchBrush = new HatchBrush(HatchStyle.LargeConfetti, Color.DarkGray, Color.Black);
            objGraphics.FillPath(objHatchBrush, objGraphicsPath);

            //Add some random noise
            int intMax = Math.Max(objRect.Width, objRect.Height);
            for (int i = 0; i < (int)(objRect.Width * objRect.Height / 30F); i++)
            {
                int x = mobjRandom.Next(objRect.Width);
                int y = mobjRandom.Next(objRect.Height);
                int w = mobjRandom.Next(intMax / 15);
                int h = mobjRandom.Next(intMax / 70);
                objGraphics.FillEllipse(objHatchBrush, x, y, w, h);
            }

            //Release memory
            objFont.Dispose();
            objHatchBrush.Dispose();
            objGraphics.Dispose();

            //Set the public property to the 
            mobjBitmap = objBitmap;
        }
        #endregion
    }

}