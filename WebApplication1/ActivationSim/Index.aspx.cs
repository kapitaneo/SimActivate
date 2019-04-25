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
            //List<string> list = new List<string>() { "1", "2", "3" };
            SelectionList list = new SelectionList();
            SelectionList list2 = new SelectionList();

            Selection selection = new Selection();
            selection.Name = "abc";
            selection.Choice = "1";
            list.Add(selection);
            list2.Add(selection);

            selection = new Selection();
            selection.Name = "cde";
            selection.Choice = "2";
            list.Add(selection);
            list2.Add(selection);

            List<SelectionList> str = new List<SelectionList>();
            str.Add(list);
            str.Add(list2);
            repeater.DataSource = str;
            repeater.DataBind();

            //AddContentToDivById(list);
        }

        //protected void AddContentToDivById(List<string> content)
        //{
        //    string sdasd = string.Empty;

        //    foreach (var item in content)
        //    {
        //        sdasd = sdasd + "<div class=\"col-md-3\"><div class=\"custom-panel\" style=\"border-color:#e57014\"><div class=\"carrier-content\"><label class=\"carrier-radio\"><input type=\"radio\" name=\"carriers\"/>" + item + "</label>";
        //    }
        //    this.dvCarriers.InnerHtml = sdasd;
        //}

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var selections = (SelectionList)e.Item.DataItem;
                var rb = (RadioButtonList)e.Item.FindControl("radios");
                foreach (Selection item in selections)
                {
                  rb.Items.Add(item.Name);
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
        private string _name;
        private string _choice;

        public string Choice
        {
            get { return _choice; }
            set { _choice = value; }
        }
        public string Name
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