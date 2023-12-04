import 'package:unwind_app/dto/user_dto.dart';

class User {
  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final String firstName;
  final String lastName;
  final String email;

  factory User.fromDTO(UserDTO dto) {
    return User(
      firstName: dto.firstName,
      lastName: dto.lastName,
      email: dto.email,
    );
  }
}
