<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Maps.admin" %>
<!DOCTYPE html>
<html>
<head>
    <title>admin.aspx</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #333;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input[type="text"] {
            width: 200px;
            padding: 5px;
        }
        input[type="submit"], input[type="button"] {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #45a049;
        }
        hr {
            border: 0;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }
        .form-container {
            width: 400px;
            margin: 0 auto;
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2 class="form-title">Madenler Tablosu Yönetimi</h2>

            <h3>Ekleme</h3>
            <label for="txtAdi">Adı:</label>
            <asp:TextBox ID="txtAdi" runat="server"></asp:TextBox>
            <br />
            <label for="txtKoordinatlar">Koordinatlar:</label>
            <asp:TextBox ID="txtKoordinatlar" runat="server"></asp:TextBox>
            <br />
            <label for="txtBilgi">Bilgi:</label>
            <asp:TextBox ID="txtBilgi" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnEkle" runat="server" Text="Ekle" OnClick="btnEkle_Click" />

            <hr />

            <h3>Silme</h3>
            <label for="ddlSil">Seç:</label>
            <asp:DropDownList ID="ddlSil" runat="server"></asp:DropDownList>
            <asp:Button ID="btnSil" runat="server" Text="Sil" OnClick="btnSil_Click" />

            <hr />

            <h3>Düzenleme</h3>
            <label for="ddlDuzenle">Seç:</label>
            <asp:DropDownList ID="ddlDuzenle" runat="server" OnSelectedIndexChanged="ddlDuzenle_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <br />
            <label for="txtDuzenleAdi">Adı:</label>
            <asp:TextBox ID="txtDuzenleAdi" runat="server"></asp:TextBox>
            <br />
            <label for="txtDuzenleKoordinatlar">Koordinatlar:</label>
            <asp:TextBox ID="txtDuzenleKoordinatlar" runat="server"></asp:TextBox>
            <br />
            <label for="txtDuzenleBilgi">Bilgi:</label>
            <asp:TextBox ID="txtDuzenleBilgi" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" OnClick="btnKaydet_Click" Enabled="false" />
        </div>
    </form>
</body>
</html>
