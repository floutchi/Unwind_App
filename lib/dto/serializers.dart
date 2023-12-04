library serializers;

import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:unwind_app/dto/activity_dto.dart';
import 'package:unwind_app/dto/period_dto.dart';
import 'package:unwind_app/dto/place_dto.dart';
import 'package:unwind_app/dto/user_dto.dart';
import 'package:unwind_app/dto/weather_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  UserDTO,
  PeriodDTO,
  PlaceDTO,
  ActivityDTO,
  WeatherDTO,
])
final Serializers serializers = _$serializers;

final standardSerializers = (serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
