// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivityDTO> _$activityDTOSerializer = new _$ActivityDTOSerializer();

class _$ActivityDTOSerializer implements StructuredSerializer<ActivityDTO> {
  @override
  final Iterable<Type> types = const [ActivityDTO, _$ActivityDTO];
  @override
  final String wireName = 'ActivityDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, ActivityDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'idActivity',
      serializers.serialize(object.idActivity,
          specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'place',
      serializers.serialize(object.place,
          specifiedType: const FullType(PlaceDTO)),
    ];
    Object? value;
    value = object.startDateTime;
    if (value != null) {
      result
        ..add('startDateTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDateTime;
    if (value != null) {
      result
        ..add('endDateTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  ActivityDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'idActivity':
          result.idActivity = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'startDateTime':
          result.startDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'endDateTime':
          result.endDateTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'place':
          result.place.replace(serializers.deserialize(value,
              specifiedType: const FullType(PlaceDTO))! as PlaceDTO);
          break;
      }
    }

    return result.build();
  }
}

class _$ActivityDTO extends ActivityDTO {
  @override
  final int idActivity;
  @override
  final String name;
  @override
  final DateTime? startDateTime;
  @override
  final DateTime? endDateTime;
  @override
  final PlaceDTO place;

  factory _$ActivityDTO([void Function(ActivityDTOBuilder)? updates]) =>
      (new ActivityDTOBuilder()..update(updates))._build();

  _$ActivityDTO._(
      {required this.idActivity,
      required this.name,
      this.startDateTime,
      this.endDateTime,
      required this.place})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        idActivity, r'ActivityDTO', 'idActivity');
    BuiltValueNullFieldError.checkNotNull(name, r'ActivityDTO', 'name');
    BuiltValueNullFieldError.checkNotNull(place, r'ActivityDTO', 'place');
  }

  @override
  ActivityDTO rebuild(void Function(ActivityDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityDTOBuilder toBuilder() => new ActivityDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityDTO &&
        idActivity == other.idActivity &&
        name == other.name &&
        startDateTime == other.startDateTime &&
        endDateTime == other.endDateTime &&
        place == other.place;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, idActivity.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, startDateTime.hashCode);
    _$hash = $jc(_$hash, endDateTime.hashCode);
    _$hash = $jc(_$hash, place.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivityDTO')
          ..add('idActivity', idActivity)
          ..add('name', name)
          ..add('startDateTime', startDateTime)
          ..add('endDateTime', endDateTime)
          ..add('place', place))
        .toString();
  }
}

class ActivityDTOBuilder implements Builder<ActivityDTO, ActivityDTOBuilder> {
  _$ActivityDTO? _$v;

  int? _idActivity;
  int? get idActivity => _$this._idActivity;
  set idActivity(int? idActivity) => _$this._idActivity = idActivity;

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

  ActivityDTOBuilder();

  ActivityDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _idActivity = $v.idActivity;
      _name = $v.name;
      _startDateTime = $v.startDateTime;
      _endDateTime = $v.endDateTime;
      _place = $v.place.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActivityDTO;
  }

  @override
  void update(void Function(ActivityDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivityDTO build() => _build();

  _$ActivityDTO _build() {
    _$ActivityDTO _$result;
    try {
      _$result = _$v ??
          new _$ActivityDTO._(
              idActivity: BuiltValueNullFieldError.checkNotNull(
                  idActivity, r'ActivityDTO', 'idActivity'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'ActivityDTO', 'name'),
              startDateTime: startDateTime,
              endDateTime: endDateTime,
              place: place.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'place';
        place.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ActivityDTO', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
