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
            Model = new OrderModel();
        }
    }
}