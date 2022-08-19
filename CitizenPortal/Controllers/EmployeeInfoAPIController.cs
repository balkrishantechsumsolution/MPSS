using CitizenPortalLib.Resources;
using Microsoft.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace CitizenPortal.Controllers
{
    public class EmployeeInfoAPIController : ApiController
    {
        
        // GET: api/EmployeeInfoAPI
        public IQueryable<Employee> GetEmployeeInfoes()
        {
            List<Employee> info = new List<Employee>();

            Employee emp = new Employee();
            emp.EmpNo = 1;
            emp.EmpName = "MS";            
            emp.Salary = 78000;
            emp.DeptName = "IT";
            emp.Designation = "Manager";

            info.Add(emp);

            emp = new Employee();
            emp.EmpNo = 2;
            emp.EmpName = "VB";
            emp.Salary = 52000;
            emp.DeptName = "HR";
            emp.Designation = "Lead";
            info.Add(emp);

            return info.AsQueryable();
        }

        public class Employee
        {
            public int EmpNo { get; set; }
            public string EmpName { get; set; }
            public decimal Salary { get; set; }
            public string DeptName { get; set; }
            public string Designation { get; set; }
        }
    }
}
