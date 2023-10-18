import 'dart:convert';

import 'package:flutter/services.dart';

class JsonHelper {
  JsonHelper._();
  static final JsonHelper jsonHelper = JsonHelper._();

  Future<List> getPlanet() async {
    String data = await rootBundle.loadString('assets/json/planetdata.json');

    List allPlanets = jsonDecode(data);

    return allPlanets;
  }
}
