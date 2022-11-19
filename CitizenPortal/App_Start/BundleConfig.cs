using System.Web;
using System.Web.Optimization;

namespace CitizenPortal
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //"~/Scripts/jquery-{version}.js"));

            //bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
            //            "~/Scripts/jquery.validate*", "~/Scripts/md5.js"));

            ////// Use the development version of Modernizr to develop with and learn from. Then, when you're
            ////// ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            //bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
            //            "~/Scripts/modernizr-2.8.3.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                "~/Content/site.css", "~/Content/bootstrap.css", "~/PortalStyles/font-awesome.min.css"));

            bundles.Add(new StyleBundle("~/Content/Portal/css").Include(
                "~/PortalStyles/PortalHome.css"));
        }
    }
}
