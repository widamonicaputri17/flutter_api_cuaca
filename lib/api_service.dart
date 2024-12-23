import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String apiKey =
      '0be7346d8e994af71764b47041f42095'; // API Key OpenWeather Anda

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal mengambil data cuaca');
    }
  }
}

// api photos
// class ApiService {
//   Future<List<dynamic>> fetchPhotos() async {
//     SharedPreferences prefr = await SharedPreferences.getInstance();
//     String? cacheData = prefr.getString('photos');

//     if (cacheData != null) {
//       return json.decode(cacheData);
//     } else {
//       final response = await http
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
//       if (response.statusCode == 200) {
//         prefr.setString('photos', response.body);
//         return json.decode(response.body);
//       } else {
//         throw Exception('Gagal');
//       }
//     }
//   }

  // Api Post
  // Future<List<dynamic>> fetchPost() async {
  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw Exception('Gagal Syncron');
  //   }
  // }

