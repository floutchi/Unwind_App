import 'package:unwind_app/dto/place_dto.dart';

class Place {
  const Place({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.country,
  });

  final String street;
  final int number;
  final String zipCode;
  final String city;
  final String country;

  factory Place.fromDTO(PlaceDTO dto) {
    late int num;
    try {
      num = int.parse(dto.num);
    } catch (_) {
      throw Exception("Invalid street number");
    }

    return Place(
      street: dto.street,
      number: num,
      zipCode: dto.zipCode,
      city: dto.city,
      country: dto.country,
    );
  }

  @override
  String toString() => "$street $number, $zipCode $city $country";
}
