// class WeatherForecast {
//   final int hourlyTime;
//   final double hourlyTemp;
//   final String hourlyName;
//   final int dailyDate;
//   final double dailyTemp;
//   final String dailyName;

//   WeatherForecast({
//     required this.hourlyTime,
//     required this.hourlyTemp,
//     required this.hourlyName,
//     required this.dailyDate,
//     required this.dailyTemp,
//     required this.dailyName,
//   });

//   factory WeatherForecast.fromJson(Map<String, dynamic> json) {
//     return WeatherForecast(
//       hourlyTime: json['hourly']['dt'],
//       hourlyTemp: json['hourly']['temp'],
//       hourlyName: json['hourly']['weather']['main'],
//       dailyDate: json['daily']['dt'],
//       dailyTemp: json['daily']['temp']['day'],
//       dailyName: json['daily']['weather']['main'],
//     );
//   }
// }


// class WeatherForcast22 {
//   double? lat;
//   double? lon;
//   String? timezone;
//   int? timezoneOffset;
  
//   List<Hourly>? hourly;
//   List<Daily>? daily;

//   WeatherForcast22(
//       {this.lat,
//       this.lon,
//       this.timezone,
//       this.timezoneOffset,
     
//       this.hourly,
//       this.daily});

//   WeatherForcast22.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lon = json['lon'];
//     timezone = json['timezone'];
//     timezoneOffset = json['timezone_offset'];
   
//     if (json['hourly'] != null) {
//       hourly = <Hourly>[];
//       json['hourly'].forEach((v) {
//         hourly!.add(new Hourly.fromJson(v));
//       });
//     }
//     if (json['daily'] != null) {
//       daily = <Daily>[];
//       json['daily'].forEach((v) {
//         daily!.add(new Daily.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lon'] = this.lon;
//     data['timezone'] = this.timezone;
//     data['timezone_offset'] = this.timezoneOffset;
    
   
//     if (this.hourly != null) {
//       data['hourly'] = this.hourly!.map((v) => v.toJson()).toList();
//     }
//     if (this.daily != null) {
//       data['daily'] = this.daily!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }


// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;

//   Weather({this.id, this.main, this.description, this.icon});

//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['main'] = this.main;
//     data['description'] = this.description;
//     data['icon'] = this.icon;
//     return data;
//   }
// }



// class Hourly {
//   int? dt;
//   double? temp;
//   double? feelsLike;
//   int? pressure;
//   int? humidity;
//   double? dewPoint;
//   double? uvi;
//   int? clouds;
//   int? visibility;
//   double? windSpeed;
//   int? windDeg;
//   double? windGust;
//   List<Weather>? weather;
//   double? pop;
  

//   Hourly(
//       {this.dt,
//       this.temp,
//       this.feelsLike,
//       this.pressure,
//       this.humidity,
//       this.dewPoint,
//       this.uvi,
//       this.clouds,
//       this.visibility,
//       this.windSpeed,
//       this.windDeg,
//       this.windGust,
//       this.weather,
//       this.pop,
//      });

//   Hourly.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     dewPoint = json['dew_point'];
//     uvi = json['uvi'];
//     clouds = json['clouds'];
//     visibility = json['visibility'];
//     windSpeed = json['wind_speed'];
//     windDeg = json['wind_deg'];
//     windGust = json['wind_gust'];
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather!.add(new Weather.fromJson(v));
//       });
//     }
//     pop = json['pop'];
    
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     data['temp'] = this.temp;
//     data['feels_like'] = this.feelsLike;
//     data['pressure'] = this.pressure;
//     data['humidity'] = this.humidity;
//     data['dew_point'] = this.dewPoint;
//     data['uvi'] = this.uvi;
//     data['clouds'] = this.clouds;
//     data['visibility'] = this.visibility;
//     data['wind_speed'] = this.windSpeed;
//     data['wind_deg'] = this.windDeg;
//     data['wind_gust'] = this.windGust;
//     if (this.weather != null) {
//       data['weather'] = this.weather!.map((v) => v.toJson()).toList();
//     }
//     data['pop'] = this.pop;
    
//     return data;
//   }
// }



// class Daily {
//   int? dt;
//   int? sunrise;
//   int? sunset;
//   int? moonrise;
//   int? moonset;
//   double? moonPhase;
 
//   int? pressure;
//   int? humidity;
//   double? dewPoint;
//   double? windSpeed;
//   int? windDeg;
//   double? windGust;
//   List<Weather>? weather;
//   int? clouds;
//   double? pop;
//   double? uvi;
//   double? rain;

//   Daily(
//       {this.dt,
//       this.sunrise,
//       this.sunset,
//       this.moonrise,
//       this.moonset,
//       this.moonPhase,
      
//       this.pressure,
//       this.humidity,
//       this.dewPoint,
//       this.windSpeed,
//       this.windDeg,
//       this.windGust,
//       this.weather,
//       this.clouds,
//       this.pop,
//       this.uvi,
//       this.rain});

//   Daily.fromJson(Map<String, dynamic> json) {
//     dt = json['dt'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//     moonrise = json['moonrise'];
//     moonset = json['moonset'];
//     moonPhase = json['moon_phase'];
    
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     dewPoint = json['dew_point'];
//     windSpeed = json['wind_speed'];
//     windDeg = json['wind_deg'];
//     windGust = json['wind_gust'];
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather!.add(new Weather.fromJson(v));
//       });
//     }
//     clouds = json['clouds'];
//     pop = json['pop'];
//     uvi = json['uvi'];
//     rain = json['rain'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['dt'] = this.dt;
//     data['sunrise'] = this.sunrise;
//     data['sunset'] = this.sunset;
//     data['moonrise'] = this.moonrise;
//     data['moonset'] = this.moonset;
//     data['moon_phase'] = this.moonPhase;
    
//     data['pressure'] = this.pressure;
//     data['humidity'] = this.humidity;
//     data['dew_point'] = this.dewPoint;
//     data['wind_speed'] = this.windSpeed;
//     data['wind_deg'] = this.windDeg;
//     data['wind_gust'] = this.windGust;
//     if (this.weather != null) {
//       data['weather'] = this.weather!.map((v) => v.toJson()).toList();
//     }
//     data['clouds'] = this.clouds;
//     data['pop'] = this.pop;
//     data['uvi'] = this.uvi;
//     data['rain'] = this.rain;
//     return data;
//   }
// }

