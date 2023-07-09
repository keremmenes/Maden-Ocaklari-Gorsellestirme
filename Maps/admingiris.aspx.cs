using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace Maps
{
    public partial class admingiris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            // Veritabanı bağlantı dizesini web.config dosyasından al
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            // Veritabanı bağlantısını oluştur
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Admin tablosunda kullanıcı adı ve parolayı kontrol et
                string query = "SELECT COUNT(*) FROM admin WHERE username = @username AND password = @password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    int result = (int)cmd.ExecuteScalar();

                    if (result > 0)
                    {
                        // Kullanıcı adı ve parola doğruysa, giriş başarılı mesajını görüntüle
                        lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Giriş başarılı!";
                        Response.Redirect("admin.aspx");
                    }
                    else
                    {
                        // Kullanıcı adı ve parola yanlışsa, hata mesajını görüntüle
                        lblMessage.Visible = true;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Kullanıcı adı veya parola yanlış!";
                    }
                }
            }
        }
    }
}


