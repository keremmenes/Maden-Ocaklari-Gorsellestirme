using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace Maps
{
    public partial class giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        

        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = txtKullaniciAdi.Text;
            string parola = txtParola.Text;

            // Veritabanı bağlantı dizesi
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            // Kullanıcı adı ve parolayı doğrula
            bool dogrulandi = DogrulaKullanici(kullaniciAdi, parola, connectionString);

            if (dogrulandi)
            {
                Response.Redirect("harita.aspx"); // Giriş doğrulandı, harita sayfasına yönlendir
            }
            else
            {
                lblHata.Visible = true;
                lblHata.Text = "Geçersiz kullanıcı adı veya parola."; // Hata mesajı göster
            }
        }

        private bool DogrulaKullanici(string kullaniciAdi, string parola, string connectionString)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM [user] WHERE username = @Username AND password = @Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", kullaniciAdi);
                    command.Parameters.AddWithValue("@Password", parola);

                    int result = (int)command.ExecuteScalar();
                    return result > 0; // Kullanıcı adı ve parola doğrulandı mı?
                }
            }
        }

    }
}
   