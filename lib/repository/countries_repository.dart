
import 'package:flutter_tracking_covid/api/api_provider.dart';
import 'package:flutter_tracking_covid/model/country.dart';

class CountriesRepository {

  ApiProvider _apiProvider = ApiProvider();

  Future<List<Country>> get getCountries => _apiProvider.fetchDataCountries();
}