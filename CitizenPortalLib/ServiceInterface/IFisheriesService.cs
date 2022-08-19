using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.ServiceInterface
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IFisheriesService" in both code and config file together.
    [ServiceContract]
    public interface IFisheriesService
    {
        [OperationContract]
        void DoWork();

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertCRAFT(CRAFT_DT Data);

        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFisheries(Fisheries_DT Data);

        //New Function added for Fisheries Registration
        [OperationContract]
        [WebInvoke(Method = "POST", ResponseFormat = WebMessageFormat.Json)]
        string InsertFisheriesRegistration(FisheriesRegistration_DT Data);

        
    }
}
