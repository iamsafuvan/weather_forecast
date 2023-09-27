class Weather {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final String description;
  final String main;
  final String country;
  final String name;
  final int humidity;
  final num speed;

  Weather({
    required this.temp,
    required this.country,
    required this.name,
    required this.feelsLike,
    required this.low,
    required this.high,
    required this.humidity,
    required this.speed,
    required this.description,
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      country: json['sys']['country'],
      name: json['name'],
      low: json['main']['temp_min'],
      high: json['main']['temp_max'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      speed: json['wind']['speed'],
      humidity: json['main']['humidity'],
    );
  }
}
