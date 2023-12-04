import 'package:unwind_app/dto/period_dto.dart';
import 'package:unwind_app/model/activity.dart';
import 'package:unwind_app/model/place.dart';
import 'package:unwind_app/model/user.dart';
import 'package:unwind_app/model/weather.dart';

class Period {
  const Period({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
    required this.place,
    required this.participants,
    required this.activities,
    required this.weather,
  });

  final int id;
  final String name;
  final DateTime start;
  final DateTime end;
  final Place place;
  final List<User> participants;
  final List<Activity> activities;
  final List<Weather>? weather;

  factory Period.fromDTO(PeriodDTO dto) {
    return Period(
      id: dto.idHoliday,
      name: dto.name,
      start: dto.startDateTime,
      end: dto.endDateTime,
      place: Place.fromDTO(dto.place),
      participants: dto.participants.map(User.fromDTO).toList(),
      activities: dto.activities.map(Activity.fromDTO).toList(),
      weather: dto.weather?.map(Weather.fromDTO).toList(),
    );
  }
}
