using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace CitizenPortalLib.BLL
{
    public class ChangePasswordBLL : BLLBase
    {
        private ChangePasswordDAL m_ChangePasswordDAL = new ChangePasswordDAL();

        public void UpdatePassword(string Password, string KioskID, string LoginID, string ModifiedBy)
        {
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_ChangePasswordDAL.UpdatePassword(Password, KioskID, LoginID, ModifiedBy);
                scope.Complete();
            }
        }

        public DataTable StudentSearch(string regNo, string dob, string name, string rollno, string father)
        {
            DataTable t_CourseDT = null;

            t_CourseDT = m_ChangePasswordDAL.StudentSearch(regNo, dob, name, rollno, father);

            return t_CourseDT;
        }

        public DataSet GetStudentDetails(string AppID)
        {
            DataSet t_SubjectDS = null;

            t_SubjectDS = m_ChangePasswordDAL.GetStudentDetails(AppID);

            return t_SubjectDS;
        }

        public DataTable InsertPasswordDetail(UpdateStudentPassword_DT data, string[] AFields)
        {
            DataTable t_AppDT = null;
            t_AppDT = m_ChangePasswordDAL.InsertPasswordDetail(data, AFields);
            return t_AppDT;
        }
    }
}
