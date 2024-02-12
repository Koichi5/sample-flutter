// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
mixin _$Weather {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get generationtimeMs => throw _privateConstructorUsedError;
  int? get utcOffsetSeconds => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  String get timezoneAbbreviation => throw _privateConstructorUsedError;
  double? get elevation => throw _privateConstructorUsedError;
  HourlyUnits get hourlyUnits => throw _privateConstructorUsedError;
  Hourly get hourly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res, Weather>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double generationtimeMs,
      int? utcOffsetSeconds,
      String timezone,
      String timezoneAbbreviation,
      double? elevation,
      HourlyUnits hourlyUnits,
      Hourly hourly});

  $HourlyUnitsCopyWith<$Res> get hourlyUnits;
  $HourlyCopyWith<$Res> get hourly;
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res, $Val extends Weather>
    implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? generationtimeMs = null,
    Object? utcOffsetSeconds = freezed,
    Object? timezone = null,
    Object? timezoneAbbreviation = null,
    Object? elevation = freezed,
    Object? hourlyUnits = null,
    Object? hourly = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      generationtimeMs: null == generationtimeMs
          ? _value.generationtimeMs
          : generationtimeMs // ignore: cast_nullable_to_non_nullable
              as double,
      utcOffsetSeconds: freezed == utcOffsetSeconds
          ? _value.utcOffsetSeconds
          : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      timezoneAbbreviation: null == timezoneAbbreviation
          ? _value.timezoneAbbreviation
          : timezoneAbbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      elevation: freezed == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyUnits: null == hourlyUnits
          ? _value.hourlyUnits
          : hourlyUnits // ignore: cast_nullable_to_non_nullable
              as HourlyUnits,
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as Hourly,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HourlyUnitsCopyWith<$Res> get hourlyUnits {
    return $HourlyUnitsCopyWith<$Res>(_value.hourlyUnits, (value) {
      return _then(_value.copyWith(hourlyUnits: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HourlyCopyWith<$Res> get hourly {
    return $HourlyCopyWith<$Res>(_value.hourly, (value) {
      return _then(_value.copyWith(hourly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherImplCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$$WeatherImplCopyWith(
          _$WeatherImpl value, $Res Function(_$WeatherImpl) then) =
      __$$WeatherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double generationtimeMs,
      int? utcOffsetSeconds,
      String timezone,
      String timezoneAbbreviation,
      double? elevation,
      HourlyUnits hourlyUnits,
      Hourly hourly});

  @override
  $HourlyUnitsCopyWith<$Res> get hourlyUnits;
  @override
  $HourlyCopyWith<$Res> get hourly;
}

/// @nodoc
class __$$WeatherImplCopyWithImpl<$Res>
    extends _$WeatherCopyWithImpl<$Res, _$WeatherImpl>
    implements _$$WeatherImplCopyWith<$Res> {
  __$$WeatherImplCopyWithImpl(
      _$WeatherImpl _value, $Res Function(_$WeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? generationtimeMs = null,
    Object? utcOffsetSeconds = freezed,
    Object? timezone = null,
    Object? timezoneAbbreviation = null,
    Object? elevation = freezed,
    Object? hourlyUnits = null,
    Object? hourly = null,
  }) {
    return _then(_$WeatherImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      generationtimeMs: null == generationtimeMs
          ? _value.generationtimeMs
          : generationtimeMs // ignore: cast_nullable_to_non_nullable
              as double,
      utcOffsetSeconds: freezed == utcOffsetSeconds
          ? _value.utcOffsetSeconds
          : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      timezoneAbbreviation: null == timezoneAbbreviation
          ? _value.timezoneAbbreviation
          : timezoneAbbreviation // ignore: cast_nullable_to_non_nullable
              as String,
      elevation: freezed == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double?,
      hourlyUnits: null == hourlyUnits
          ? _value.hourlyUnits
          : hourlyUnits // ignore: cast_nullable_to_non_nullable
              as HourlyUnits,
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as Hourly,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherImpl implements _Weather {
  _$WeatherImpl(
      {required this.latitude,
      required this.longitude,
      required this.generationtimeMs,
      required this.utcOffsetSeconds,
      required this.timezone,
      required this.timezoneAbbreviation,
      required this.elevation,
      required this.hourlyUnits,
      required this.hourly});

  factory _$WeatherImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double generationtimeMs;
  @override
  final int? utcOffsetSeconds;
  @override
  final String timezone;
  @override
  final String timezoneAbbreviation;
  @override
  final double? elevation;
  @override
  final HourlyUnits hourlyUnits;
  @override
  final Hourly hourly;

  @override
  String toString() {
    return 'Weather(latitude: $latitude, longitude: $longitude, generationtimeMs: $generationtimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbreviation: $timezoneAbbreviation, elevation: $elevation, hourlyUnits: $hourlyUnits, hourly: $hourly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.generationtimeMs, generationtimeMs) ||
                other.generationtimeMs == generationtimeMs) &&
            (identical(other.utcOffsetSeconds, utcOffsetSeconds) ||
                other.utcOffsetSeconds == utcOffsetSeconds) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.timezoneAbbreviation, timezoneAbbreviation) ||
                other.timezoneAbbreviation == timezoneAbbreviation) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.hourlyUnits, hourlyUnits) ||
                other.hourlyUnits == hourlyUnits) &&
            (identical(other.hourly, hourly) || other.hourly == hourly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      latitude,
      longitude,
      generationtimeMs,
      utcOffsetSeconds,
      timezone,
      timezoneAbbreviation,
      elevation,
      hourlyUnits,
      hourly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      __$$WeatherImplCopyWithImpl<_$WeatherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherImplToJson(
      this,
    );
  }
}

abstract class _Weather implements Weather {
  factory _Weather(
      {required final double latitude,
      required final double longitude,
      required final double generationtimeMs,
      required final int? utcOffsetSeconds,
      required final String timezone,
      required final String timezoneAbbreviation,
      required final double? elevation,
      required final HourlyUnits hourlyUnits,
      required final Hourly hourly}) = _$WeatherImpl;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$WeatherImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get generationtimeMs;
  @override
  int? get utcOffsetSeconds;
  @override
  String get timezone;
  @override
  String get timezoneAbbreviation;
  @override
  double? get elevation;
  @override
  HourlyUnits get hourlyUnits;
  @override
  Hourly get hourly;
  @override
  @JsonKey(ignore: true)
  _$$WeatherImplCopyWith<_$WeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return _Hourly.fromJson(json);
}

/// @nodoc
mixin _$Hourly {
  List<String> get time => throw _privateConstructorUsedError;
  List<double> get temperature_2m => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourlyCopyWith<Hourly> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyCopyWith<$Res> {
  factory $HourlyCopyWith(Hourly value, $Res Function(Hourly) then) =
      _$HourlyCopyWithImpl<$Res, Hourly>;
  @useResult
  $Res call({List<String> time, List<double> temperature_2m});
}

/// @nodoc
class _$HourlyCopyWithImpl<$Res, $Val extends Hourly>
    implements $HourlyCopyWith<$Res> {
  _$HourlyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature_2m = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>,
      temperature_2m: null == temperature_2m
          ? _value.temperature_2m
          : temperature_2m // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyImplCopyWith<$Res> implements $HourlyCopyWith<$Res> {
  factory _$$HourlyImplCopyWith(
          _$HourlyImpl value, $Res Function(_$HourlyImpl) then) =
      __$$HourlyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> time, List<double> temperature_2m});
}

/// @nodoc
class __$$HourlyImplCopyWithImpl<$Res>
    extends _$HourlyCopyWithImpl<$Res, _$HourlyImpl>
    implements _$$HourlyImplCopyWith<$Res> {
  __$$HourlyImplCopyWithImpl(
      _$HourlyImpl _value, $Res Function(_$HourlyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature_2m = null,
  }) {
    return _then(_$HourlyImpl(
      time: null == time
          ? _value._time
          : time // ignore: cast_nullable_to_non_nullable
              as List<String>,
      temperature_2m: null == temperature_2m
          ? _value._temperature_2m
          : temperature_2m // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyImpl implements _Hourly {
  _$HourlyImpl(
      {required final List<String> time,
      required final List<double> temperature_2m})
      : _time = time,
        _temperature_2m = temperature_2m;

  factory _$HourlyImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyImplFromJson(json);

  final List<String> _time;
  @override
  List<String> get time {
    if (_time is EqualUnmodifiableListView) return _time;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_time);
  }

  final List<double> _temperature_2m;
  @override
  List<double> get temperature_2m {
    if (_temperature_2m is EqualUnmodifiableListView) return _temperature_2m;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_temperature_2m);
  }

  @override
  String toString() {
    return 'Hourly(time: $time, temperature_2m: $temperature_2m)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyImpl &&
            const DeepCollectionEquality().equals(other._time, _time) &&
            const DeepCollectionEquality()
                .equals(other._temperature_2m, _temperature_2m));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_time),
      const DeepCollectionEquality().hash(_temperature_2m));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      __$$HourlyImplCopyWithImpl<_$HourlyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyImplToJson(
      this,
    );
  }
}

abstract class _Hourly implements Hourly {
  factory _Hourly(
      {required final List<String> time,
      required final List<double> temperature_2m}) = _$HourlyImpl;

  factory _Hourly.fromJson(Map<String, dynamic> json) = _$HourlyImpl.fromJson;

  @override
  List<String> get time;
  @override
  List<double> get temperature_2m;
  @override
  @JsonKey(ignore: true)
  _$$HourlyImplCopyWith<_$HourlyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) {
  return _HourlyUnits.fromJson(json);
}

/// @nodoc
mixin _$HourlyUnits {
  String get time => throw _privateConstructorUsedError;
  String get temperature_2m => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HourlyUnitsCopyWith<HourlyUnits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyUnitsCopyWith<$Res> {
  factory $HourlyUnitsCopyWith(
          HourlyUnits value, $Res Function(HourlyUnits) then) =
      _$HourlyUnitsCopyWithImpl<$Res, HourlyUnits>;
  @useResult
  $Res call({String time, String temperature_2m});
}

/// @nodoc
class _$HourlyUnitsCopyWithImpl<$Res, $Val extends HourlyUnits>
    implements $HourlyUnitsCopyWith<$Res> {
  _$HourlyUnitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature_2m = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature_2m: null == temperature_2m
          ? _value.temperature_2m
          : temperature_2m // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyUnitsImplCopyWith<$Res>
    implements $HourlyUnitsCopyWith<$Res> {
  factory _$$HourlyUnitsImplCopyWith(
          _$HourlyUnitsImpl value, $Res Function(_$HourlyUnitsImpl) then) =
      __$$HourlyUnitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, String temperature_2m});
}

/// @nodoc
class __$$HourlyUnitsImplCopyWithImpl<$Res>
    extends _$HourlyUnitsCopyWithImpl<$Res, _$HourlyUnitsImpl>
    implements _$$HourlyUnitsImplCopyWith<$Res> {
  __$$HourlyUnitsImplCopyWithImpl(
      _$HourlyUnitsImpl _value, $Res Function(_$HourlyUnitsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temperature_2m = null,
  }) {
    return _then(_$HourlyUnitsImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature_2m: null == temperature_2m
          ? _value.temperature_2m
          : temperature_2m // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HourlyUnitsImpl implements _HourlyUnits {
  _$HourlyUnitsImpl({required this.time, required this.temperature_2m});

  factory _$HourlyUnitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyUnitsImplFromJson(json);

  @override
  final String time;
  @override
  final String temperature_2m;

  @override
  String toString() {
    return 'HourlyUnits(time: $time, temperature_2m: $temperature_2m)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyUnitsImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature_2m, temperature_2m) ||
                other.temperature_2m == temperature_2m));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, temperature_2m);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyUnitsImplCopyWith<_$HourlyUnitsImpl> get copyWith =>
      __$$HourlyUnitsImplCopyWithImpl<_$HourlyUnitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyUnitsImplToJson(
      this,
    );
  }
}

abstract class _HourlyUnits implements HourlyUnits {
  factory _HourlyUnits(
      {required final String time,
      required final String temperature_2m}) = _$HourlyUnitsImpl;

  factory _HourlyUnits.fromJson(Map<String, dynamic> json) =
      _$HourlyUnitsImpl.fromJson;

  @override
  String get time;
  @override
  String get temperature_2m;
  @override
  @JsonKey(ignore: true)
  _$$HourlyUnitsImplCopyWith<_$HourlyUnitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
