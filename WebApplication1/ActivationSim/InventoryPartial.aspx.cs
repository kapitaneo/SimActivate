using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1.ActivationSim
{
    public partial class InventoryPartial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Model = new FundedItemModel() { PlanId = 1, Status="dasda", CarrierServiceName= "port-in", ActivationDate="11.12.12", IsLycaPortIn=true, IsFundingRequird=true, CarrierName="asdasd"};

            List<FundedItemModel> list = new List<FundedItemModel>() { Model };
            Repeater.DataSource = list;
            Repeater.DataBind();

            if (Model.CarrierServiceName.ToLower().Contains("port-in") && !Model.IsLycaPortIn)
            {
                Panel pan;
                foreach (RepeaterItem item in Repeater.Items)
                {
                    pan = item.FindControl("portIn") as Panel;
                    pan.Visible = true;
                }
            }
            else if (Model.CarrierServiceName.ToLower().Contains("port-in") && Model.IsLycaPortIn && Model.IsFundingRequird == false)
            {
                Panel pan;
                foreach (RepeaterItem item in Repeater.Items)
                {
                    pan = item.FindControl("portInIsLyca") as Panel;
                    pan.Visible = true;
                }
            }
        }
        public FundedItemModel Model { get; set; }
    }
}