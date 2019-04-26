using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.ActivationSim
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SelectionList list = new SelectionList();
            SelectionList list2 = new SelectionList();

            Selection selection = new Selection();
            selection.Name.Add("465cde");
            selection.Name.Add("dawdqw2");
            selection.img = "../Images/Carriers/H2O Wireless_logo627.jpg";
            list.Add(selection);

            selection = new Selection();
            selection.Name.Add("cde");
            selection.Name.Add("4654646");
            selection.img = "../Images/Carriers/Lyca Mobile_logo489.png";
            list2.Add(selection);

            List<SelectionList> str = new List<SelectionList>();
            str.Add(list);
            str.Add(list2);
            repeater.DataSource = str;
            repeater.DataBind();

        }

        protected void DataBindings_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var selections = (SelectionList)e.Item.DataItem;
                var rb = (RadioButtonList)e.Item.FindControl("radios");
                var img = (Image)e.Item.FindControl("Image");
                foreach (Selection item in selections)
                {
                    img.ImageUrl = item.img;
                    foreach (var item2 in item.Name)
                        rb.Items.Add(item2);
                }
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            ActivateResultRpt.DataSource = CreateDataSource();
            // Bind the data to the control.
            ActivateResultRpt.DataBind();
            ActivateResultRpt.Visible = true;
        }

        public ICollection CreateDataSource()
        {


            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("ActivateDate", typeof(String)));
            dt.Columns.Add(new DataColumn("Carrier", typeof(String)));
            dt.Columns.Add(new DataColumn("SIMIMEI", typeof(String)));
            dt.Columns.Add(new DataColumn("PlanValue", typeof(String)));
            dt.Columns.Add(new DataColumn("PlanName", typeof(String)));
            dt.Columns.Add(new DataColumn("PhoneNumber", typeof(String)));

            DataRow dr = dt.NewRow();
            dr[0] = "White";
            dr[1] = "Silver";
            dr[2] = "DarkGray";
            dr[3] = "Khaki";
            dr[4] = "DarkKhaki";
            dt.Rows.Add(dr);

            DataView dv = new DataView(dt);
            return dv;

        }

    }

    public class Selection
    {
        private List<string> _name;
        private string _img;

        public Selection()
        {
            _name = new List<string>();
        }
        public string img
        {
            get { return _img; }
            set { _img = value; }
        }
        public List<string> Name
        {
            get { return _name; }
            set { _name = value; }
        }
    }

    public class SelectionList : List<Selection>
    {
        public SelectionList() { }
    }

}