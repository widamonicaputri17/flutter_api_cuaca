import 'package:flutter/material.dart';
import 'package:flutter_apk/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController cityController = TextEditingController();

  Map<String, dynamic>? weatherData;
  String? errorMessage;

  void fetchWeatherData() async {
    try {
      final data = await apiService.fetchWeather(cityController.text.trim());
      setState(() {
        weatherData = data;
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        weatherData = null;
        errorMessage = 'Gagal mengambil data cuaca. Periksa nama kota!';
      });
    }
  }

  // Fungsi untuk mendapatkan ikon berdasarkan kondisi cuaca
  IconData getWeatherIcon(String weatherCondition) {
    switch (weatherCondition.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny; // Matahari cerah
      case 'clouds':
        return Icons.cloud; // Awan
      case 'rain':
        return Icons.beach_access; // Hujan
      case 'snow':
        return Icons.ac_unit; // Salju
      default:
        return Icons.help_outline; // Default jika kondisi tidak dikenali
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.green,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.green[300]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'Banyuwangi',
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.green), // Mengubah warna border
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .green[800]!), // Mengubah warna border saat fokus
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green[600]!),
                ),
                labelStyle:
                    TextStyle(color: Colors.black), // Mengubah warna teks label
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: fetchWeatherData,
                child: Text('Cari Cuaca',
                    style: TextStyle(
                        color: Colors.white)), // warna teks menjadi putih
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                )),
            SizedBox(height: 20),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            if (weatherData != null)
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'Cuaca di ${weatherData!['name']}',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Menampilkan icon cuaca sesuai kondisi
                        Icon(
                          getWeatherIcon(weatherData!['weather'][0]['main']),
                          color: Colors.yellow[700],
                          size: 40,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Suhu: ${weatherData!['main']['temp']}°C',
                      style: TextStyle(fontSize: 20, color: Colors.purple[700]),
                    ),
                    Text(
                      'Kelembapan: ${weatherData!['main']['humidity']}%',
                      style: TextStyle(fontSize: 20, color: Colors.yellow[700]),
                    ),
                    Text(
                      'Tekanan: ${weatherData!['main']['pressure']} hPa',
                      style: TextStyle(fontSize: 20, color: Colors.red[700]),
                    ),
                    Text(
                      'Kecepatan Angin: ${weatherData!['wind']['speed']} m/s',
                      style: TextStyle(fontSize: 20, color: Colors.blue[700]),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}





// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Title Photos",
//       home: PhotoScreen(),
//     );
//   }
// }

// class PhotoScreen extends StatelessWidget {
//   final ApiService apiService = ApiService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Daftar Foto')),
//       body: FutureBuilder<List<dynamic>>(
//         future: apiService.fetchPhotos(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Image.network(
//                         snapshot.data![index]['thumbnailUrl'],
//                         fit: BoxFit.cover,
//                         height: 120,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           snapshot.data![index]['title'],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   final ApiService apiService = ApiService();

//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Api-Post')),
//         body: FutureBuilder<List<dynamic>>(
//             future: apiService.fetchPost(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(snapshot.data![index]['title']),
//                         subtitle: Text(snapshot.data![index]['body']),
//                       );
//                     });
//               }
//             }));
//   }
// }
