import 'package:mb_base_dt/models/country.model.dart';

class Data {
  static Country transformCountry(var data) {
    Country country = Country.fromJson(data);
    return country;
  }

  static List<Country> transformCountries(var data) {
    if (data == null) return [];
    var list = data as List;
    List<Country> countries =
        list.map<Country>((item) => transformCountry(item)).toList();
    return countries;
  }
}
