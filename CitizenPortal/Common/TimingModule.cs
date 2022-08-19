using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Web;

namespace CitizenPortal.Common
{
    public class TimingModule : IHttpModule
    {
        /// <summary>
        /// You will need to configure this module in the Web.config file of your
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpModule Members

        public void Dispose()
        {
            //clean-up code here.
        }

        public void Init(HttpApplication context)
        {
            // Below is an example of how you can handle LogRequest event and provide 
            // custom logging implementation for it
            context.LogRequest += new EventHandler(OnLogRequest);
            context.BeginRequest += OnBeginRequest;
            context.EndRequest += OnEndRequest;
        }

        #endregion

        List<string> extensionsToSkip = new List<string>() { "" };

        public void OnLogRequest(Object source, EventArgs e)
        {
            //custom logging logic can go here
        }

        void OnBeginRequest(object sender, System.EventArgs e)
        {
            ////  we don't have to process all requests...
            //if (extensionsToSkip.Contains(Path.GetExtension(HttpContext.Current.Request.Url.LocalPath)))
            //    return;

            //if (HttpContext.Current.Request.IsLocal
            //    && HttpContext.Current.IsDebuggingEnabled)
            //{
            //    var stopwatch = new Stopwatch();
            //    HttpContext.Current.Items["Stopwatch"] = stopwatch;
            //    stopwatch.Start();
            //}
        }

        void OnEndRequest(object sender, System.EventArgs e)
        {
            ////  we don't have to process all requests...
            //if (extensionsToSkip.Contains(Path.GetExtension(HttpContext.Current.Request.Url.LocalPath)))
            //    return;

            //if (HttpContext.Current.Request.IsLocal
            //    && HttpContext.Current.IsDebuggingEnabled)
            //{
            //    Stopwatch stopwatch =
            //      (Stopwatch)HttpContext.Current.Items["Stopwatch"];
            //    stopwatch.Stop();

            //    TimeSpan ts = stopwatch.Elapsed;
            //    string elapsedTime = String.Format("{0}ms", ts.TotalMilliseconds);

            //    HttpContext.Current.Response.Write("<div><p>" + elapsedTime + "</p></div>");
            //}
        }
    }
}
