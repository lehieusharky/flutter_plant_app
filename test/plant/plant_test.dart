import 'package:flutter_test/flutter_test.dart';
import 'package:plant_market/src/features/home/data/datasources/weather_datasource_impl.dart';
import 'package:plant_market/src/features/popular_topic/data/datasources/plant_datasource_impl.dart';

void main() {
  final datasource = PlantDataSourceImpl();
  final weatherdtc = WeatherDataSourceImpl();
  test(
    'Test plant',
    () async {
      final plantModel = await datasource.getListPlantSpecial(q: '');
      expect(plantModel.data![0].id, 1);
    },
  );

  test(
    'Test weather',
    () async {
      final weatherModel = await weatherdtc.getWeatherInfo(
        lon: '9.803031534783171',
        lat: '105.64087715674616',
      );
      expect(weatherModel.main!.temp, 20);
    },
  );
}
