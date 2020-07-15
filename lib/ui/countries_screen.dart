import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tracking_covid/constant/color.dart';
import 'package:flutter_tracking_covid/constant/sizes.dart';
import 'package:flutter_tracking_covid/helper/debouncer.dart';
import 'package:flutter_tracking_covid/model/country.dart';
import 'package:flutter_tracking_covid/store/countries_store.dart';
import 'package:provider/provider.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final _controller = TextEditingController();
  CountriesStore _countriesStore;

  final _debouncer = Debouncer(milliseconds: 500);

  _filterCountries(String filter) {
    _countriesStore.search(filter);
  }

  @override
  Widget build(BuildContext context) {
    _countriesStore = Provider.of<CountriesStore>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[600], //change your color here
        ),
        title: Text("Countries", style: TextStyle(color: Colors.grey[600]),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dimens["x_large"],
            vertical: Sizes.dimens["large"]),
        child: Column(
          children: <Widget>[
            _buildSearchForm(),
            SizedBox(
              height: Sizes.dimens["large"],
            ),
            _buildListCountries()
          ],
        ),
      ),
    );
  }

  Widget _buildSearchForm() => TextFormField(
        style: TextStyle(color: Colors.black),
        controller: _controller,
        onChanged: (value) => _debouncer.run(() => _filterCountries(value)),
        decoration: InputDecoration(
          labelText: "Search",
          labelStyle: TextStyle(
              color: AppColor.colorBorderSearchBox,
              fontSize: Sizes.text_sizes["large"]),
          fillColor: Colors.black,
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Sizes.dimens["tiny"])),
            borderSide:
                BorderSide(color: AppColor.colorBorderSearchBox, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Sizes.dimens["tiny"])),
            borderSide:
                BorderSide(color: AppColor.colorBorderSearchBox, width: 2),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: AppColor.colorBorderSearchBox,
            ),
            onPressed: () => _filterCountries(_controller.text),
          ),
        ),
      );

  Widget _buildListCountries() {
    print("=====" + _countriesStore.countriesContent.length.toString());
    return Expanded(
      child: Observer(
          builder: (_) => _countriesStore.countriesContent.length == 0
              ? Center(
                  child: Text("No data found"),
                )
              : ListView.builder(
                  itemCount: _countriesStore.countriesContent.length,
                  itemBuilder: (_, index) {
                    return _buildItemCountry(
                        _countriesStore.countriesContent[index]);
                  })),
    );
  }

  Widget _buildItemCountry(Country item) => GestureDetector(
    onTap: () =>  Navigator.pushNamed(
        context,
        "detail/${item.country}/${item.cases}/"
            "${item.active}/"
            "${item.recovered}/"
            "${item.deaths}"),
    child: Card(
          elevation: 1,
          child: ListTile(
            leading: Icon(Icons.public),
            title: Text(item.country),
            trailing: Icon(
              Icons.open_in_new,
              color: AppColor.colorBorderSearchBox,
            ),
          ),
        ),
  );
}
