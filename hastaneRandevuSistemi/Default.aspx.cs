using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Web.Configuration;

namespace hastaneRandevuSistemi
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
           {
                Session["login"] = "off";
           }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            //benim login kodum
            /*string bag_str = WebConfigurationManager.ConnectionStrings["AppConnectionString2"].ConnectionString;
            OleDbConnection con = new OleDbConnection(bag_str);
            con.Open();
            string girisKontrol;
            OleDbCommand komut = new OleDbCommand("SELECT tc FROM kisiler where tc='"+txtTcKimlikNo.Text+"';", con);
            OleDbDataReader veriler = komut.ExecuteReader();
            veriler.Read();
            try
            {
                girisKontrol = veriler["tc"].ToString();
                Session["kisi"] = girisKontrol;
                Session["login"] = "on";
                Response.Redirect("randevuEkrani.aspx");
            }
            catch (Exception ex)
            {
                olumsuz.Text="Kayıt Bulunamadı...";
            }*/
        }
    }
}