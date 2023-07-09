<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="harita.aspx.cs" Inherits="Maps.harita" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Globalization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Google Maps API Örneği</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=<%= ConfigurationManager.AppSettings["GoogleMapsAPIKey"] %>"></script>
    <script type="text/javascript">
        var map;
        var markers = [];
        var allMarkers = [];

        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(40.7128, -74.0060), // İlk başta haritanın hangi konuma odaklanacağı
                zoom: 3, // Başlangıç yakınlaştırma seviyesi
                mapTypeId: google.maps.MapTypeId.ROADMAP, // Harita türü
                streetViewControl: false, // Sokak görünümü kontrolünü kapat
                zoomControl: true, // Yakınlaştırma kontrolünü göster
                zoomControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_TOP // Yakınlaştırma kontrolünün konumu
                },
                fullscreenControl: true, // Tam ekran kontrolünü göster
                fullscreenControlOptions: {
                    position: google.maps.ControlPosition.RIGHT_TOP // Tam ekran kontrolünün konumu
                }
            };

            map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

            // Madenler tablosundaki kayıtları çekmek için sunucu taraflı kod
            <%
                // Veritabanı bağlantı dizesi
                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

                // SQL sorgusu
                string query = "SELECT adi, koordinatlar,bilgi FROM madenler ORDER BY adi";

                // Veritabanı bağlantısını aç
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // SQL komutunu oluştur
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // SQL komutunu çalıştır ve verileri oku
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Konumları haritaya eklemek için döngü
                            int markerIndex = 0;
                            while (reader.Read())
                            {
                                string name = reader["adi"].ToString();
                                string coordinates = reader["koordinatlar"].ToString();
                                string info = reader["bilgi"].ToString();





                                // Koordinatları ayır
                                string[] parts = coordinates.Split(',');

                                if (parts.Length == 2)
                                {
                                    double latitude = double.Parse(parts[0].Trim(), CultureInfo.InvariantCulture);
                                    double longitude = double.Parse(parts[1].Trim(), CultureInfo.InvariantCulture);

                                    // Konumu haritaya ekle
                                    %>
            var marker<%= markerIndex %> = new google.maps.Marker({
                position: { lat: <%= latitude.ToString("0.000000", CultureInfo.InvariantCulture) %>, lng: <%= longitude.ToString("0.000000", CultureInfo.InvariantCulture) %> },
                map: map,
                title: '<%= name %>', // Konumun üzerinde gösterilecek adı belirle
                icon: {
                    url: 'https://maps.google.com/mapfiles/ms/icons/red-dot.png', // İşaretçi ikonu
                    scaledSize: new google.maps.Size(30, 30) // İşaretçi ikonunun boyutu
                }
            });

            // İşaretçiye tıklanınca haritayı konuma odaklanacak şekilde ayarla
            marker<%= markerIndex %>.addListener("click", function () {
                var bilgi = '<%= info %>'; // "bilgi" değerini al

                // Bilgiyi haritanın altında göster
                var infoDiv = document.getElementById("infoDiv");
                infoDiv.innerHTML = bilgi;
                map.setCenter(marker<%= markerIndex %>.getPosition());

            });   



            // Tüm işaretçileri sakla
            allMarkers.push(marker<%= markerIndex %>);

                                    <%
                                    markerIndex++;
                                }
                            }
                        }
                    }
                }
            %>
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <style>
        #map-canvas {
            height: 600px;
            width: 100%;
        }
        #infoDiv {
            background-color: #f2f2f2;
            padding: 10px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            color: #333333;
            border: 2px solid #dddddd;
            border-radius: 4px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            white-space: pre-wrap;
        }
    </style>
    <!-- Diğer kodlar -->
</head>

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="map-canvas"></div>
        <div id="infoDiv"></div>
    </form>
</body>
</html>