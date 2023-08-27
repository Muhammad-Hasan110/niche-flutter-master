import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_niche2/API/API.dart';
import 'package:login_niche2/DataModler/servicecard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetService {
  final _api = API();

  Future<List<Service>> getapidata(List<Service> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('token') ?? '';
    String url = "${_api.baseURL}service";
    var result = await http.get(Uri.parse(url), headers: {'Token': authToken});
    print(result.body);
    var data = jsonDecode(result.body.toString());

    if (result.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        list.add(Service.fromJson(index));
      }
      return list;
    } else {
      return list;
    }
  }
}

class GetOneService {
  final _api = API();

  Future<List<Service>> getapidata(List<Service> list, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('token') ?? '';
    String url = "${_api.baseURL}service/$id";
    var result = await http.get(Uri.parse(url), headers: {'Token': authToken});
    print("fetching service");
    print(result.body);
    print("fetched service");

    var data = jsonDecode(result.body.toString());

    if (result.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        list.add(Service.fromJson(index));
      }
      return list;
    } else {
      return list;
    }
  }
}
