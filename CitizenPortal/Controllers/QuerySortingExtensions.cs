﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Dynamic;

namespace CitizenPortal.Controllers
{
    public static class QuerySortingExtensions
    {
        public static IQueryable<T> ApplySorting<T>(this IQueryable<T> query, IEnumerable<string> sort) where T : class
        {
            if (sort != null)
            {
                List<string> sortFields = new List<string>();

                foreach (string sortField in sort)
                {
                    string direction = null;
                    string fieldName = null;

                    if (sortField.StartsWith("+"))
                    {
                        sortFields.Add(string.Format("{0} ASC", sortField.TrimStart('+')));
                    }
                    else if (sortField.StartsWith("-"))
                    {
                        sortFields.Add(string.Format("{0} DESC", sortField.TrimStart('-')));
                    }
                    else
                    {
                        sortFields.Add(sortField);
                    }
                }

                return query.OrderBy(String.Join(",", sortFields));
            }

            return query;
        }
    }
}
