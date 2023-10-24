import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final weatherDomain =
      dotenv.get('WEATHER_URL', fallback: 'WEATHER_URL_NOT_FOUND');

  static final plantDomain =
      dotenv.get('PLANT_URL', fallback: 'PLANT_URL_NOT_FOUND');

  static String weatherUrl = '$weatherDomain/data/2.5/weather';

  static String plantSpecialUrl = "$plantDomain/species-list";

  static String plantDiseaseUrl = "$plantDomain/species-list";
}
