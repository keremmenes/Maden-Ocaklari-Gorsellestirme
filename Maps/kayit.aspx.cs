using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maps
{
    public partial class kayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnKayit_Click(object sender, EventArgs e)
        {
            // Veritabanı bağlantısı
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Bağlantıyı aç
                    connection.Open();

                    // Kullanıcı bilgilerini al
                    string email = txtEmail.Text;
                    string kullaniciAdi = txtKullaniciAdi.Text;
                    string parola = txtParola.Text;

                    // Kullanıcı adının veritabanında var olup olmadığını kontrol et
                    string selectQuery = "SELECT COUNT(*) FROM [user] WHERE username = @kullaniciAdi";
                    SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                    selectCommand.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                    int existingUserCount = (int)selectCommand.ExecuteScalar();

                    if (existingUserCount > 0)
                    {
                        lblHata.Text = "Bu kullanıcı adı zaten mevcut.";
                        lblHata.Visible = true;
                    }
                    else
                    {
                        // Yeni kullanıcıyı kaydet
                        string insertQuery = "INSERT INTO [user] (username, password) VALUES (@kullaniciAdi, @parola)";
                        SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
                        insertCommand.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                        insertCommand.Parameters.AddWithValue("@parola", parola);
                        insertCommand.ExecuteNonQuery();

                        // Kayıt başarılı olduğunda anasayfaya yönlendir
                        Response.Redirect("anasayfa.aspx");
                    }
                }
                catch (Exception ex)
                {
                    // Hata mesajını görüntüle
                    lblHata.Text = "Kayıt işlemi sırasında bir hata oluştu: " + ex.Message;
                    lblHata.Visible = true;
                }
            }
        }
    }
}
