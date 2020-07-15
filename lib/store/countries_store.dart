import 'package:flutter_tracking_covid/model/country.dart';
import 'package:flutter_tracking_covid/model/report.dart';
import 'package:flutter_tracking_covid/repository/countries_repository.dart';
import 'package:mobx/mobx.dart';

part 'countries_store.g.dart';

class CountriesStore = _CountriesStore with _$CountriesStore;

abstract class _CountriesStore with Store {

  final _countriesRepository = CountriesRepository();

  @observable
  ObservableList<Country> countries;

  @observable
  String filter = "";

  @computed
  ObservableList<Country> get countriesContent =>
      ObservableList.of(countries.where((country) =>
      country.country.toString().toLowerCase().contains(filter.toLowerCase())));

  @computed
  Report get getReport{
    var report = Report();
    countries.forEach((country){
        report.totalCases += country.cases;
        report.totalActive += country.active;
        report.totalDeaths += country.deaths;
        report.totalRecovered += country.recovered;
    });
    return report;
  }

  @action
  void search(String key){
    filter = key;
  }

  Future fetchData() async {
    countries = ObservableList();
    var list = await _countriesRepository.getCountries;
    countries.addAll(list);
  }

}