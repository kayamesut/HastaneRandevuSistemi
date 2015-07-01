<%@ Page Title="" Language="C#" MasterPageFile="~/tasarim.Master" AutoEventWireup="true" CodeBehind="hasta-kayit.aspx.cs" Inherits="hastaneRandevuSistemi.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Panel id="Panel1" runat="server" groupingtext="Hasta Kayıt Formu" BackColor="#cee1f0">
    <table width="100%">
        <tr>
            <td align="right" width="40%">
                <asp:Label ID="ad" runat="server" Text="Adı :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ad1" runat="server" Width="200px" CssClass="textboxGiris"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
               <asp:Label ID="soyad" runat="server" Text="Soyadı :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="soyad1" runat="server" Width="200px" CssClass="textboxGiris" ></asp:TextBox>
            </td>
        </tr>
        <tr>
           <td align="right">
                <asp:Label ID="tc" runat="server" Text="TC :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tc1" runat="server" Width="200px" CssClass="textboxGiris"></asp:TextBox>
                <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                 TargetControlID="tc1" WatermarkText="11 haneli TC numaranızı giriniz">
                </ajaxToolkit:TextBoxWatermarkExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                     runat="server" ControlToValidate="tc1"
                     ErrorMessage="TC Kimlik No alanı boş geçilemez." 
                     ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" 
                     runat="server" ErrorMessage="TC Kimlik No 11 karakter olmalı."
                     ValidationExpression=".{11}" ControlToValidate="tc1" ForeColor="Red"
                     Width="300px">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="parola" runat="server" Text="Parola :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="parola1" runat="server" Width="200px" TextMode="Password" CssClass="textboxGiris"></asp:TextBox>
                <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server"
                                TargetControlID="parola1"
                                DisplayPosition="RightSide"
                                StrengthIndicatorType="Text"
                                PreferredPasswordLength="10"
                                PrefixText="Güvenlik : "
                                TextCssClass="passwd"
                                MinimumNumericCharacters="0"
                                MinimumSymbolCharacters="0"
                                RequiresUpperAndLowerCaseCharacters="false"
                                TextStrengthDescriptions="Çok Kolay;Zayıf;Normal;Güçlü;Mükemmel"
                                CalculationWeightings="50;15;15;20">
               </ajaxToolkit:PasswordStrength>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="email" runat="server" Text="E-mail :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="email1" runat="server" Width="200px" CssClass="textboxGiris"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="pasSoru" runat="server" Text="Güvenlik Sorusu :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="pasSoruSec" runat="server" Width="210px" CssClass="textboxGiris">
                    <asp:ListItem>Annenizin Doğum Yeri</asp:ListItem>
                    <asp:ListItem>İlk Hayvanınızın Adı</asp:ListItem>
                    <asp:ListItem>Dedenizin Mesleği</asp:ListItem>
                    <asp:ListItem>En Sevdiğiniz Öğretmen</asp:ListItem>
                    <asp:ListItem>En İyi Çocukluk Arkadaşınız</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="pasCevap" runat="server" Text="Cevabınız :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="pasCevap1" runat="server" Width="200px" CssClass="textboxGiris"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
               <asp:Label ID="cins" runat="server" Text="Cinsiyet :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="cins1" runat="server" Width="210px" CssClass="textboxGiris" >
                <asp:ListItem>Erkek</asp:ListItem>
                <asp:ListItem>Kadın</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
               <asp:Label ID="dogum" runat="server" Text="Doğum Tarihi :" Font-Bold="True"></asp:Label>
            </td>
            <td>
               <asp:TextBox ID="dogum1" runat="server" Width="200px" CssClass="textboxGiris"></asp:TextBox>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server"
                PopupButtonID="dogum1" TargetControlID="dogum1" PopupPosition="Right">
                </ajaxToolkit:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="kan" runat="server" Text="Kan Grubu :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DBkanGrubu" runat="server"  Width="210px" CssClass="textboxGiris">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="telefon" runat="server" Text="Telefon :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="telefon1" runat="server" Width="200px" CssClass="textboxGiris"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="adres" runat="server" Text="Adres :" Font-Bold="True"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="adres1" runat="server" TextMode="MultiLine" Height="50px" Width="250px" CssClass="textboxGiris"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            <asp:LinkButton ID="kayit" runat="server" OnClick="kayit_Click" style="text-decoration:none">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/siteResimleri/kaydet.png" BackColor="Transparent" />
                <asp:Label ID="Label2" runat="server" Text="KAYDET"></asp:Label>
            </asp:LinkButton>
            
           
            
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblSonuc" ForeColor="Red" Font-Bold="true" runat="server" Visible="false">Sonuçlar:</asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>
    
</asp:Content>