class Report {
  int _totalCases = 0;
  int _totalDeaths = 0;
  int _totalRecovered = 0;
  int _totalActive = 0;

  Report(
      {int totalCases, int totalDeaths, int totalRecovered, int totalActive}) {
    this._totalCases = totalCases == null ? 0 : totalCases;
    this._totalDeaths = totalDeaths == null ? 0 : totalDeaths;
    this._totalRecovered = totalRecovered == null ? 0 : totalRecovered;
    this._totalActive = totalActive == null ? 0 : totalActive;
  }

  int get totalCases => _totalCases;

  set totalCases(int totalCases) => _totalCases = totalCases;

  int get totalDeaths => _totalDeaths;

  set totalDeaths(int totalDeaths) => _totalDeaths = totalDeaths;

  int get totalRecovered => _totalRecovered;

  set totalRecovered(int totalRecovered) => _totalRecovered = totalRecovered;

  int get totalActive => _totalActive;

  set totalActive(int totalActive) => _totalActive = totalActive;

  Report.fromJson(Map<String, dynamic> json) {
    _totalCases = json['totalCases'];
    _totalDeaths = json['totalDeaths'];
    _totalRecovered = json['totalRecovered'];
    _totalActive = json['totalActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCases'] = this._totalCases;
    data['totalDeaths'] = this._totalDeaths;
    data['totalRecovered'] = this._totalRecovered;
    data['totalActive'] = this._totalActive;
    return data;
  }
}
