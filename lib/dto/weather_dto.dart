import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather_dto.g.dart';

abstract class WeatherDTO implements Built<WeatherDTO, WeatherDTOBuilder> {
  static Serializer<WeatherDTO> get serializer => _$weatherDTOSerializer;

  double get temperature;

  String get weatherDesc;

  DateTime get date;

  String get iconId;

  WeatherDTO._();
  factory WeatherDTO([void Function(WeatherDTOBuilder) updates]) = _$WeatherDTO;
}
