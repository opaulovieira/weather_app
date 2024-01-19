// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return _Current.fromJson(json);
}

/// @nodoc
mixin _$Current {
  @JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get sunrise => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get sunset => throw _privateConstructorUsedError;
  @JsonKey(name: 'temp')
  double get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<Forecast> get forecasts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentCopyWith<Current> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentCopyWith<$Res> {
  factory $CurrentCopyWith(Current value, $Res Function(Current) then) =
      _$CurrentCopyWithImpl<$Res, Current>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
      DateTime dateTime,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch) DateTime sunrise,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch) DateTime sunset,
      @JsonKey(name: 'temp') double temperature,
      @JsonKey(name: 'weather') List<Forecast> forecasts});
}

/// @nodoc
class _$CurrentCopyWithImpl<$Res, $Val extends Current>
    implements $CurrentCopyWith<$Res> {
  _$CurrentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? sunrise = null,
    Object? sunset = null,
    Object? temperature = null,
    Object? forecasts = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      forecasts: null == forecasts
          ? _value.forecasts
          : forecasts // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentImplCopyWith<$Res> implements $CurrentCopyWith<$Res> {
  factory _$$CurrentImplCopyWith(
          _$CurrentImpl value, $Res Function(_$CurrentImpl) then) =
      __$$CurrentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
      DateTime dateTime,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch) DateTime sunrise,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch) DateTime sunset,
      @JsonKey(name: 'temp') double temperature,
      @JsonKey(name: 'weather') List<Forecast> forecasts});
}

/// @nodoc
class __$$CurrentImplCopyWithImpl<$Res>
    extends _$CurrentCopyWithImpl<$Res, _$CurrentImpl>
    implements _$$CurrentImplCopyWith<$Res> {
  __$$CurrentImplCopyWithImpl(
      _$CurrentImpl _value, $Res Function(_$CurrentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? sunrise = null,
    Object? sunset = null,
    Object? temperature = null,
    Object? forecasts = null,
  }) {
    return _then(_$CurrentImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      forecasts: null == forecasts
          ? _value._forecasts
          : forecasts // ignore: cast_nullable_to_non_nullable
              as List<Forecast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentImpl implements _Current {
  const _$CurrentImpl(
      {@JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
      required this.dateTime,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
      required this.sunrise,
      @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
      required this.sunset,
      @JsonKey(name: 'temp') required this.temperature,
      @JsonKey(name: 'weather') required final List<Forecast> forecasts})
      : _forecasts = forecasts;

  factory _$CurrentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentImplFromJson(json);

  @override
  @JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
  final DateTime dateTime;
  @override
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  final DateTime sunrise;
  @override
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  final DateTime sunset;
  @override
  @JsonKey(name: 'temp')
  final double temperature;
  final List<Forecast> _forecasts;
  @override
  @JsonKey(name: 'weather')
  List<Forecast> get forecasts {
    if (_forecasts is EqualUnmodifiableListView) return _forecasts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forecasts);
  }

  @override
  String toString() {
    return 'Current(dateTime: $dateTime, sunrise: $sunrise, sunset: $sunset, temperature: $temperature, forecasts: $forecasts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            const DeepCollectionEquality()
                .equals(other._forecasts, _forecasts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, sunrise, sunset,
      temperature, const DeepCollectionEquality().hash(_forecasts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      __$$CurrentImplCopyWithImpl<_$CurrentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentImplToJson(
      this,
    );
  }
}

abstract class _Current implements Current {
  const factory _Current(
          {@JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
          required final DateTime dateTime,
          @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
          required final DateTime sunrise,
          @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
          required final DateTime sunset,
          @JsonKey(name: 'temp') required final double temperature,
          @JsonKey(name: 'weather') required final List<Forecast> forecasts}) =
      _$CurrentImpl;

  factory _Current.fromJson(Map<String, dynamic> json) = _$CurrentImpl.fromJson;

  @override
  @JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get dateTime;
  @override
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get sunrise;
  @override
  @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
  DateTime get sunset;
  @override
  @JsonKey(name: 'temp')
  double get temperature;
  @override
  @JsonKey(name: 'weather')
  List<Forecast> get forecasts;
  @override
  @JsonKey(ignore: true)
  _$$CurrentImplCopyWith<_$CurrentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
