using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hastaneRandevuSistemi
{
    public partial class tasarim : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tarihGoster.Text = DateTime.Now.ToString().Substring(0,10);
        }
    }
}