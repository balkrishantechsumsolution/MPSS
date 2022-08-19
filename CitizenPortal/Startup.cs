using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CitizenPortal.Startup))]
[assembly: log4net.Config.XmlConfigurator(ConfigFile = "Web.config", Watch = true)]
namespace CitizenPortal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
