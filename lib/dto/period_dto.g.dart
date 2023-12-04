// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PeriodDTO> _$periodDTOSerializer = new _$PeriodDTOSerializer();

class _$PeriodDTOSerializer implements StructuredSerializer<PeriodDTO> {
  @override
  final Iterable<Type> types = const [PeriodDTO, _$PeriodDTO];
  @override
  final String wireName = 'PeriodDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, PeriodDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'idHoliday',
      serializers.serialize(object.idHoliday,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'startDateTime',
      serializers.serialize(object.startDateTime,
          specifiedType: const FullType(DateTime)),
      'endDateTime',
      serializers.serialize(object.endDateTime,
          specifiedType: const FullType(DateTime)),
      'place',
      serializers.serialize(object.place,
          specifiedType: const FullType(PlaceDTO)),
      'participants',
      serializers.serialize(object.participants,
          specifiedType:
              const FullType(BuiltList, const [const FullType(UserDTO)])),
      'activities',
      serializers.serialize(object.activities,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ActivityDTO)])),
    ];
    Object? value;
    value = object.weather;
    if (value != null) {
      result
        ..add('weather')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(WeatherDTO)])));
    }
    return result;
  }

  @override
  PeriodDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PeriodDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idHoliday':
          result.idHoliday = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'startDateTime':
          result.startDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'endDateTime':
          result.endDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'place':
          result.place.replace(serializers.deserialize(value,
              specifiedType: const FullType(PlaceDTO))! as PlaceDTO);
          break;
        case 'participants':
          result.participants.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserDTO)]))!
              as BuiltList<Object?>);
          break;
        case 'activities':
          result.activities.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ActivityDTO)]))!
              as BuiltList<Object?>);
          break;
        case 'weather':
          result.weather.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(WeatherDTO)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PeriodDTO extends PeriodDTO {
  @override
  final int idHoliday;
  @override
  final String name;
  @override
  final DateTime startDateTime;
  @override
  final DateTime endDateTime;
  @override
  final PlaceDTO place;
  @override
  final BuiltList<UserDTO> participants;
  @override
  final BuiltList<ActivityDTO> activities;
  @override
  final BuiltList<WeatherDTO>? weather;

  factory _$PeriodDTO([void Function(PeriodDTOBuilder)? updates]) =>
      (new PeriodDTOBuilder()..update(updates))._build();

  _$PeriodDTO._(
      {required this.idHoliday,
      required this.name,
      required this.startDateTime,
      required this.endDateTime,
      required this.place,
      required this.participants,
      required this.activities,
      this.weather})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(idHoliday, r'PeriodDTO', 'idHoliday');
    BuiltValueNullFieldError.checkNotNull(name, r'PeriodDTO', 'name');
    BuiltValueNullFieldError.checkNotNull(
        startDateTime, r'PeriodDTO', 'startDateTime');
    BuiltValueNullFieldError.checkNotNull(
        endDateTime, r'PeriodDTO', 'endDateTime');
    BuiltValueNullFieldError.checkNotNull(place, r'PeriodDTO', 'place');
    BuiltValueNullFieldError.checkNotNull(
        participants, r'PeriodDTO', 'participants');
    BuiltValueNullFieldError.checkNotNull(
        activities, r'PeriodDTO', 'activities');
  }

  @override
  PeriodDTO rebuild(void Function(PeriodDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeriodDTOBuilder toBuilder() => new PeriodDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeriodDTO &&
        idHoliday == other.idHoliday &&
        name == other.name &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime &&
        place == other.place &&
        participants == other.participants &&
        activities == other.activities &&
        weather == other.weather;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idHoliday.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, startDateTime.hashCode);
    _$hash = $jc(_$hash, endDateTime.hashCode);
    _$hash = $jc(_$hash, place.hashCode);
    _$hash = $jc(_$hash, participants.hashCode);
    _$hash = $jc(_$hash, activities.hashCode);
    _$hash = $jc(_$hash, weather.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeriodDTO')
          ..add('idHoliday', idHoliday)
          ..add('name', name)
          ..add('startDateTime', startDateTime)
          ..add('endDateTime', endDateTime)
          ..add('place', place)
          ..add('participants', participants)
          ..add('activities', activities)
          ..add('weather', weather))
        .toString();
  }
}

class PeriodDTOBuilder implements Builder<PeriodDTO, PeriodDTOBuilder> {
  _$PeriodDTO? _$v;

  int? _idHoliday;
  int? get idHoliday => _$this._idHoliday;
  set idHoliday(int? idHoliday) => _$this._idHoliday = idHoliday;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _startDateTime;
  DateTime? get startDateTime => _$this._startDateTime;
  set startDateTime(DateTime? startDateTime) =>
      _$this._startDateTime = startDateTime;

  DateTime? _endDateTime;
  DateTime? get endDateTime => _$this._endDateTime;
  set endDateTime(DateTime? endDateTime) => _$this._endDateTime = endDateTime;

  PlaceDTOBuilder? _place;
  PlaceDTOBuilder get place => _$this._place ??= new PlaceDTOBuilder();
  set place(PlaceDTOBuilder? place) => _$this._place = place;

  ListBuilder<UserDTO>? _participants;
  ListBuilder<UserDTO> get participants =>
      _$this._participants ??= new ListBuilder<UserDTO>();
  set participants(ListBuilder<UserDTO>? participants) =>
      _$this._participants = participants;

  ListBuilder<ActivityDTO>? _activities;
  ListBuilder<ActivityDTO> get activities =>
      _$this._activities ??= new ListBuilder<ActivityDTO>();
  set activities(ListBuilder<ActivityDTO>? activities) =>
      _$this._activities = activities;

  ListBuilder<WeatherDTO>? _weather;
  ListBuilder<WeatherDTO> get weather =>
      _$this._weather ??= new ListBuilder<WeatherDTO>();
  set weather(ListBuilder<WeatherDTO>? weather) => _$this._weather = weather;

  PeriodDTOBuilder();

  PeriodDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idHoliday = $v.idHoliday;
      _name = $v.name;
      _startDateTime = $v.startDateTime;
      _endDateTime = $v.endDateTime;
      _place = $v.place.toBuilder();
      _participants = $v.participants.toBuilder();
      _activities = $v.activities.toBuilder();
      _weather = $v.weather?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeriodDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeriodDTO;
  }

  @override
  void update(void Function(PeriodDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeriodDTO build() => _build();

  _$PeriodDTO _build() {
    _$PeriodDTO _$result;
    try {
      _$result = _$v ??
          new _$PeriodDTO._(
              idHoliday: BuiltValueNullFieldError.checkNotNull(
                  idHoliday, r'PeriodDTO', 'idHoliday'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'PeriodDTO', 'name'),
              startDateTime: BuiltValueNullFieldError.checkNotNull(
                  startDateTime, r'PeriodDTO', 'startDateTime'),
              endDateTime: BuiltValueNullFieldError.checkNotNull(
                  endDateTime, r'PeriodDTO', 'endDateTime'),
              place: place.build(),
              participants: participants.build(),
              activities: activities.build(),
              weather: _weather?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'place';
        place.build();
        _$failedField = 'participants';
        participants.build();
        _$failedField = 'activities';
        activities.build();
        _$failedField = 'weather';
        _weather?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeriodDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
