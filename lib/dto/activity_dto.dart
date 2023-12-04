import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:unwind_app/dto/place_dto.dart';
import 'package:unwind_app/dto/serializers.dart';
import 'package:unwind_app/model/activity.dart';

part 'activity_dto.g.dart';

abstract class ActivityDTO implements Built<ActivityDTO, ActivityDTOBuilder> {
  static Serializer<ActivityDTO> get serializer => _$activityDTOSerializer;

  int get idActivity;

  String get name;

  DateTime? get startDateTime;

  DateTime? get endDateTime;

  PlaceDTO get place;

  ActivityDTO._();
  factory ActivityDTO([void Function(ActivityDTOBuilder) updates]) =
      _$ActivityDTO;
}

ActivityDTO parseActivity(String jsonString) {
  final parsed = jsonDecode(jsonString);
  final activity =
      standardSerializers.deserializeWith(ActivityDTO.serializer, parsed)!;
  return activity;
}

Map<String, dynamic> activityToDTO(Activity activity) {
  return {
    'name': activity.name,
    'startDateTime': activity.start?.toIso8601String(),
    'endDateTime': activity.end?.toIso8601String(),
    'place': placeToDTO(activity.place),
  };
}
