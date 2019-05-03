using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebApplication1.Models;
using WebApplication1.UserControls;

namespace WebApplication1.ActivationSim
{
    public partial class Plans : System.Web.UI.Page
    {
        CarrierModel model = new CarrierModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            CarrierPlanDetailRpt.DataSource = CreateDataSource();
            // Bind the data to the control.
            CarrierPlanDetailRpt.DataBind();
        }

        public ICollection CreateDataSource()
        {

            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("SIM", typeof(String)));
            dt.Columns.Add(new DataColumn("Image", typeof(String)));
            dt.Columns.Add(new DataColumn("Model", typeof(List<PlanModel>)));


            List<PlanModel> Model = new List<PlanModel>();
            List<PlanModel> Model2 = new List<PlanModel>();
            PlanModel firest = new PlanModel() {
                Name = "DarkGray",
                FirstMonthResidual= "DarkKhaki",
                FundingRequired= "Khaki",
                SIMCost="asd",
                 InstantSpiff="asdad",
                  RefillDiscount="sadfre",
                   Value="adsd"
            };
            PlanModel firest1 = new PlanModel()
            {
                Name = "DarkGray1",
                FirstMonthResidual = "DarkKhaki1",
                FundingRequired = "Khaki1",
                SIMCost = "asd1",
                InstantSpiff = "asdad1",
                RefillDiscount = "sadfre1",
                Value = "adsd1"
            };
            Model.Add(firest);
            Model.Add(firest1);

            PlanModel firest2 = new PlanModel()
            {
                Name = "DarkGray33",
                FirstMonthResidual = "DarkKhaki",
                FundingRequired = "Khaki",
                SIMCost = "asd",
                InstantSpiff = "asdad",
                RefillDiscount = "sadfre",
                Value = "adsd"
            };
            PlanModel firest13 = new PlanModel()
            {
                Name = "DarkGray124",
                FirstMonthResidual = "DarkKhaki1",
                FundingRequired = "Khaki1",
                SIMCost = "asd1",
                InstantSpiff = "asdad1",
                RefillDiscount = "sadfre1",
                Value = "adsd1"
            };

            Model2.Add(firest2);
            Model2.Add(firest13);
            for (int i = 0; i < 2; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = "White"+i;
                dr[1] = "Silver" + i;
                if(i == 0)
                    dr[2] = Model;
                else dr[2] = Model2;
                dt.Rows.Add(dr);
            }

            DataView dv = new DataView(dt);
            return dv;

        }

        protected void CarrierPlanDetailRpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.DataItem != null)
            {
                PlansDetail sampleControl = (PlansDetail)e.Item.FindControl("PlansdetailUC");
                var selections = (List<PlanModel>)(((DataRowView)(e.Item.DataItem)).Row.ItemArray)[2];

                sampleControl.model = selections;
            }
        }

        protected void HideShow_ServerClick(object sender, EventArgs e)
        {
            HtmlAnchor divId = (sender as HtmlAnchor);
            Control parent = divId.NamingContainer as Control;
            Panel pan = parent.FindControl("planInfo") as Panel;
            pan.CssClass = "hidePanel";
            //parent.Visible = !parent.Visible;
            //pan.Visible = !pan.Visible;
        }
    }

}