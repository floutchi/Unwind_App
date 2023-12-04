// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PlaceDTO> _$placeDTOSerializer = new _$PlaceDTOSerializer();

class _$PlaceDTOSerializer implements StructuredSerializer<PlaceDTO> {
  @override
  final Iterable<Type> types = const [PlaceDTO, _$PlaceDTO];
  @override
  final String wireName = 'PlaceDTO';

  @override
  Iterable<Object?> serialize(Serializers serializers, PlaceDTO object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'street',
      serializers.serialize(object.street,
          specifiedType: const FullType(String)),
      'num',
      serializers.serialize(object.num, specifiedType: const FullType(String)),
      'zipCode',
      serializers.serialize(object.zipCode,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'country',
      serializers.serialize(object.country,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PlaceDTO deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PlaceDTOBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'street':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'num':
          result.num = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'zipCode':
          result.zipCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PlaceDTO extends PlaceDTO {
  @override
  final String street;
  @override
  final String num;
  @override
  final String zipCode;
  @override
  final String city;
  @override
  final String country;

  factory _$PlaceDTO([void Function(PlaceDTOBuilder)? updates]) =>
      (new PlaceDTOBuilder()..update(updates))._build();

  _$PlaceDTO._(
      {required this.street,
      required this.num,
      required this.zipCode,
      required this.city,
      required this.country})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(street, r'PlaceDTO', 'street');
    BuiltValueNullFieldError.checkNotNull(num, r'PlaceDTO', 'num');
    BuiltValueNullFieldError.checkNotNull(zipCode, r'PlaceDTO', 'zipCode');
    BuiltValueNullFieldError.checkNotNull(city, r'PlaceDTO', 'city');
    BuiltValueNullFieldError.checkNotNull(country, r'PlaceDTO', 'country');
  }

  @override
  PlaceDTO rebuild(void Function(PlaceDTOBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PlaceDTOBuilder toBuilder() => new PlaceDTOBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PlaceDTO &&
        street == other.street &&
        num == other.num &&
        zipCode == other.zipCode &&
        city == other.city &&
        country == other.country;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, street.hashCode);
    _$hash = $jc(_$hash, num.hashCode);
    _$hash = $jc(_$hash, zipCode.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, country.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PlaceDTO')
          ..add('street', street)
          ..add('num', num)
          ..add('zipCode', zipCode)
          ..add('city', city)
          ..add('country', country))
        .toString();
  }
}

class PlaceDTOBuilder implements Builder<PlaceDTO, PlaceDTOBuilder> {
  _$PlaceDTO? _$v;

  String? _street;
  String? get street => _$this._street;
  set street(String? street) => _$this._street = street;

  String? _num;
  String? get num => _$this._num;
  set num(String? num) => _$this._num = num;

  String? _zipCode;
  String? get zipCode => _$this._zipCode;
  set zipCode(String? zipCode) => _$this._zipCode = zipCode;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  PlaceDTOBuilder();

  PlaceDTOBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _street = $v.street;
      _num = $v.num;
      _zipCode = $v.zipCode;
      _city = $v.city;
      _country = $v.country;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PlaceDTO other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PlaceDTO;
  }

  @override
  void update(void Function(PlaceDTOBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PlaceDTO build() => _build();

  _$PlaceDTO _build() {
    final _$result = _$v ??
        new _$PlaceDTO._(
            street: BuiltValueNullFieldError.checkNotNull(
                street, r'PlaceDTO', 'street'),
            num: BuiltValueNullFieldError.checkNotNull(num, r'PlaceDTO', 'num'),
            zipCode: BuiltValueNullFieldError.checkNotNull(
                zipCode, r'PlaceDTO', 'zipCode'),
            city: BuiltValueNullFieldError.checkNotNull(
                city, r'PlaceDTO', 'city'),
            country: BuiltValueNullFieldError.checkNotNull(
                country, r'PlaceDTO', 'country'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
