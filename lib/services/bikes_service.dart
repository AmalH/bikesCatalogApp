import 'dart:convert';
import 'package:bikestore/models/bike.dart';
import 'package:bikestore/utils/config.dart';
import 'package:http/http.dart' as http;

class BikesService {
  static Future<List<Bike>?> getBikes() async {
    var url = Uri.https(AppConfig.api, AppConfig.BikesList);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      try {
        var data = json.decode(response.body);
        var bikesJson = data["bikes"] as List<dynamic>;

        List<Bike>? BikesList =
            bikesJson.map<Bike>((json) => Bike.fromJson(json)).toList();
        return Future.value(BikesList);
      } on Exception catch (e) {
        return Future.error(e);
      }
    }
  }
}
