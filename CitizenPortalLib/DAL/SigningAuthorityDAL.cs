using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;

namespace CitizenPortalLib.DAL
{
    public class SigningAuthorityDAL : DALBase
    {
        Database m_DataBase;

        public SigningAuthorityDAL(Database DatabaseObj)
            : base(DatabaseObj)
        {

        }

        public SigningAuthorityDAL()
            : base()
        {

        }

        static string TableName = "mstSigningAuthority";

        internal void Insert(DataStructs.SigningAuthority_DT objSigningAuthority_DT, string[] AFields)
        {
            int ResultRow;
            DbCommand cmdInsert;

            QueryBuilder qb = new QueryBuilder();

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            cmdInsert = qb.GetInsertCommand(objSigningAuthority_DT, TableName, AFields);

            ResultRow = m_DataBase.ExecuteNonQuery(cmdInsert);
        }

        internal DataTable GetService()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from G2CServices  where Client = '120' and svcPaid = '1' and Status <> 'Pending' and GRUP = '10001' order by SvcName";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }


        internal DataTable GetAuthority()
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select RowId, KeyField, AuthorityId, AuthorityName, AuthorityNameLL, ShowSubDivision from mstAuthority";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetSubDivision(string TalukaCode)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstSubDivision where TalukaCode = '" + TalukaCode + "'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetDocument(string ServiceId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select * from mstDocType Where SvcId LIKE '%" + ServiceId + "%'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal string DeleteSigningAuthority(string RowId)
        {
            int ResultRow;
            string Query = "";

            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);

            Query = "Delete from " + TableName + " Where RowID = '" + RowId + "'";

            ResultRow = m_DataBase.ExecuteNonQuery(CommandType.Text, Query);
            return ResultRow.ToString();
        }

