<%@ Page Title="" Language="C#" MasterPageFile="~/tasarim.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hastaneRandevuSistemi.WebForm6" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script runat="server">
    void Login_Click_btn(object sender, System.EventArgs e)
    {
        string kullanici_ismi = txtTcKimlikNo.Text;
        string password = parola.Text;
        if ((Membership.ValidateUser(kullanici_ismi, password)))
        {
            if (!((Request.QueryString["ReturnUrl"] == null)))
            {
                FormsAuthentication.RedirectFromLoginPage(kullanici_ismi, false);
            }
            else
            {
                FormsAuthentication.SetAuthCookie(kullanici_ismi, false);
                Session["kisi"] = txtTcKimlikNo.Text;
                Response.Redirect("randevuEkrani.aspx");
            }
        }
        else
        {
            olumsuz.Visible = true;
            olumsuz.Text = "Başarısız giriş. Bilgilerinizi kontrol edip tekrar deneyin.";
            if ((!(Membership.GetUser(kullanici_ismi) == null)))
            {
                if ((Membership.GetUser(kullanici_ismi).IsLockedOut == true))
                {
                    olumsuz.Text = olumsuz.Text + " <b>hesabın kilitlendi.</b>";
                }
            }
        }
    }

    void Page_Load(object sender, System.EventArgs e)
    {
        this.DataBind();
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <table width="100%">
    <tr align="center">
        <td>
            <asp:Panel id="Panel1" runat="server" groupingtext="" BackColor="#cee1f0">
                <table cellpadding="5px">
                    <tr>
                        <td colspan="2" style="height:30px" bgcolor="#ceeaf0">
                            <h1>
                                <span style="font-family:Impact; margin-left:20">&nbsp;&nbsp;&nbsp;</span>Hasta Giriş Ekranı</h1>
                        </td>
                    </tr>
                    
                    <tr bgcolor="#66ffff">
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="TC Kimlik Numaranızı Giriniz :" 
                                Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTcKimlikNo" runat="server" placeholder="...Sadece Rakam Giriniz..." CssClass="textboxGiris"></asp:TextBox>
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                                runat="server" Enabled="True"
                                FilterType="Numbers" TargetControlID="txtTcKimlikNo">
                            </asp:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                                runat="server" ControlToValidate="txtTcKimlikNo"
                                ErrorMessage="TC Kimlik No alanı boş geçilemez." 
                                ForeColor="Red">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                                runat="server" ErrorMessage="TC Kimlik No 11 karakter olmalı."
                                ValidationExpression=".{11}" ControlToValidate="txtTcKimlikNo" ForeColor="#800000" Font-Bold="true"
                                Width="300px">
                            </asp:RegularExpressionValidator><br />
                        </td>
                    </tr>
                   <tr bgcolor="#66ffff">
                        <td align="right">
                            <asp:Label ID="Label2" runat="server" Text="Parola :" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="parola" runat="server" TextMode="Password" CssClass="textboxGiris" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr bgcolor="#ceeaf0">
                        <td colspan="1">
                            <a href="hasta-kayit.aspx" target="_self"><asp:Image ID="Image1" runat="server" src="/siteResimleri/new.png"/></a>                                
                            &nbsp;</td>
                        <td>
                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                ImageUrl="/siteResimleri/giris.png" onclick="Login_Click_btn" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Label ID="olumsuz" runat="server" Font-Names="Verdana" ForeColor="Maroon" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:ValidationSummary ID="vds1" runat="server"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>

</asp:Content>
