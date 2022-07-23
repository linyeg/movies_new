import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apikey = "56a1e33bde8a6f3f55d64cd9a6709e08"; 
  final String _baseURL = "api.themoviedb.org";
  final String _language = 'es-ES';

  List<dynamic> dataMovies = [];
  List<dynamic> dataPopular = [];
  List<dynamic> dataUpcoming = [];

  MoviesProvider(){
    getMovies();
    getPopular();
    getToprated();
    }

  getMovies() async {
    var url = Uri.https(_baseURL, '/3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': "1"});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      dataMovies = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getPopular() async {
    var url = Uri.https(_baseURL, '3/trending/movie/week',
        {'api_key': _apikey, 'language': _language, 'page': "1"});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      dataPopular = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  

    getToprated() async {
    var url = Uri.https(_baseURL, '/3/movie/top_rated',
        {'api_key': _apikey, 'language': _language, 'page': "1"});

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      dataUpcoming = jsonResponse["results"];
      notifyListeners();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
