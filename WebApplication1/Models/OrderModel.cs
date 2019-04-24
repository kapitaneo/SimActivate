using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class OrderModel
    {
        public OrderModel()
        {
            PageControlList = new List<PageControlModel>();
            OrderList = new List<OrderModel>();
        }
        public string InventoryName { get; set; }
        public string PlanName { get; set; }
        public float Plans { get; set; }
        public float InstantSPIFF { get; set; }
        public float PaymentRequired { get; set; }
        public float FirstMonthResidualAmount { get; set; }
        public float RefillDiscount { get; set; }
        public float SIMCost { get; set; }
        public float AlreadyPaid { get; set; }
        public string CarrierName { get; set; }
        public float CreditCardProcessingFee { get; set; }
        public List<PageControlModel> PageControlList { get; set; }
        public List<OrderModel> OrderList { get; set; }
    }

}