<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hata.aspx.cs" Inherits="hastaneRandevuSistemi.hata" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="refresh" content="3;URL=Default.aspx"/>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <table style="z-index:-1; margin-top:200px">
        <tr>
            <td align="center">
                <asp:Image ID="Image1" runat="server" src="siteResimleri\link.png"/>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" 
                    Text="Bir Hata Oluştu Giriş Sayfasına Yönlendiriliyorsunuz !!!" 
                    Font-Names="Verdana"></asp:Label>
                <meta  content="3;url : Default.aspx"/>
            </td>
        </tr>
        </table>

    
    </div>
    </form>
</body>
</html>