        internal DataTable DeleteButton(string DistrictCode, string TalukaCode, string ServiceId, string DocumentType, string LangId, string KioskId, string CertificateType, string SubDivision)
        {
            string t_WhereStatement = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand;
                if (LangId == "2")
                {
                    //Select A.rowid As 'RowId', E.AuthorityName As 'Authority Name', B.SvcName As 'Service Name', C.Districtname As 'District', D.SubDistrictname As 'Taluka', A.DocumentType As 'Document Type', A.Place As 'Place', A.CreatedOn As 'Created On'
                    SQLCommand = @"Select A.rowid As 'RowId', E.AuthorityNameLL As 'प्राधिकृत स्वाक्षरीकर्ता', B.SvcNameLL As 'सेवा', C.Districtname As 'जिल्हा', D.SubDistrictname As 'तालुका', F.DocTypeLL As 'दस्तावेज़', A.PlaceLL As 'स्थान', A.CreatedOn As 'दिनांकित' ";
                }
                else
                {
                    SQLCommand = "Select A.rowid As 'RowId', E.AuthorityName As 'Authority Name', B.SvcName As 'Service Name', C.Districtname As 'District', D.SubDistrictname As 'Taluka', F.DocType As 'Document Type', A.Place As 'Place', A.CreatedOn As 'Created On' ";                                        
                }

                SQLCommand = SQLCommand + @" from mstsigningauthority A 
                                        Inner Join mstAuthority E on A.SigningAuthority = E.AuthorityId
                                        Inner Join mstServices B on A.ServiceCode = B.SvcID 
                                        Inner Join mstDistrict C on A.DistrictCode = C.Districtcode And C.Langid = '" + LangId + @"' 
                                        Left Join mstTaluka D on A.SubDistrictCode = D.SubDistrictcode And D.Langid = '" + LangId + @"' 
                                        Inner Join mstDocType F on A.DocumentType = F.DocTypeId
                                        Where A.DistrictCode = '" + DistrictCode + "' And A.SubdistrictCode = '" + TalukaCode + "' And A.ServiceCode ='" + ServiceId + "' and KioskId = '" + KioskId + "'";

                if (DocumentType != "")
                    t_WhereStatement += " And A.DocumentType = '" + DocumentType + "'";

                if (CertificateType != "")
                {
                    t_WhereStatement = t_WhereStatement + " And A.CertificateCode = '" + CertificateType + "' ";
                }

                if (SubDivision != "")
                {
                    t_WhereStatement = t_WhereStatement + " And A.SubDivisionCode = '" + SubDivision + "' ";
                }

                SQLCommand = SQLCommand + t_WhereStatement + "  order by rowid desc";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetSigningAuthority(string DistrictCode, string TalukaCode, string ServiceId, string DocumentType, string LangId, string CertificateType, string SubDivision)
        {
            string t_WhereStatement = "";
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand;
                if (LangId == "2")
                {
                    //Select A.rowid As 'RowId', E.AuthorityName As 'Authority Name', B.SvcName As 'Service Name', C.Districtname As 'District', D.SubDistrictname As 'Taluka', A.DocumentType As 'Document Type', A.Place As 'Place', A.CreatedOn As 'Created On'
                    SQLCommand = @"Select A.rowid As 'RowId', E.AuthorityNameLL As 'प्राधिकृत स्वाक्षरीकर्ता', B.SvcNameLL As 'सेवा', C.Districtname As 'जिल्हा', G.SubDivisionName As 'Sub-Division', D.SubDistrictname As 'तालुका', F.DocTypeLL As 'दस्तावेज़', A.CertificateTypeLL As CertificateType, A.AuthorityNameLL As 'स्वाक्षरीकर्ता', A.PlaceLL As 'स्थान', A.HeaderTextMar As 'Header Text', A.CreatedOn As 'दिनांकित' ";
                }
                else
                {
                    SQLCommand = @"Select A.rowid As 'RowId', E.AuthorityName As 'Authority', B.SvcName As 'Service Name', C.Districtname As 'District', G.SubDivisionName As 'Sub-Division', D.SubDistrictname As 'Taluka', F.DocType As 'Document Type', A.CertificateType As CertificateType, A.AuthorityName As 'Authority Name', A.Place As 'Place', A.HeaderTextEng As 'Header Text', A.CreatedOn As 'Created On' ";
                }

                SQLCommand = SQLCommand + @" from mstsigningauthority A 
                                        Inner Join mstAuthority E on A.SigningAuthority = E.AuthorityId
                                        Inner Join mstServices B on A.ServiceCode = B.SvcID 
                                        Inner Join mstDistrict C on A.DistrictCode = C.Districtcode And C.Langid = '1' 
                                        left Join mstSubDivision G on A.SubDivisionCode = G.SubDivisionCode And G.Langid = '1' 
                                        Left Join mstTaluka D on A.SubDistrictCode = D.SubDistrictcode And D.Langid = '1'
                                        Inner Join mstDocType F on A.DocumentType = F.DocTypeId
                                        Where A.DistrictCode = '" + DistrictCode + "' And A.SubdistrictCode = '" + TalukaCode + "' And A.ServiceCode ='" + ServiceId + "'";

                if (DocumentType != "")
                    t_WhereStatement += " And A.DocumentType = '" + DocumentType + "'";

                if (CertificateType != "")
                {
                    t_WhereStatement = t_WhereStatement + " And A.CertificateCode = '" + CertificateType + "' ";
                }

                SQLCommand = SQLCommand + t_WhereStatement + "  order by rowid desc";

                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }

        internal DataTable GetShowSubDivision(string AuthorityId)
        {
            DataTable oDataTable = new DataTable();
            IDataReader Reader = null;
            m_DataBase = DatabaseFactory.CreateDatabase(this.ConnectionString);
            try
            {
                DbCommand selectCommand;
                String SQLCommand = "Select AuthorityId, AuthorityName, AuthorityNameLL, ShowSubDivision from mstAuthority Where AuthorityId = '" + AuthorityId + "'";
                selectCommand = m_DataBase.GetSqlStringCommand(SQLCommand);
                Reader = m_DataBase.ExecuteReader(selectCommand);
                if (Reader != null)
                    oDataTable.Load(Reader);

                return oDataTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (Reader != null)
                {
                    Reader.Close();
                }
            }
        }
    }
}
