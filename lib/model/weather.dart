import 'package:unwind_app/dto/weather_dto.dart';

class Weather {
  const Weather({
    required this.temperature,
    required this.description,
    required this.date,
    required this.iconId,
  });

  final int temperature;
  final String description;
  final DateTime date;
  final String iconId;

  factory Weather.fromDTO(WeatherDTO dto) {
    return Weather(
      temperature: dto.temperature.round(),
      description: dto.weatherDesc,
      date: dto.date,
      iconId: dto.iconId,
    );
  }

  String get iconURL => "http://openweathermap.org/img/wn/$iconId.png";
}
