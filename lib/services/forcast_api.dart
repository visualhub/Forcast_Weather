import 'package:forcast_weather/model/forcast_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForcastApi {
  Future<ForcastModel?> forcastData(double lon, double lat) async {
    final responce = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=418d8a101f3f2242ff8bff1dbcfdfcb8"),
    );
    if (responce.statusCode == 200) {
      //print(responce.body);
      return ForcastModel.fromjason(jsonDecode(responce.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
