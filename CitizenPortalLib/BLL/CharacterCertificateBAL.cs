using CitizenPortalLib.DAL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CitizenPortalLib.BLL
{
    public class CharacterCertificateBAL
    {
        private CharacterCertificateDAL ObjCharacterCertificateDAL;
        public CharacterCertificateBAL()
        {
            ObjCharacterCertificateDAL = new CharacterCertificateDAL();
        }

        public DataTable InsertData(CTTNSCharacter ObjCTTNSCharacter, string[] aFields)
        {
            return ObjCharacterCertificateDAL.InsertData(ObjCTTNSCharacter, aFields);
        }

        public DataSet GetAppDetails(string ServiceID, string AppID)
        {
            DataSet t_AppDS = null;
            t_AppDS = ObjCharacterCertificateDAL.GetAppDetails(ServiceID, AppID);
            return t_AppDS;
        }

        public DataTable CheckLocalAadhaar(string UID)
        {
            DataTable t_AppDS = null;
            t_AppDS = ObjCharacterCertificateDAL.LocalAdhaarData(UID);
            return t_AppDS;
        }

    }
}
