import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:unwind_app/dto/serializers.dart';

part 'user_dto.g.dart';

abstract class UserDTO implements Built<UserDTO, UserDTOBuilder> {
  static Serializer<UserDTO> get serializer => _$userDTOSerializer;

  String get firstName;

  String get lastName;

  String get email;

  String? get token;

  UserDTO._();
  factory UserDTO([void Function(UserDTOBuilder) updates]) = _$UserDTO;
}

UserDTO parseUser(String jsonString) {
  final parsed = jsonDecode(jsonString);
  final user = standardSerializers.deserializeWith(UserDTO.serializer, parsed)!;
  return user;
}
