using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;

namespace hastaneRandevuSistemi
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public OleDbConnection baglan()
        {
            string bag_str = WebConfigurationManager.ConnectionStrings["AppConnectionString2"].ConnectionString;
            OleDbConnection conn = new OleDbConnection(bag_str);
            return conn;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            OleDbConnection conn = baglan();
            conn.Open();
            OleDbCommand komut = new OleDbCommand(" SELECT * FROM [kanGrublari]", conn);
            OleDbDataReader getir = komut.ExecuteReader();
            DBkanGrubu.DataSource = getir;
            DBkanGrubu.DataValueField = "kanGrubu";
            DBkanGrubu.DataTextField = "kanGrubu";
            DBkanGrubu.DataBind();
            conn.Close();
        }

        protected void kayit_Click(object sender, EventArgs e)
        {
            string kullanici_ismi = tc1.Text;
            string password = parola1.Text;
            string email = email1.Text;
            string passwordSorusu = pasSoruSec.SelectedValue;
            string passwordCevap = pasCevap1.Text;

            MembershipCreateStatus uye_olusturma_sonuc;

            Membership.CreateUser(kullanici_ismi, password, email, passwordSorusu, passwordCevap, true, out uye_olusturma_sonuc);
            lblSonuc.Visible = true;
            if (uye_olusturma_sonuc == MembershipCreateStatus.Success)
            {
                lblSonuc.Text = "Kullanıcı Başarıyla oluşturuldu. Randevu Ekranına Yönlendiriliyorsunuz";
                //parola işlemlerinden sonra kaydet
                OleDbConnection conn = baglan();
                conn.Open();
                OleDbCommand komut = new OleDbCommand("INSERT INTO kisiler"
                    + "(adi,soyadi,tc,cinsiyet,dogumTarihi,kanGrubu,telefon,adres)"
                    + " VALUES('" + ad1.Text + "','" + soyad1.Text + "','" + tc1.Text + "','" + cins1.SelectedIndex + "','" + dogum1.Text + "','" + DBkanGrubu.SelectedIndex + "','" + telefon1.Text + "','" + adres1.Text + "')", conn);
                komut.ExecuteNonQuery();
                conn.Close();
                Session["kisi"] = tc1.Text;
                //Response.Write("kayıt başarılı");
                HtmlMeta meta = new HtmlMeta();
                HtmlHead head = (HtmlHead)Page.Header;
                meta.HttpEquiv = "refresh";
                meta.Content = "3; url=randevuEkrani.aspx";
                head.Controls.Add(meta);
                //Response.Redirect("randevuEkrani.aspx");
                tc1.Text = null;
                parola1.Text = null;
                email1.Text = null;
                pasSoruSec.SelectedIndex = -1;
                pasCevap1.Text = null;
            }
            else if (uye_olusturma_sonuc == MembershipCreateStatus.InvalidPassword)
            {
                lblSonuc.Text = "Password formatı Yanlış. Lütfen yeni bir password girin.";
            }
            else if (uye_olusturma_sonuc == MembershipCreateStatus.InvalidEmail)
            {
                lblSonuc.Text = "email formatı Yanlış. Lütfen yeni bir email girin.";
            }
            else if (uye_olusturma_sonuc == MembershipCreateStatus.InvalidAnswer)
            {
                lblSonuc.Text = "password cevabı formatı yanlış. Lütfen yeni bir password cevabı girin.";
            }
            else if (uye_olusturma_sonuc == MembershipCreateStatus.DuplicateUserName)
            {
                lblSonuc.Text = "Kullanıcı ismi halihazırda sistemimize kayıtlı. Lütfen yeni bir Kullanıcı ismi girin.";
            }
            else if (uye_olusturma_sonuc == MembershipCreateStatus.DuplicateEmail)
            {
                lblSonuc.Text = "Bu email adresi kayıtlı . Lütfen yeni bir email girin.";
            }
            else
            {
                lblSonuc.Text = "Kullanıcı oluştururken bir hata meydana geldi. Yeni kullanıcı oluşturulamadı.";
            }
        }
    }
}