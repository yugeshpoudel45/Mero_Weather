import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : Forecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": current?.toJson(),
        "forecast": forecast?.toJson(),
      };
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json["last_updated_epoch"] ?? 0,
        lastUpdated: json["last_updated"] ?? "unavailable",
        tempC: json["temp_c"] ?? 0.0,
        tempF: json["temp_f"].toDouble() ?? 0,
        isDay: json["is_day"] ?? 0,
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"].toDouble() ?? 0,
        windKph: json["wind_kph"].toDouble() ?? 0,
        windDegree: json["wind_degree"] ?? 0,
        windDir: json["wind_dir"] ?? "",
        pressureMb: json["pressure_mb"] ?? 0,
        pressureIn: json["pressure_in"].toDouble() ?? 0,
        precipMm: json["precip_mm"] ?? 0,
        precipIn: json["precip_in"] ?? 0,
        humidity: json["humidity"] ?? 0,
        cloud: json["cloud"] ?? 0,
        feelslikeC: json["feelslike_c"] ?? 0,
        feelslikeF: json["feelslike_f"].toDouble() ?? 0,
        visKm: json["vis_km"] ?? 0,
        visMiles: json["vis_miles"] ?? 0,
        uv: json["uv"] ?? 0,
        gustMph: json["gust_mph"].toDouble() ?? 0,
        gustKph: json["gust_kph"].toDouble() ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "last_updated_epoch": lastUpdatedEpoch,
        "last_updated": lastUpdated,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "uv": uv,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
      };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"] ?? "unavailable",
        icon: json["icon"] ?? "unavailable",
        code: json["code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "text": textValues.reverse[text],
        "icon": iconValues.reverse[icon],
        "code": code,
      };
}

enum Icon {
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_116_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_143_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_116_PNG
}

final iconValues = EnumValues({
  "//cdn.weatherapi.com/weather/64x64/day/113.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/day/116.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_116_PNG,
  "//cdn.weatherapi.com/weather/64x64/day/143.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_143_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/113.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG,
  "//cdn.weatherapi.com/weather/64x64/night/116.png":
      Icon.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_116_PNG
});

enum Text { CLEAR, MIST, PARTLY_CLOUDY, SUNNY }

