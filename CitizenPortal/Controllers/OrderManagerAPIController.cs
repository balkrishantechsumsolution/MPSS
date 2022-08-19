using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CitizenPortal.Controllers
{
    public class OrderManagerAPIController : ApiController
    {
        List<OrderManager> ctx;
        public OrderManagerAPIController()
        {
            ctx = new List<OrderManager>();

            OrderManager order = new OrderManager();
            order.OrderId = 1;
            order.CustomerName = "SRS Medicles";
            order.CustomerMobileNo = "1122334455";
            order.OrderedItem = "Crocin";
            order.OrderedQuantity = 1000;
            order.SalesAgentName = "MS";

            ctx.Add(order);

            order = new OrderManager();
            order.OrderId = 2;
            order.CustomerName = "SPR Medico";
            order.CustomerMobileNo = "1223344556";
            order.OrderedItem = "Rosyday";
            order.OrderedQuantity = 500;
            order.SalesAgentName = "MS";

            ctx.Add(order);

            order = new OrderManager();
            order.OrderId = 3;
            order.CustomerName = "MRT Healthcare";
            order.CustomerMobileNo = "2121212112";
            order.OrderedItem = "Telma-AM";
            order.OrderedQuantity = 784;
            order.SalesAgentName = "LS";

            ctx.Add(order);

            order = new OrderManager();
            order.OrderId = 4;
            order.CustomerName = "ABC Medi";
            order.CustomerMobileNo = "1212121212";
            order.OrderedItem = "S-Numlo";
            order.OrderedQuantity = 895;
            order.SalesAgentName = "LS";

            ctx.Add(order);

            order = new OrderManager();
            order.OrderId = 5;
            order.CustomerName = "PJ Health";
            order.CustomerMobileNo = "4545454545";
            order.OrderedItem = "Crocin";
            order.OrderedQuantity = 895;
            order.SalesAgentName = "TS";

            ctx.Add(order);

            order = new OrderManager();
            order.OrderId = 7;
            order.CustomerName = "SRS Medicles";
            order.CustomerMobileNo = "1122334455";
            order.OrderedItem = "Rosyday";
            order.OrderedQuantity = 7800;
            order.SalesAgentName = "MS";

            ctx.Add(order);

            order = new OrderManager();
            order.OrderId = 7;
            order.CustomerName = "MRT Healthcare";
            order.CustomerMobileNo = "2121212112";
            order.OrderedItem = "Crocin";
            order.OrderedQuantity = 950;
            order.SalesAgentName = "MS";

            ctx.Add(order);

        }

        /// <summary>
        /// Get all orders
        /// </summary>
        /// <returns></returns>
        [Route("api/OrderManagerAPI")]
        public List<OrderManager> GetOrders()
        {
            return ctx.ToList();
        }

        /// <summary>
        /// Get Orders based on Criteria
        /// </summary>
        /// <param name="filter"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        [Route("api/OrderManagerAPI/{filter}/{value}")]
        public List<OrderManager> GetOrdersByCustName(string filter, string value)
        {
            List<OrderManager> Res = new List<OrderManager>();
            switch (filter)
            {
                case "CustomerName":
                    Res = (from c in ctx
                           where c.CustomerName.StartsWith(value)
                           select c).ToList();
                    break;
                case "MobileNo":
                    Res = (from c in ctx
                           where c.CustomerMobileNo.StartsWith(value)
                           select c).ToList();
                    break;
                case "SalesAgentName":
                    Res = (from c in ctx
                           where c.SalesAgentName.StartsWith(value)
                           select c).ToList();
                    break;
            }




            return Res;
        }

    }

    public partial class OrderManager
    {
        public int OrderId { get; set; }
        public string CustomerName { get; set; }
        public string CustomerMobileNo { get; set; }
        public string OrderedItem { get; set; }
        public int OrderedQuantity { get; set; }
        public string SalesAgentName { get; set; }
    }

}
