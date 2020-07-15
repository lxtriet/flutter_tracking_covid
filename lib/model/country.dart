import 'country_info.dart';

class Country {
  String _country;
  CountryInfo _countryInfo;
  int _cases;
  int _todayCases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _active;
  int _critical;
  double _casesPerOneMillion;
  double _deathsPerOneMillion;
  int _updated;

  Country(
      {String country,
      CountryInfo countryInfo,
      int cases,
      int todayCases,
      int deaths,
      int todayDeaths,
      int recovered,
      int active,
      int critical,
      double casesPerOneMillion,
      double deathsPerOneMillion,
      int updated}) {
    this._country = country;
    this._countryInfo = countryInfo;
    this._cases = cases;
    this._todayCases = todayCases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
    this._deathsPerOneMillion = deathsPerOneMillion;
    this._updated = updated;
  }

  String get country => _country;

  set country(String country) => _country = country;

  CountryInfo get countryInfo => _countryInfo;

  set countryInfo(CountryInfo countryInfo) => _countryInfo = countryInfo;

  int get cases => _cases;

  set cases(int cases) => _cases = cases;

  int get todayCases => _todayCases;

  set todayCases(int todayCases) => _todayCases = todayCases;

  int get deaths => _deaths;

  set deaths(int deaths) => _deaths = deaths;

  int get todayDeaths => _todayDeaths;

  set todayDeaths(int todayDeaths) => _todayDeaths = todayDeaths;

  int get recovered => _recovered;

  set recovered(int recovered) => _recovered = recovered;

  int get active => _active;

  set active(int active) => _active = active;

  int get critical => _critical;

  set critical(int critical) => _critical = critical;

  double get casesPerOneMillion => _casesPerOneMillion;

  set casesPerOneMillion(double casesPerOneMillion) =>
      _casesPerOneMillion = casesPerOneMillion;

  double get deathsPerOneMillion => _deathsPerOneMillion;

  set deathsPerOneMillion(double deathsPerOneMillion) =>
      _deathsPerOneMillion = deathsPerOneMillion;

  int get updated => _updated;

  set updated(int updated) => _updated = updated;

  Country.fromJson(Map<String, dynamic> json) {
    _country = json['country'];
    _countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    _cases = json['cases'];
    _todayCases = json['todayCases'];
    _deaths = json['deaths'];
    _todayDeaths = json['todayDeaths'];
    _recovered = json['recovered'];
    _active = json['active'];
    _critical = json['critical'];
    if (json['casesPerOneMillion'] != null) {
      _casesPerOneMillion = json['casesPerOneMillion'].toDouble();
    }
    if (json['deathsPerOneMillion'] != null) {
      _deathsPerOneMillion = json['deathsPerOneMillion'].toDouble();
    }
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this._country;
    if (this._countryInfo != null) {
      data['countryInfo'] = this._countryInfo.toJson();
    }
    data['cases'] = this._cases;
    data['todayCases'] = this._todayCases;
    data['deaths'] = this._deaths;
    data['todayDeaths'] = this._todayDeaths;
    data['recovered'] = this._recovered;
    data['active'] = this._active;
    data['critical'] = this._critical;
    data['casesPerOneMillion'] = this._casesPerOneMillion;
    data['deathsPerOneMillion'] = this._deathsPerOneMillion;
    data['updated'] = this._updated;
    return data;
  }
}
