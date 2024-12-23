# WIDA MONICA PUTRI (362358302008)
# 2A TRPL
# 
![Screenshot 2024-12-23 195803](https://github.com/user-attachments/assets/3d75b17c-624b-4eb1-b070-3399f15250ea)
#
![Screenshot 2024-12-23 195824](https://github.com/user-attachments/assets/00daeee7-f746-40de-9e9c-2fa3c9a6e30b)
#
![Screenshot 2024-12-23 195840](https://github.com/user-attachments/assets/bf326147-5c12-465d-842b-f501a166dd25)
# 
Aplikasi cuaca yang saya buat dengan Flutter ini memanfaatkan API OpenWeather untuk menampilkan informasi cuaca berdasarkan nama kota yang dimasukkan oleh pengguna. 
#
Proses pertama adalah konfigurasi API dengan mendapatkan kunci API dari OpenWeather dan menggunakannya untuk mengambil data cuaca. Aplikasi ini memiliki dua bagian : 
## pertama, layanan yang bertanggung jawab untuk mengambil data dari API menggunakan HTTP request
## kedua, tampilan antarmuka yang memungkinkan pengguna memasukkan nama kota dan menampilkan hasilnya.
#
# Aplikasi ini memiliki beberapa fitur : 
## pencarian cuaca berdasarkan nama kota
## penanganan kesalahan jika nama kota salah
## manipulasi data cuaca yang diterima : seperti menampilkan suhu, kelembapan, tekanan, dan kecepatan angin. 
#
Desain aplikasi menggunakan tema warna hijau, baik untuk latar belakang, tombol, dan teks, yang memberikan nuansa segar dan konsisten. 
#
Tombol pencarian "Cari Cuaca" telah diubah menjadi memiliki teks putih dengan latar belakang hijau, dan warna teks untuk informasi cuaca juga disesuaikan dengan warna yang berbeda untuk setiap elemen. Selain itu, elemen UI seperti kolom untuk menampilkan nama kota juga telah disesuaikan dengan warna hijau gelap.
#
TextField untuk memasukkan nama kota memiliki warna label putih dan border hijau yang berubah menjadi lebih gelap saat fokus, sementara warna teks yang dimasukkan diubah menjadi warna hitam. 
# HASIL AKHIR :
#
![Screenshot 2024-12-23 203717](https://github.com/user-attachments/assets/1f4c046f-11e3-4c28-9035-2f974e3b44b2)
#
![Screenshot 2024-12-23 203734](https://github.com/user-attachments/assets/71b347e7-f260-4f3b-96f1-f2f62c042d4e)
#
bagian atas aplikasi memiliki warna latar belakang gradasi (gradient) yang diterapkan pada bar judul dengan tulisan "Weather App". Gradasi ini adalah perpaduan dua atau lebih warna yang bertransisi secara halus, memberikan tampilan estetis yang lebih menarik dibandingkan warna solid tunggal. Dalam kasus ini, gradasi dimulai dari warna biru muda di bagian kiri atas dan bertransisi menjadi hijau di bagian kanan bawah.efek gradasi ini diimplementasikan menggunakan widget Container yang dilengkapi properti BoxDecoration. Properti BoxDecoration memiliki atribut gradient, yang sering menggunakan LinearGradient untuk membuat gradasi linear.
#
disini saya menggunakan icon yang berfungsi untuk menggambarkan kondisi cuaca berdasarkan data yang diperoleh dari API.
Fungsi getWeatherIcon digunakan untuk memetakan kondisi cuaca ke ikon yang sesuai.
# Ikon yang digunakan di aplikasi ini antara lain:
## Matahari Cerah (Icons.wb_sunny): Digunakan ketika cuaca cerah atau "clear". Ikon matahari ini menggambarkan cuaca yang tidak berawan dan cerah.
## Awan (Icons.cloud): Digunakan ketika cuaca berawan ("clouds"). Ikon awan ini menunjukkan bahwa langit tertutup sebagian atau sepenuhnya oleh awan.
## Hujan (Icons.beach_access): Digunakan ketika cuaca hujan. Ikon ini menggambarkan cuaca yang sedang turun hujan, meskipun dalam kode ini menggunakan ikon yang lebih sering digunakan untuk menggambarkan pantai, seperti payung atau tempat berteduh.
## Salju (Icons.ac_unit): Digunakan ketika cuaca bersalju. Ikon ini menggambarkan kondisi cuaca salju dengan menggunakan simbol pendingin udara (AC).
## Jika kondisi cuaca tidak dikenal, aplikasi akan menampilkan ikon default, yaitu Icons.help_outline, yang menunjukkan adanya ketidakpastian atau kondisi cuaca yang tidak teridentifikasi.
