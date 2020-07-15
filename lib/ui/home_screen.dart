import 'package:flutter/material.dart';
import 'package:flutter_tracking_covid/constant/color.dart';
import 'package:flutter_tracking_covid/store/countries_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  CountriesStore _countriesStore;

  @override
  Widget build(BuildContext context) {
    _countriesStore = Provider.of<CountriesStore>(context, listen: false);
    return _homeWidget(_countriesStore);
  }

  Widget _homeWidget(CountriesStore store) => Scaffold(
        body: Container(
          width: double.infinity,
          color: AppColor.colorConfirmedCases,
          child: FutureBuilder(
            future: store.fetchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("Countries"),
                          onPressed: () =>
                              Navigator.pushNamed(context, "countries"),
                        ),
                        RaisedButton(
                          child: Text("Report"),
                          onPressed: () {
                            Navigator.pushNamed(
                                context,
                                "detail/Reports/${_countriesStore.getReport.totalCases}/"
                                "${_countriesStore.getReport.totalActive}/"
                                "${_countriesStore.getReport.totalRecovered}/"
                                "${_countriesStore.getReport.totalDeaths}");
                          },
                        )
                      ],
                    );
                  }
                  break;
              }
              return Container();
            },
          ),
        ),
      );
}
