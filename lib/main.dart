import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tracking_covid/router/routes.dart';
import 'package:flutter_tracking_covid/store/countries_store.dart';
import 'package:provider/provider.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(DevicePreview(
    builder: (_) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CountriesStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        initialRoute: "home",
        onGenerateRoute: FluroRouter.router.generator,
      ),
    );
  }
}


