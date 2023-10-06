class WeatherModel {
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  int? dt;
  String? name;

  WeatherModel({
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.dt,
    this.name,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    dt = json['dt'];
    name = json['name'];
  }
}

class Weather {
  String? main;
  String? description;

  Weather({
    this.main,
    this.description,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
  }
}

class Main {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
}

class Wind {
  double? speed;

  Wind({this.speed});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
  }
}
