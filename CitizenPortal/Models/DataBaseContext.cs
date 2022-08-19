using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace CitizenPortal.Models
{
    public class DataBaseContext : DbContext
    {
        public DataBaseContext() : base("name=MasterDB")
        {

            Database.SetInitializer<DataBaseContext>(null);

        }
        public virtual DbSet<PgResultVerifyApi> PgResultVerifyApis { set; get; }
        public virtual DbSet<PgAllResultVerifyApiTb> PgAllResultVerifyApiTbs { set; get; }

       

        //public List<PGReportSummary> GetProcPGFilterDataSp()
        //{
        //    string query = String.Format(@"Exec GetProcPGFilterDataSp");
        //    List<PGReportSummary> result = Database.SqlQuery<PGReportSummary>(query).ToList();
        //    return result;
        //}

    }
}