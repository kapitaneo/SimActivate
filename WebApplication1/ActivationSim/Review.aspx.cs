using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1.ActivationSim
{
    public partial class Review : System.Web.UI.Page
    {
        public OrderModel Model { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Model = new OrderModel() { AlreadyPaid = 1, CarrierName = "asd", CreditCardProcessingFee = 2, FirstMonthResidualAmount = 2, InstantSPIFF = 4, InventoryName = "sda",
                OrderList = new List<OrderModel>() { new OrderModel() {
                    AlreadyPaid = 1, CarrierName = "asd", CreditCardProcessingFee = 2, FirstMonthResidualAmount = 2, InstantSPIFF = 4, InventoryName = "sda",
                    PaymentRequired=3,
             PlanName="sd", Plans=4, RefillDiscount=3, SIMCost= 2
                } },
             PaymentRequired=3,
             PlanName="sd", Plans=4, RefillDiscount=3, SIMCost= 2};
        }
    }
}