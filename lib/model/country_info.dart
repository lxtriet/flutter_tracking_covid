class CountryInfo {
  int _iId;
  String _iso2;
  String _iso3;
  double _lat;
  double _long;
  String _flag;

  CountryInfo(
      {int iId,
        String iso2,
        String iso3,
        double lat,
        double long,
        String flag}) {
    this._iId = iId;
    this._iso2 = iso2;
    this._iso3 = iso3;
    this._lat = lat;
    this._long = long;
    this._flag = flag;
  }

  int get iId => _iId;
  set iId(int iId) => _iId = iId;
  String get iso2 => _iso2;
  set iso2(String iso2) => _iso2 = iso2;
  String get iso3 => _iso3;
  set iso3(String iso3) => _iso3 = iso3;
  double get lat => _lat;
  set lat(double lat) => _lat = lat;
  double get long => _long;
  set long(double long) => _long = long;
  String get flag => _flag;
  set flag(String flag) => _flag = flag;

  CountryInfo.fromJson(Map<String, dynamic> json) {
    _iId = json['_id'];
    _iso2 = json['iso2'];
    _iso3 = json['iso3'];
    if (json['lat'] != null) {
      _lat = json['lat'].toDouble();
    }
    if (json['long'] != null) {
      _long = json['long'].toDouble();
    }
    _flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._iId;
    data['iso2'] = this._iso2;
    data['iso3'] = this._iso3;
    data['lat'] = this._lat;
    data['long'] = this._long;
    data['flag'] = this._flag;
    return data;
  }
}