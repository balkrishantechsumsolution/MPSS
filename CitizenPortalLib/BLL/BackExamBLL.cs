using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.DAL;

namespace CitizenPortalLib.BLL
{
    public class BackExamBLL : BLLBase
    {
        private BackExamDAL m_BackExamDAL;
        public BackExamBLL()
        {
            m_BackExamDAL = new BackExamDAL();
        }
        public DataSet Get_BackStudentDtls(string RollNo, string m_BranchName)
        {
            DataSet t_BackDS = null;

            t_BackDS = m_BackExamDAL.Get_BackStudentDtls(RollNo, m_BranchName);

            return t_BackDS;
        }
        public DataTable InsertBackExamFormDataByDEO(BackExamForm_DT objBackExamForm_DT, string[] AFields)
        {
            DataTable t_AppDT = null;

            t_AppDT = m_BackExamDAL.InsertBackExamFormDataByDEO(objBackExamForm_DT, AFields);

            return t_AppDT;
        }
        public DataSet GetStudentExamData(string m_ServiceID, string m_AppID)
        {
            DataSet t_AppDT = null;

            t_AppDT = m_BackExamDAL.Get_GetStudentExamData(m_ServiceID, m_AppID);

            return t_AppDT;
        }
    }
}
