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
    }
}