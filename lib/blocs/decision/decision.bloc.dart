import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mb_base_dt/models/country.model.dart';
import 'package:mb_base_dt/models/response.model.dart';

import 'package:mb_base_dt/api/common/common.repository.dart';

import 'package:mb_base_dt/helpers/data.helper.dart';
import 'package:mb_base_dt/helpers/constants.helper.dart';

import 'package:mb_base_dt/values/strings.dart' as strings;

String ctx = 'HTTP_REQUEST';

class DecisionBloc {
  CommonRepository repository = CommonRepository();

  final privateCountries = BehaviorSubject<List<Country>>();
  final privateCountry = BehaviorSubject<Country>();

  Function(Country) get changeCountry => privateCountry.sink.add;

  Stream<List<Country>> get countries => privateCountries.stream;
  Stream<Country> get country => privateCountry.stream;

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(strings.isFirstTime, false);
    privateCountries.value = Data.transformCountries(Constants.countries);
    privateCountry.value = privateCountries.value[prefs.getInt(strings.onbCountryIndex) ?? 0];
  }

  Future<void> listUsers() async {
    Response? response = await repository.listUsers();
    print('----');
    print(response!.data);
  }

  Future<void> saveCountrySelection(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(strings.onbCountryIndex, index);
    prefs.setString(
      strings.onbCountryPrefix,
      privateCountry.value.prefix ?? '',
    );
  }

  dispose() {
    privateCountries.close();
    privateCountry.close();
  }
}
