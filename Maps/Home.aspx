<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Maps.Home" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ana Sayfa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            padding: 20px;
            color: #fff;
            text-align: center;
        }

        h1 {
            font-size: 32px;
            margin: 0;
        }

        nav {
            background-color: #f9f9f9;
            padding: 10px;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        nav ul li {
            margin: 0 10px;
        }

        nav ul li a {
            color: #333;
            text-decoration: none;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        footer {
            background-color: #333;
            padding: 10px;
            color: #fff;
            text-align: center;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Dünyadaki maden ocaklarına haritadan bakın</h1>
    </header>

    <nav>
        <ul>
            <li><a href="kayit.aspx">Kayıt Ol</a></li>
            <li><a href="giris.aspx">Giriş</a></li>
            <li><a href="iletisim.aspx">İletişim</a></li>
            <li><a href="admin.aspx">Admin</a></li>
        </ul>
    </nav>

    <main>
        <h2>Hoş Geldiniz</h2>
        <p>
            Dünyadaki farklı maden ocaklarını haritadan inceleyebilirsiniz. Bu platformda maden ocaklarına ait
            detaylı bilgileri, konumlarını ve diğer ilgili verileri bulabilirsiniz.
        </p>
        <p>
            Sisteme kayıt olmak için "Kayıt Ol" bölümünü kullanabilir veya giriş yapmak için "Giriş" bölümünden
            hesabınıza erişebilirsiniz. İletişim için "İletişim" bölümünü kullanabilir veya yönetici olarak giriş
            yapmak için "Admin" bölümünü kullanabilirsiniz.
        </p>
    </main>

    <footer>
                <p>Telif Hakkı &copy; 2023 - Maden Haritası</p>
    </footer>
</body>
</html>
