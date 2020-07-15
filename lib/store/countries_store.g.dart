// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CountriesStore on _CountriesStore, Store {
  Computed<ObservableList<Country>> _$countriesContentComputed;

  @override
  ObservableList<Country> get countriesContent =>
      (_$countriesContentComputed ??=
              Computed<ObservableList<Country>>(() => super.countriesContent))
          .value;
  Computed<Report> _$getReportComputed;

  @override
  Report get getReport =>
      (_$getReportComputed ??= Computed<Report>(() => super.getReport)).value;

  final _$countriesAtom = Atom(name: '_CountriesStore.countries');

  @override
  ObservableList<Country> get countries {
    _$countriesAtom.context.enforceReadPolicy(_$countriesAtom);
    _$countriesAtom.reportObserved();
    return super.countries;
  }

  @override
  set countries(ObservableList<Country> value) {
    _$countriesAtom.context.conditionallyRunInAction(() {
      super.countries = value;
      _$countriesAtom.reportChanged();
    }, _$countriesAtom, name: '${_$countriesAtom.name}_set');
  }

  final _$filterAtom = Atom(name: '_CountriesStore.filter');

  @override
  String get filter {
    _$filterAtom.context.enforceReadPolicy(_$filterAtom);
    _$filterAtom.reportObserved();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.context.conditionallyRunInAction(() {
      super.filter = value;
      _$filterAtom.reportChanged();
    }, _$filterAtom, name: '${_$filterAtom.name}_set');
  }

  final _$_CountriesStoreActionController =
      ActionController(name: '_CountriesStore');

  @override
  void search(String key) {
    final _$actionInfo = _$_CountriesStoreActionController.startAction();
    try {
      return super.search(key);
    } finally {
      _$_CountriesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'countries: ${countries.toString()},filter: ${filter.toString()},countriesContent: ${countriesContent.toString()},getReport: ${getReport.toString()}';
    return '{$string}';
  }
}
