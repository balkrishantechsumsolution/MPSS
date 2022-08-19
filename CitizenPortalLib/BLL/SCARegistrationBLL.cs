using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CitizenPortalLib.DAL;
using System.Data;
using CitizenPortalLib.DataStructs;
using System.Transactions;

namespace CitizenPortalLib.BLL
{
    public class SCARegistrationBLL : BLLBase
    {
        private SCARegistrationDAL m_SCARegistrationDAL;

        public SCARegistrationBLL()
        {
            m_SCARegistrationDAL = new SCARegistrationDAL();
        }

        public void Insert(SCARegistration_DT objSCARegistration_DT, string[] AFields, List<SCAContactPerson_DT> ListContactPersonDetails, string[] AContactFields, SCAUsers_DT objSCAUsers_DT, string[] AUsersFields)
        {
            string t_SCAID = "";
            LedgerTable_DT objSCAFin_DT = null;
            string[] t_LedgerFields = { "Channel_ID"
                                            ,"Year"
                                            ,"DC_OP_BAL"
                                            ,"YRLY_CRTOT"
                                            ,"YRLY_DBTOT"
                                            ,"DC_CLO_BAL"
                                            ,"CreatedOn"
                                            ,"CreatedBy"
                                            , "apr_crtot"
                                            , "apr_dbtot"
                                            , "may_crtot"
                                            , "may_dbtot"
                                            , "jun_crtot"
                                            , "jun_dbtot"
                                            , "jul_crtot"
                                            , "jul_dbtot"
                                            , "aug_crtot"
                                            , "aug_dbtot"
                                            , "sep_crtot"
                                            , "sep_dbtot"
                                            , "oct_crtot"
                                            , "oct_dbtot"
                                            , "nov_crtot"
                                            , "nov_dbtot"
                                            , "dec_crtot"
                                            , "dec_dbtot"
                                            , "jan_crtot"
                                            , "jan_dbtot"
                                            , "feb_crtot"
                                            , "feb_dbtot"
                                            , "mar_crtot"
                                            , "mar_dbtot"
                                      };
            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew))
            {
                m_SCARegistrationDAL.Insert(objSCARegistration_DT, AFields);

                //Logic for Inserting Contact Details
                foreach (SCAContactPerson_DT ContactDetails_DT in ListContactPersonDetails)
                {                                                                               
                    AddContact(ContactDetails_DT, AContactFields);
                }

                m_SCARegistrationDAL.InsertUsersDetails(objSCAUsers_DT, AUsersFields);

                //t_SCAID = m_SCARegistrationDAL.GenerateID(objSCARegistration_DT, objSCAUsers_DT.UNQ);
                t_SCAID = m_SCARegistrationDAL.GenerateID(objSCARegistration_DT, objSCAUsers_DT);

                objSCAFin_DT = new LedgerTable_DT();

                objSCAFin_DT.Channel_ID = t_SCAID;
                objSCAFin_DT.Year = CommonUtility.GetFinancialYear();
                objSCAFin_DT.DC_OP_BAL = objSCAFin_DT.YRLY_CRTOT = objSCAFin_DT.YRLY_DBTOT = objSCAFin_DT.DC_CLO_BAL = 0;
                objSCAFin_DT.apr_crtot = 0;
                objSCAFin_DT.apr_dbtot = 0;
                objSCAFin_DT.may_crtot = 0;
                objSCAFin_DT.may_dbtot = 0;
                objSCAFin_DT.jun_crtot = 0;
                objSCAFin_DT.jun_dbtot = 0;
                objSCAFin_DT.jul_crtot = 0;
                objSCAFin_DT.jul_dbtot = 0;
                objSCAFin_DT.aug_crtot = 0;
                objSCAFin_DT.aug_dbtot = 0;
                objSCAFin_DT.sep_crtot = 0;
                objSCAFin_DT.sep_dbtot = 0;
                objSCAFin_DT.oct_crtot = 0;
                objSCAFin_DT.oct_crtot = 0;
                objSCAFin_DT.oct_dbtot = 0;
                objSCAFin_DT.nov_crtot = 0;
                objSCAFin_DT.nov_dbtot = 0;
                objSCAFin_DT.dec_crtot = 0;
                objSCAFin_DT.dec_dbtot = 0;
                objSCAFin_DT.jan_crtot = 0;
                objSCAFin_DT.jan_dbtot = 0;
                objSCAFin_DT.feb_crtot = 0;
                objSCAFin_DT.feb_dbtot = 0;
                objSCAFin_DT.mar_crtot = 0;
                objSCAFin_DT.mar_dbtot = 0;
                objSCAFin_DT.CreatedOn = DateTime.Now;
                objSCAFin_DT.CreatedBy = "System";

                m_SCARegistrationDAL.InsertIntoLedger(objSCAFin_DT, t_LedgerFields);
                
                scope.Complete();                
            }

        }

        private void AddContact(SCAContactPerson_DT ContactDetails, string[] AFields)
        {
            m_SCARegistrationDAL.InsertContactDetails(ContactDetails, AFields);   
        }

        private void InsertMSTUsers(SCAUsers_DT objSCAUsers_DT, string[] AUsersFields)
        {
            m_SCARegistrationDAL.InsertUsersDetails(objSCAUsers_DT, AUsersFields);
        }

        public bool ValidateSCA(string CompanyName)
        {
            return m_SCARegistrationDAL.ValidateSCA(CompanyName);            
        }
    }
}
