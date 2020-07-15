import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tracking_covid/ui/countries_screen.dart';
import 'package:flutter_tracking_covid/ui/detail_screen.dart';
import 'package:flutter_tracking_covid/ui/home_screen.dart';

class FluroRouter {
  static Router router = Router();

  static var _homeHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return HomeScreen();
  });

  static var _countriesHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return CountriesScreen();
  });

  static var _detailHandler =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return DetailScreen(
      params["title"][0],
      params["cases"][0],
      params["active"][0],
      params["recovered"][0],
      params["deaths"][0],
    );
  });

  static void setupRouter() {
    router.define("home", handler: _homeHandler);
    router.define("countries", handler: _countriesHandler);
    router.define("detail/:title/:cases/:active/:recovered/:deaths", handler: _detailHandler);
  }
}
