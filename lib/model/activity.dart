import 'package:unwind_app/dto/activity_dto.dart';
import 'package:unwind_app/model/format_date.dart';
import 'package:unwind_app/model/place.dart';

class Activity {
  const Activity({
    required this.id,
    required this.name,
    this.start,
    this.end,
    required this.place,
  });

  final int id;
  final String name;
  final DateTime? start;
  final DateTime? end;
  final Place place;

  factory Activity.fromDTO(ActivityDTO dto) {
    return Activity(
      id: dto.idActivity,
      name: dto.name,
      start: dto.startDateTime,
      end: dto.endDateTime,
      place: Place.fromDTO(dto.place),
    );
  }

  @override
  String toString() =>
      "($id) $name starting from ${start?.dateTimeLocale() ?? "N/A"} to ${end?.dateTimeLocale() ?? "N/A"} at ${place.toString()}";
}
