using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
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
            //OrderListRpt.DataSource = CreateDataSource();
            //// Bind the data to the control.
            //OrderListRpt.DataBind();
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            OrderListRpt.DataSource = CreateDataSource();
            // Bind the data to the control.
            OrderListRpt.DataBind();
            OrderListRpt.Visible = true;
        }
        public ICollection CreateDataSource()
        {

            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("InventoryName", typeof(String)));
            dt.Columns.Add(new DataColumn("PlanName", typeof(String)));
            dt.Columns.Add(new DataColumn("Plans", typeof(String)));
            dt.Columns.Add(new DataColumn("InstantSPIFF", typeof(String)));
            dt.Columns.Add(new DataColumn("FirstMonthResidualAmount", typeof(String)));
            dt.Columns.Add(new DataColumn("RefillDiscount", typeof(String)));
            dt.Columns.Add(new DataColumn("SIMCost", typeof(String)));
            dt.Columns.Add(new DataColumn("PaymentRequired", typeof(String)));

            DataRow dr = dt.NewRow();
            dr[0] = "White";
            dr[1] = "Silver";
            dr[2] = "DarkGray";
            dr[3] = "Khaki";
            dr[4] = "DarkKhaki";
            dr[5] = "DarkKhaki";
            dr[6] = "DarkKhaki";
            dt.Rows.Add(dr);

            DataView dv = new DataView(dt);
            return dv;

        }
    }
}