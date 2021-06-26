import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class Data {
  Map data = {};
  List continent = [];
  List country = [];
  List lang = [];

  Future<void> readJson() async {
    var jsonText = await rootBundle.loadString('assets/data.json');
    data = await json.decode(jsonText);
  }

  Future<void> getContinents() async {
    await readJson();
    var continentsJson = data['continents'];
    await continentsJson.forEach((key, value) {
      continent.add(value);
    });
  }

  Future<void> getCountry() async {
    await readJson();
    var countriesJson = data["countries"];
    await countriesJson.forEach((key, value) {
      country.add(value);
    });
  }
}
