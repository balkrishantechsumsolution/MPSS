using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace CitizenPortal.Services
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IImageUpload" in both code and config file together.
    [ServiceContract]
    public interface IImageUpload
    {
        [OperationContract]
        void DoWork();

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "FileUpload/{fileName}")]
        void FileUpload(string fileName, Stream fileStream);
    }
}
