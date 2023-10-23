import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final weatherUrl =
      dotenv.get('WEATHER_URL', fallback: 'WEATHER_URL_NOT_FOUND');
  static String weather({
    required String lat,
    required String lon,
    required String weatherApiKey,
  }) =>
      '$weatherUrl/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherApiKey';
}
