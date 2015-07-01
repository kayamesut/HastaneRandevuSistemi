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
    public partial class WebForm7 : System.Web.UI.Page
    {
        public OleDbConnection baglan()
        {
            string bag_str = WebConfigurationManager.ConnectionStrings["AppConnectionString2"].ConnectionString;
            OleDbConnection conn = new OleDbConnection(bag_str);
            return conn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection con = baglan();
            con.Open();
            OleDbCommand komut = new OleDbCommand("SELECT * FROM kisiler where tc='" + Session["kisi"] + "';", con);
            OleDbDataReader veriler = komut.ExecuteReader();
            veriler.Read();
            tc.Text = veriler["tc"].ToString();
            adSoyad.Text = veriler["adi"].ToString().ToUpper() +" "+ veriler["soyadi"].ToString().ToUpper();
            dogum.Text = veriler["dogumTarihi"].ToString().Substring(0,10);
            tel.Text = veriler["telefon"].ToString();
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                OleDbConnection con = baglan();
                con.Open();
                //Response.Write("açıldı");
                OleDbCommand komut = new OleDbCommand("select b.bolumAdi from bolumler as b ORDER BY bolumAdi", con);
                OleDbDataReader veriler = komut.ExecuteReader();

                bolumSec.DataSource = veriler;
                bolumSec.DataValueField = "bolumAdi";
                bolumSec.DataTextField = "bolumAdi";
                bolumSec.DataBind();
                con.Close();
                string gununTarihi = DateTime.Now.ToString();
                //Response.Write(gununTarihi);
            }
        }

        protected void randevuAra_Click(object sender, EventArgs e)
        {
            if (randevuTarihi.Text.Equals(""))
            {
                uyari.Text = "Önce Randevu Tarihi Seçiniz !!!";
            }
            else
            {
                uyari.Text = "";
                OleDbConnection con = baglan();
                con.Open();
                //Response.Write("açıldı");
                //string tarihGetir = randevuTarihi.Text;
                //string bolumGetir = bolumSec.SelectedItem.ToString();
                OleDbCommand komut = new OleDbCommand("select saat from saatler  s1 WHERE NOT EXISTS ("
                + " SELECT saatID FROM randevular r1 "
                + " WHERE s1.saatID = r1.saatID and randevuTarihi='" + randevuTarihi.Text.ToString() + "' and bolumID = (SELECT b1.bolumID from bolumler as b1 where b1.bolumAdi='" + bolumSec.SelectedItem.ToString() + "') );", con);
                OleDbDataReader veriler = komut.ExecuteReader();
                saatSec.DataSource = veriler;
                saatSec.DataValueField = "saat";
                saatSec.DataTextField = "saat";
                saatSec.DataBind();

                con.Close();
                Button2.Enabled = true;
            }
        }
        void Exit_Click(object nesne, EventArgs e)
        {
            Response.Redirect("girisEkrani.aspx");//ben değiştirdim normali alttaki
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            string bag_str = WebConfigurationManager.ConnectionStrings["AppConnectionString2"].ConnectionString;
            OleDbConnection con = new OleDbConnection(bag_str);
            con.Open();
            /////////////////////////////////////////ara
            OleDbCommand komutAra = new OleDbCommand("SELECT referansNo FROM kisiler where tc='" + Session["kisi"] + "';", con);
            OleDbDataReader veriler = komutAra.ExecuteReader();
            veriler.Read();
            string refNo = veriler["referansNo"].ToString();
            //Response.Write(refNo);
            ////////////////////////////////////////
            string secilenBolum = bolumSec.SelectedItem.ToString();
            string secilenSaat = saatSec.SelectedItem.ToString();
            string gununTarihi = DateTime.Now.ToString();
            OleDbCommand komut = new OleDbCommand("INSERT INTO randevular(kisiReferansno,saatID,randevuTarihi,randevuAlinmaTarihi,bolumID) SELECT '"+refNo+"',(SELECT s1.saatID from saatler as s1 where s1.saat='" + secilenSaat + "'), '" + randevuTarihi.Text.ToString() + "', '" + gununTarihi + "' ,b1.bolumID from bolumler as b1 where bolumAdi='" + secilenBolum + "';");
            komut.Connection = con;
            komut.ExecuteNonQuery();
            con.Close();
            bilgiler.Controls.Add(new LiteralControl("<br><br>"));
            bilgiler.Controls.Add(new LiteralControl("Sayın " + adSoyad.Text + " randevunuz başarıyla alınmıştır.<br><br>Randevu bilgileriniz :<br><br>"));
            bilgiler.Controls.Add(new LiteralControl("Randevu Alınan Bölüm : " + secilenBolum));

            bilgiler.Controls.Add(new LiteralControl("  <<<>>>  "));
            bilgiler.Controls.Add(new LiteralControl("Randevu Tarihiniz    : " + randevuTarihi.Text.ToString()));

            bilgiler.Controls.Add(new LiteralControl("  <<<>>>  "));
            bilgiler.Controls.Add(new LiteralControl("Randevu Saatiniz     : " + secilenSaat));
            bilgiler.Controls.Add(new LiteralControl("<br><br>"));

            Button2.Enabled = false;//tekrar yok
            saatSec.Items.Clear();
            randevuTarihi.Text = "";

            
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string bag_str = WebConfigurationManager.ConnectionStrings["AppConnectionString2"].ConnectionString;
            
            OleDbConnection con = new OleDbConnection(bag_str);
            con.Open();
            OleDbCommand varMiKisi = new OleDbCommand("SELECT referansNo FROM kisiler where tc='" + Session["kisi"] + "';", con);
            OleDbDataReader veriler = varMiKisi.ExecuteReader();
            veriler.Read();
            string refNo = veriler["referansNo"].ToString();
            //Response.Write(refNo);
            OleDbCommand kisiAra = new OleDbCommand("SELECT COUNT(*) AS sayi FROM randevular where kisiReferansNo=" + refNo + ";", con);
            OleDbDataReader Yeniveri = kisiAra.ExecuteReader();
            Yeniveri.Read();
            string RandevuSayisi = Yeniveri["sayi"].ToString();
            //Response.Write(RandevuSayisi);

            if (RandevuSayisi != "0")
            {
                OleDbDataAdapter da = new OleDbDataAdapter("SELECT R.randevuTarihi,S.saat,B.bolumAdi FROM (randevular R " +
                                                           "INNER JOIN bolumler B ON R.bolumID = B.bolumID) " +
                                                           "INNER JOIN saatler S ON R.saatID = S.saatID where R.kisiReferansno=" + refNo + " order by R.randevuTarihi asc;", bag_str);
                DataSet ds = new DataSet();
                da.Fill(ds, "randevular");
                GridView grd = new GridView();
                grd.Width = 800;
                grd.DataSource = ds;
                grd.DataBind();
                grd.HeaderRow.Cells[0].Text = "Randevu Tarihi";
                grd.HeaderRow.Cells[1].Text = "Randevu Saati";
                grd.HeaderRow.Cells[2].Text = "Bölüm Adı";
                grd.HorizontalAlign = HorizontalAlign.Center;
                gecmis.Controls.Add(grd);
            }
            else
            {
                Label l1 = new Label();
                l1.Text = "...Geçmiş Randevunuz Yok...";
                gecmis.Controls.Add(l1);
            }
        }
    }
}