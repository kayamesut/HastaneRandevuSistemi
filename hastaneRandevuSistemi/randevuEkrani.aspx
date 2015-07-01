
<%@ Page Title="" Language="C#" MasterPageFile="~/tasarim.Master" AutoEventWireup="true" CodeBehind="randevuEkrani.aspx.cs" Inherits="hastaneRandevuSistemi.WebForm7" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type = "text/javascript" >
    function disableBackButton() {
        window.history.forward();
        FormsAuthentication.SignOut();
        Roles.DeleteCookie();
    }
    setTimeout("disableBackButton()", 0);
    function kapat() {
        history.go(-2);
        window.open('Default.aspx?login=off', '_self');
    }
    </script>
    <table width="100%" cellspacing="10px" bgcolor="#cee1f0">
    <tr>
        <td colspan="2" style="height:30px" align="center" bgcolor="#b6d2ea">
             <h1>
                 <span style="font-family:Impact; margin-left:20">&nbsp;&nbsp;&nbsp;</span>Randevu Sistemine Hoşgeldiniz
             </h1>
       </td>
    </tr>
    <tr>
        <td>
            <table bgcolor="#66ffff">
                <tr>
                    <td align="right">
                        <asp:Label ID="Label1" runat="server" Text="TC : " ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tc" runat="server" Enabled="false" Text="634253423"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label2" runat="server" Text="Adı Soyadı : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="adSoyad" runat="server" Enabled="false" Text="Mesut KAYA"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label3" runat="server" Text="Doğum Tarihi : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dogum" runat="server" Enabled="false" Text="29.03.1991"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label4" runat="server" Text="Telefon : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tel" runat="server" Enabled="false" Text="0212442322"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <asp:Button ID="Button1" runat="server" Text="Randevu Geçmişi" 
                            onclick="Button1_Click" />
                    </td>
                </tr>
                </table>
        </td>
        
        <td>
        <div align="right">
            <input id="geriDon" type="button" value="Güvenli Çıkış" onclick="kapat()"; 
                class="cikis" />
        </div>
        <asp:panel id="Panel1" runat="server" groupingtext="Randevu Seçiniz" >
            <table width="100%" >
                <tr>
                    <td align="right">
                        <asp:Label ID="Label5" runat="server" Text="Bölüm Seçiniz : "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="bolumSec" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label6" runat="server" Text="Randevu Tarihi Seçiniz : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="randevuTarihi" runat="server" ></asp:TextBox>
                        <asp:ScriptManager ID="ScriptManager1" runat="server" 
                            EnableScriptGlobalization="True">
                        </asp:ScriptManager>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                          PopupButtonID="randevuTarihi" TargetControlID="randevuTarihi" PopupPosition="Right" 
                          Format="dd.MM.yyyy" StartDate="1.1.2013" >
                        </ajaxToolkit:CalendarExtender>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                         TargetControlID="randevuTarihi" WatermarkText="...Seçiminiz...">
                        </ajaxToolkit:TextBoxWatermarkExtender>
                    </td>
                    <td>
                        <asp:Button ID="randevuAra" runat="server" Text="Randevu Ara" onclick="randevuAra_Click"/>
                    </td>
                    <td>
                        <asp:Label ID="uyari" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label7" runat="server" Text="Randevu Saati Seçiniz : "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="saatSec" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="right" style="height: 30px">
                        <asp:Button ID="Button2" runat="server" Text="ONAYLA" onclick="Button2_Click" Enabled="false"/>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td></td>
                    <td colspan="4">
                        <asp:PlaceHolder ID="PlaceHolder1" runat="server" > 
                            
                        </asp:PlaceHolder>
                    </td>
                </tr>
            </table>
            </asp:panel>
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="randevuBilgisi" runat="server" >
    <table width="100%">
        <tr>
            <td bgcolor="#cee1f5">
                <asp:PlaceHolder ID="bilgiler" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RandevuGecmisi" runat="server" >
    <table width="100%">
        <tr>
            <td bgcolor="#cee1f5" align="center">
                <asp:PlaceHolder ID="gecmis" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
    </table>
</asp:Content>