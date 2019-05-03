using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1.UserControls
{
    public partial class PlansDetail : System.Web.UI.UserControl
    {
        public List<PlanModel> model { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PlanDeailsRpt.DataSource = model;
            PlanDeailsRpt.DataBind();
        }
        protected void rptPortfolios_ItemDataBound(object sender,
                                           RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType
               != ListItemType.AlternatingItem)
                return;
            string uniqueForGroup = e.Item.Parent.UniqueID;
            RadioButton rdo = (RadioButton)e.Item.FindControl("rdoSelected");
            rdo.GroupName =  uniqueForGroup;
            string script =
               "SetUniqueRadioButton('" + uniqueForGroup + "',this)";
            rdo.Attributes.Add("onclick", script);

        }
    }
}