final textValues = EnumValues({
  "Clear ": Text.CLEAR,
  "Mist": Text.MIST,
  "Partly Cloudy ": Text.PARTLY_CLOUDY,
  "Sunny": Text.SUNNY
});

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: json["forecastday"] == null
            ? []
            : List<Forecastday>.from(
                json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": forecastday == null
            ? []
            : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
      };
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"] ?? 0,
        day: json["day"] == null ? null : Day.fromJson(json["day"]),
        astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
        hour: json["hour"] == null
            ? []
            : List<Hour>.from(json["hour"]!.map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_epoch": dateEpoch,
        "day": day?.toJson(),
        "astro": astro?.toJson(),
        "hour": hour == null
            ? []
            : List<dynamic>.from(hour!.map((x) => x.toJson())),
      };
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json["sunrise"] ?? "unavailable",
        sunset: json["sunset"] ?? "unavailable",
        moonrise: json["moonrise"] ?? "unavailable",
        moonset: json["moonset"] ?? "unavailable",
        moonPhase: json["moon_phase"] ?? "unavailable",
        moonIllumination: json["moon_illumination"] ?? 0,
        isMoonUp: json["is_moon_up"] ?? 0,
        isSunUp: json["is_sun_up"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "moon_illumination": moonIllumination,
        "is_moon_up": isMoonUp,
        "is_sun_up": isSunUp,
      };
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  double? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: json["maxtemp_c"]?.toDouble() ?? 0.0,
        maxtempF: json["maxtemp_f"]?.toDouble() ?? 0.0,
        mintempC: json["mintemp_c"]?.toDouble() ?? 0.0,
        mintempF: json["mintemp_f"]?.toDouble() ?? 0.0,
        avgtempC: json["avgtemp_c"]?.toDouble() ?? 0.0,
        avgtempF: json["avgtemp_f"]?.toDouble() ?? 0.0,
        maxwindMph: json["maxwind_mph"]?.toDouble() ?? 0.0,
        maxwindKph: json["maxwind_kph"]?.toDouble() ?? 0.0,
        totalprecipMm: json["totalprecip_mm"] ?? 0.0,
        totalprecipIn: json["totalprecip_in"] ?? 0,
        totalsnowCm: json["totalsnow_cm"] ?? 0,
        avgvisKm: json["avgvis_km"] ?? 0,
        avgvisMiles: json["avgvis_miles"] ?? 0,
        avghumidity: json["avghumidity"] ?? 0,
        dailyWillItRain: json["daily_will_it_rain"] ?? 0,
        dailyChanceOfRain: json["daily_chance_of_rain"] ?? 0,
        dailyWillItSnow: json["daily_will_it_snow"] ?? 0,
        dailyChanceOfSnow: json["daily_chance_of_snow"] ?? 0,
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        uv: json["uv"],
      );

  Map<String, dynamic> toJson() => {
        "maxtemp_c": maxtempC,
        "maxtemp_f": maxtempF,
        "mintemp_c": mintempC,
        "mintemp_f": mintempF,
        "avgtemp_c": avgtempC,
        "avgtemp_f": avgtempF,
        "maxwind_mph": maxwindMph,
        "maxwind_kph": maxwindKph,
        "totalprecip_mm": totalprecipMm,
        "totalprecip_in": totalprecipIn,
        "totalsnow_cm": totalsnowCm,
        "avgvis_km": avgvisKm,
        "avgvis_miles": avgvisMiles,
        "avghumidity": avghumidity,
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "daily_will_it_snow": dailyWillItSnow,
        "daily_chance_of_snow": dailyChanceOfSnow,
        "condition": condition?.toJson(),
        "uv": uv,
      };
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  double? snowCm;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;
  double? shortRad;
  double? diffRad;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
    this.shortRad,
    this.diffRad,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: json["time_epoch"] ?? 0,
        time: json["time"] ?? "unavailable",
        tempC: json["temp_c"]?.toDouble() ?? 0.0,
        tempF: json["temp_f"]?.toDouble() ?? 0.0,
        isDay: json["is_day"] ?? 0,
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        windMph: json["wind_mph"]?.toDouble() ?? 0.0,
        windKph: json["wind_kph"]?.toDouble() ?? 0.0,
        windDegree: json["wind_degree"] ?? 0,
        windDir: json["wind_dir"] ?? "unavailable",
        pressureMb: json["pressure_mb"] ?? 0,
        pressureIn: json["pressure_in"]?.toDouble() ?? 0.0,
        precipMm: json["precip_mm"] ?? 0,
        precipIn: json["precip_in"] ?? 0,
        snowCm: json["snow_cm"] ?? 0,
        humidity: json["humidity"] ?? 0,
        cloud: json["cloud"] ?? 0,
        feelslikeC: json["feelslike_c"]?.toDouble() ?? 0.0,
        feelslikeF: json["feelslike_f"]?.toDouble() ?? 0.0,
        windchillC: json["windchill_c"]?.toDouble() ?? 0.0,
        windchillF: json["windchill_f"]?.toDouble() ?? 0.0,
        heatindexC: json["heatindex_c"]?.toDouble() ?? 0.0,
        heatindexF: json["heatindex_f"]?.toDouble() ?? 0.0,
        dewpointC: json["dewpoint_c"]?.toDouble() ?? 0.0,
        dewpointF: json["dewpoint_f"]?.toDouble() ?? 0.0,
        willItRain: json["will_it_rain"] ?? 0,
        chanceOfRain: json["chance_of_rain"] ?? 0,
        willItSnow: json["will_it_snow"] ?? 0,
        chanceOfSnow: json["chance_of_snow"] ?? 0,
        visKm: json["vis_km"] ?? 0,
        visMiles: json["vis_miles"] ?? 0,
        gustMph: json["gust_mph"]?.toDouble() ?? 0.0,
        gustKph: json["gust_kph"]?.toDouble() ?? 0.0,
        uv: json["uv"] ?? 0,
        shortRad: json["short_rad"]?.toDouble() ?? 0.0,
        diffRad: json["diff_rad"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "time_epoch": timeEpoch,
        "time": time,
        "temp_c": tempC,
        "temp_f": tempF,
        "is_day": isDay,
        "condition": condition?.toJson(),
        "wind_mph": windMph,
        "wind_kph": windKph,
        "wind_degree": windDegree,
        "wind_dir": windDir,
        "pressure_mb": pressureMb,
        "pressure_in": pressureIn,
        "precip_mm": precipMm,
        "precip_in": precipIn,
        "snow_cm": snowCm,
        "humidity": humidity,
        "cloud": cloud,
        "feelslike_c": feelslikeC,
        "feelslike_f": feelslikeF,
        "windchill_c": windchillC,
        "windchill_f": windchillF,
        "heatindex_c": heatindexC,
        "heatindex_f": heatindexF,
        "dewpoint_c": dewpointC,
        "dewpoint_f": dewpointF,
        "will_it_rain": willItRain,
        "chance_of_rain": chanceOfRain,
        "will_it_snow": willItSnow,
        "chance_of_snow": chanceOfSnow,
        "vis_km": visKm,
        "vis_miles": visMiles,
        "gust_mph": gustMph,
        "gust_kph": gustKph,
        "uv": uv,
        "short_rad": shortRad,
        "diff_rad": diffRad,
      };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"] ?? "unavailable",
        region: json["region"] ?? "unavailable",
        country: json["country"] ?? "unavailable",
        lat: json["lat"].toDouble() ?? 0,
        lon: json["lon"].toDouble() ?? 0,
        tzId: json["tz_id"] ?? "unavailable",
        localtimeEpoch: json["localtime_epoch"] ?? 0,
        localtime: json["localtime"] ?? "unavailable",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
