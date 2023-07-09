<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Anasayfa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('mine.jpg');
            background-size: cover;
            background-position: center;
        }

        .container {
            max-width: 600px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: rgba(255, 255, 255, 0);
            border: 0px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
            text-align: center;
            font-size: 30px;
            color: #fff;
        }

        .mine-image {
            display: block;
            margin: 20px auto;
            max-width: 200px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            margin: 0 10px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .top-right {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        
        .top-right a {
            display: inline-block;
            margin-left: 10px;
            color: #666;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <a href="giris.aspx" class="btn">Giriş</a>
    <a href="kayit.aspx" class="btn">Kayıt Ol</a>
    <a href="iletisim.aspx" class="btn">İletişim</a>
    <div class="container">
        <h2 style="font-size: 40px; color: #fff;background-color: rgba(0, 123, 255, 0.7);">Maden Ocaklarına Haritadan Bakın</h2>
        <div class="button-container">
        </div>
        <div class="top-right">
       
        </div>
    </div>
</body>
</html>
