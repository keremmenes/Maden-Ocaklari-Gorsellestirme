<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iletisim.aspx.cs" Inherits="Maps.iletisim" %>

<main>
    <h2>Hoş Geldiniz</h2>
    <p>
        Dünyadaki farklı maden ocaklarını haritadan inceleyebilirsiniz. Bu platformda maden ocaklarına ait
        detaylı bilgileri, konumlarını ve diğer ilgili verileri bulabilirsiniz.
    </p>
    <p>
        Sisteme kayıt olmak için "Kayıt Ol" bölümünü kullanabilir veya giriş yapmak için "Giriş" bölümünden
        hesabınıza erişebilirsiniz. İletişim için aşağıdaki formu doldurabilirsiniz:
    </p>
    
    <form action="iletisim.aspx" method="POST">
        <label for="name">Adınız:</label><br>
        <input type="text" id="name" name="name" required><br>
        
        <label for="email">E-posta Adresiniz:</label><br>
        <input type="email" id="email" name="email" required><br>
        
        <label for="message">Mesajınız:</label><br>
        <textarea id="message" name="message" required></textarea><br>
        
        <input type="submit" value="Gönder">
    </form>
</main>
