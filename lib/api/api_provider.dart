import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tracking_covid/model/country.dart';

class ApiProvider {
  Dio _dio = Dio();

  Future<List<Country>> fetchDataCountries() async {
    Response response = await _dio.get("https://corona.lmao.ninja/v3/covid-19/countries");

    if (response.statusCode == 200) {
      final List rawData = jsonDecode(jsonEncode(response.data));
      List<Country> list = rawData.map((f) => Country.fromJson(f)).toList();
      return list;
    } else {
      return null;
    }
  }
}
