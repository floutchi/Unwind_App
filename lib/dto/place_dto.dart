import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:unwind_app/model/place.dart';

part 'place_dto.g.dart';

abstract class PlaceDTO implements Built<PlaceDTO, PlaceDTOBuilder> {
  static Serializer<PlaceDTO> get serializer => _$placeDTOSerializer;

  String get street;

  String get num;

  String get zipCode;

  String get city;

  String get country;

  PlaceDTO._();
  factory PlaceDTO([void Function(PlaceDTOBuilder) updates]) = _$PlaceDTO;
}

Map<String, dynamic> placeToDTO(Place place) {
  return {
    'street': place.street,
    'num': place.number.toString(),
    'zipCode': place.zipCode,
    'city': place.city,
    'country': place.country,
  };
}
