using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CitizenPortal.Controllers
{
    public class CustomersController : ApiController
    {

        // GET api/customers
        public PagedResult<Customer> Get(int pageNo = 1, int pageSize = 50, [FromUri] string[] sort = null, string search = null)
        {
            // Determine the number of records to skip
            int skip = (pageNo - 1) * pageSize;


            System.Data.DataTable dt = GetResult("Select * From Customers", "Customers").Tables[0];
            List<Customer> lstCustomer = new List<Customer>();


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Customer cust = new Customer();

                //cust.Id = 1;
                cust.FirstName = dt.Rows[i]["FirstName"].ToString();
                cust.LastName = dt.Rows[i]["LastName"].ToString();

                lstCustomer.Add(cust);
                cust = null;
            }

            IQueryable<Customer> queryable = lstCustomer.AsQueryable();

            // Apply the search
            if (!String.IsNullOrEmpty(search))
            {
                string[] searchElements = search.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
                foreach (string searchElement in searchElements)
                {
                    string element = searchElement;
                    queryable = queryable.Where(c => c.FirstName.Contains(element) || c.LastName.Contains(element));
                }
            }

            // Add the sorting
            if (sort != null && sort.Length > 0)
                queryable = queryable.ApplySorting(sort);
            else
                queryable = queryable.OrderBy(c => c.Id);

            // Get the total number of records
            int totalItemCount = queryable.Count();

            // Retrieve the customers for the specified page
            var customers = queryable
                .Skip(skip)
                .Take(pageSize)
                .ToList();

            // Return the paged results
            return new PagedResult<Customer>(customers, pageNo, pageSize, totalItemCount);
        }


        System.Data.DataSet GetResult(string Query, string TableName)
        {
            string t_ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

            System.Data.SqlClient.SqlConnection t_Connection;
            System.Data.SqlClient.SqlDataAdapter t_DA;
            System.Data.DataSet t_DS;

            t_Connection = new System.Data.SqlClient.SqlConnection(t_ConnectionString);
            t_DA = new System.Data.SqlClient.SqlDataAdapter(Query, t_Connection);
            t_DS = new System.Data.DataSet();
            try
            {
                t_DA.Fill(t_DS, TableName);
            }
            catch
            {
                return null;
            }
            return t_DS;
        }
    }

    public class Customer
    {
        //[Key]
        public Guid Id { get; set; }

        //[Required]
        public string FirstName { get; set; }

        //[Required]
        public string LastName { get; set; }
    }

}
