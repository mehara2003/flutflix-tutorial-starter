import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:MovieFlixer/api/api.dart';
import 'package:MovieFlixer/models/movie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:MovieFlixer/constants.dart';
import 'dart:convert';


class search extends StatefulWidget {
  const search({super.key})

@override
  State<search> createState() => _searchState();

}

class _searchState extends State<search> {

  List <Map<String, dynamic>> searchResult = [];
  final TextEditingController searchText = TextEditingController();
  bool showlist = false;
  var val1;

  Future<void> Searchlistfunc(String val) async {
    var searchurl = 
        'https://api.themoviedb.org/3/search/multi?api_key=$apikey&query=$val1';
        
  }
  
  Widget build (BuildContext context) {}
   
}
