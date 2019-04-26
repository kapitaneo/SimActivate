using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Models;

namespace WebApplication1.ActivationSim
{
    public partial class CardDetail : System.Web.UI.Page
    {
        public string TempData { get; set; }

        public PaymentInfoModel Model { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            Model = new PaymentInfoModel();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Model.FirstName = FirstNameTxt.Text;
        }

        protected void ValidateChk_Click(object sender, EventArgs e)
        {

        }
    }
}