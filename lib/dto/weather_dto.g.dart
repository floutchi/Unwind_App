// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeatherDTO> _$weatherDTOSerializer = new _$WeatherDTOSerializer();

class _$WeatherDTOSerializer implements StructuredSerializer<WeatherDTO> {
  @override
  final Iterable<Type> types = const [WeatherDTO, _$WeatherDTO];
  @override
  final String wireName = 'WeatherDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeatherDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'temperature',
      serializers.serialize(object.temperature,
          specifiedType: const FullType(double)),
      'weatherDesc',
      serializers.serialize(object.weatherDesc,
          specifiedType: const FullType(String)),
      'date',
      serializers.serialize(object.date,
          specifiedType: const FullType(DateTime)),
      'iconId',
      serializers.serialize(object.iconId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  WeatherDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeatherDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'temperature':
          result.temperature = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'weatherDesc':
          result.weatherDesc = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'iconId':
          result.iconId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WeatherDTO extends WeatherDTO {
  @override
  final double temperature;
  @override
  final String weatherDesc;
  @override
  final DateTime date;
  @override
  final String iconId;

  factory _$WeatherDTO([void Function(WeatherDTOBuilder)? updates]) =>
      (new WeatherDTOBuilder()..update(updates))._build();

  _$WeatherDTO._(
      {required this.temperature,
      required this.weatherDesc,
      required this.date,
      required this.iconId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        temperature, r'WeatherDTO', 'temperature');
    BuiltValueNullFieldError.checkNotNull(
        weatherDesc, r'WeatherDTO', 'weatherDesc');
    BuiltValueNullFieldError.checkNotNull(date, r'WeatherDTO', 'date');
    BuiltValueNullFieldError.checkNotNull(iconId, r'WeatherDTO', 'iconId');
  }

  @override
  WeatherDTO rebuild(void Function(WeatherDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeatherDTOBuilder toBuilder() => new WeatherDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeatherDTO &&
        temperature == other.temperature &&
        weatherDesc == other.weatherDesc &&
        date == other.date &&
        iconId == other.iconId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, temperature.hashCode);
    _$hash = $jc(_$hash, weatherDesc.hashCode);
    _$hash = $jc(_$hash, date.hashCode);
    _$hash = $jc(_$hash, iconId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeatherDTO')
          ..add('temperature', temperature)
          ..add('weatherDesc', weatherDesc)
          ..add('date', date)
          ..add('iconId', iconId))
        .toString();
  }
}

class WeatherDTOBuilder implements Builder<WeatherDTO, WeatherDTOBuilder> {
  _$WeatherDTO? _$v;

  double? _temperature;
  double? get temperature => _$this._temperature;
  set temperature(double? temperature) => _$this._temperature = temperature;

  String? _weatherDesc;
  String? get weatherDesc => _$this._weatherDesc;
  set weatherDesc(String? weatherDesc) => _$this._weatherDesc = weatherDesc;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _iconId;
  String? get iconId => _$this._iconId;
  set iconId(String? iconId) => _$this._iconId = iconId;

  WeatherDTOBuilder();

  WeatherDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _temperature = $v.temperature;
      _weatherDesc = $v.weatherDesc;
      _date = $v.date;
      _iconId = $v.iconId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeatherDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeatherDTO;
  }

  @override
  void update(void Function(WeatherDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeatherDTO build() => _build();

  _$WeatherDTO _build() {
    final _$result = _$v ??
        new _$WeatherDTO._(
            temperature: BuiltValueNullFieldError.checkNotNull(
                temperature, r'WeatherDTO', 'temperature'),
            weatherDesc: BuiltValueNullFieldError.checkNotNull(
                weatherDesc, r'WeatherDTO', 'weatherDesc'),
            date: BuiltValueNullFieldError.checkNotNull(
                date, r'WeatherDTO', 'date'),
            iconId: BuiltValueNullFieldError.checkNotNull(
                iconId, r'WeatherDTO', 'iconId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
