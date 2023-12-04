import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:unwind_app/dto/activity_dto.dart';
import 'package:unwind_app/dto/place_dto.dart';
import 'package:unwind_app/dto/serializers.dart';
import 'package:unwind_app/dto/user_dto.dart';
import 'package:unwind_app/dto/weather_dto.dart';
import 'package:unwind_app/model/period.dart';

part 'period_dto.g.dart';

abstract class PeriodDTO implements Built<PeriodDTO, PeriodDTOBuilder> {
  static Serializer<PeriodDTO> get serializer => _$periodDTOSerializer;

  int get idHoliday;

  String get name;

  DateTime get startDateTime;

  DateTime get endDateTime;

  PlaceDTO get place;

  BuiltList<UserDTO> get participants;

  BuiltList<ActivityDTO> get activities;

  BuiltList<WeatherDTO>? get weather;

  PeriodDTO._();
  factory PeriodDTO([void Function(PeriodDTOBuilder) updates]) = _$PeriodDTO;
}

PeriodDTO _parsePeriod(dynamic json) {
  final period =
      standardSerializers.deserializeWith(PeriodDTO.serializer, json)!;
  return period;
}

PeriodDTO parsePeriod(String jsonString) {
  final parsed = jsonDecode(jsonString);
  return _parsePeriod(parsed);
}

List<PeriodDTO> parsePeriods(String jsonString) {
  final parsed = jsonDecode(jsonString) as List<dynamic>;
  final periods = parsed.map(_parsePeriod).toList();
  return periods;
}

Map<String, dynamic> periodToDTO(Period period) {
  return {
    'name': period.name,
    'startDateTime': period.start.toIso8601String(),
    'endDateTime': period.end.toIso8601String(),
    'place': placeToDTO(period.place),
  };
}
