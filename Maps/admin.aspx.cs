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
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FillDropDownLists()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            // Madenler tablosundaki verileri dropdown listelere doldur
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT adi FROM madenler";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                // Silme dropdown listesini doldur
                SqlDataReader reader = command.ExecuteReader();
                ddlSil.DataSource = reader;
                ddlSil.DataTextField = "adi";
                ddlSil.DataValueField = "adi";
                ddlSil.DataBind();
                ddlSil.Items.Insert(0, new ListItem("-- Seçin --", ""));

                // Düzenleme dropdown listesini doldur
                reader.Close();
                reader = command.ExecuteReader();
                ddlDuzenle.DataSource = reader;
                ddlDuzenle.DataTextField = "adi";
                ddlDuzenle.DataValueField = "adi";
                ddlDuzenle.DataBind();
                ddlDuzenle.Items.Insert(0, new ListItem("-- Seçin --", ""));
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            string adi = txtAdi.Text;
            string koordinatlar = txtKoordinatlar.Text;
            string bilgi = txtBilgi.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO madenler (adi, koordinatlar, bilgi) VALUES (@adi, @koordinatlar, @bilgi)";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@adi", adi);
                command.Parameters.AddWithValue("@koordinatlar", koordinatlar);
                command.Parameters.AddWithValue("@bilgi", bilgi);
                connection.Open();
                command.ExecuteNonQuery();
            }

            // Ekleme işlemi tamamlandıktan sonra dropdown listeleri güncelle
            FillDropDownLists();

            // Ekleme alanlarını temizle
            txtAdi.Text = "";
            txtKoordinatlar.Text = "";
            txtBilgi.Text = "";
        }

        protected void btnSil_Click(object sender, EventArgs e)
        {
            string adi = ddlSil.SelectedValue;

            if (!string.IsNullOrEmpty(adi))

            {
                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM madenler WHERE adi = @adi";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@adi", adi);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                // Silme işlemi tamamlandıktan sonra dropdown listeleri güncelle
                FillDropDownLists();
            }
        }

        protected void ddlDuzenle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string adi = ddlDuzenle.SelectedValue;

            if (!string.IsNullOrEmpty(adi))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM madenler WHERE adi = @adi";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@adi", adi);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Seçilen madenin bilgilerini düzenleme alanlarına aktar
                        txtDuzenleAdi.Text = reader["adi"].ToString();
                        txtDuzenleKoordinatlar.Text = reader["koordinatlar"].ToString();
                        txtDuzenleBilgi.Text = reader["bilgi"].ToString();

                        // Kaydet düğmesini etkinleştir
                        btnKaydet.Enabled = true;
                    }

                    reader.Close();
                }
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string adi = ddlDuzenle.SelectedValue;
            string yeniAdi = txtDuzenleAdi.Text;
            string yeniKoordinatlar = txtDuzenleKoordinatlar.Text;
            string yeniBilgi = txtDuzenleBilgi.Text;


            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE madenler SET adi = @yeniAdi, koordinatlar = @yeniKoordinatlar, bilgi = @yeniBilgi WHERE adi = @adi";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@yeniAdi", yeniAdi);
                command.Parameters.AddWithValue("@yeniKoordinatlar", yeniKoordinatlar);
                command.Parameters.AddWithValue("@yeniBilgi", yeniBilgi);
                command.Parameters.AddWithValue("@adi", adi);
                connection.Open();
                command.ExecuteNonQuery();
            }

            // Düzenleme işlemi tamamlandıktan sonra dropdown listeleri güncelle
            FillDropDownLists();

            // Düzenleme alanlarını temizle
            txtDuzenleAdi.Text = "";
            txtDuzenleKoordinatlar.Text = "";
            txtDuzenleBilgi.Text = "";
            btnKaydet.Enabled = false;
        }
    }
}