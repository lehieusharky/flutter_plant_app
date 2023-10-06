import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final String weatherApiKey =
      dotenv.get('WEATHER_API_KEY', fallback: 'WEATHER_API_KEY_NOT_FOUND');
  static String weather({required String lat, required String lon}) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=443e4912d5a1af0c9968c42a412211ff';
}
