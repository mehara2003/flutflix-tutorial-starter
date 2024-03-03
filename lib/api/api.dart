import 'dart:convert';

import 'package:MovieFlixer/constants.dart';
import 'package:MovieFlixer/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=${Constants.apiKey}';

  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=${Constants.apiKey}';

  static const _nowPlayingUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

  static const  _kidsUrl = 
      'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&sort_by=revenue.desc&adult=false&with_genres=16';

  static const _actionkidsUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&adult=false&with_genres=16,28';

  Future<List<Movie_list>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200){
       final decodedData = json.decode(response.body)['results'] as List;
       print (decodedData);
       return decodedData.map((movie) => Movie_list.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie_list>> getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200){
       final decodedData = json.decode(response.body)['results'] as List;
       print (decodedData);
       return decodedData.map((movie) => Movie_list.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie_list>> getUpcomingMovies() async{
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200){
       final decodedData = json.decode(response.body)['results'] as List;
       print (decodedData);
       return decodedData.map((movie) => Movie_list.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie_list>> getNowPlayingMovies() async{
  final response = await http.get(Uri.parse(_nowPlayingUrl));
  if (response.statusCode == 200){
     final decodedData = json.decode(response.body)['results'] as List;
     print (decodedData);
     return decodedData.map((movie) => Movie_list.fromJson(movie)).toList();
  } else {
    throw Exception('Something happened');
  }
}

Future<List<Movie_list>> getkidsMovies() async{
  final response = await http.get(Uri.parse(_kidsUrl));
  if (response.statusCode == 200){
     final decodedData = json.decode(response.body)['results'] as List;
     print (decodedData);
     return decodedData.map((movie) => Movie_list.fromJson(movie)).toList();
  } else {
    throw Exception('Something happened');
  }
}

Future<List<Movie_list>> getActionKidsMovies() async{
  final response = await http.get(Uri.parse(_actionkidsUrl));
  if (response.statusCode == 200){
     final decodedData = json.decode(response.body)['results'] as List;
     print (decodedData);
     return decodedData.map((movie) => Movie_list.fromJson(movie)).toList();
  } else {
    throw Exception('Something happened');
  }
}
}