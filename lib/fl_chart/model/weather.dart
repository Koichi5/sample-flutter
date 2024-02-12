import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  factory Weather({
    required double latitude,
    required double longitude,
    required double generationtimeMs,
    required int? utcOffsetSeconds,
    required String timezone,
    required String timezoneAbbreviation,
    required double? elevation,
    required HourlyUnits hourlyUnits,
    required Hourly hourly,
  }) = _Weather;

factory Weather.fromJson(Map<String, dynamic> json) => Weather(
  latitude: (json["latitude"] as num?)?.toDouble() ?? 0.0,
  longitude: (json["longitude"] as num?)?.toDouble() ?? 0.0,
  generationtimeMs: (json["generationtime_ms"] as num?)?.toDouble() ?? 0.0,
  utcOffsetSeconds: json["utc_offset_seconds"] as int? ?? 0,
  timezone: json["timezone"] as String? ?? '',
  timezoneAbbreviation: json["timezone_abbreviation"] as String? ?? '',
  elevation: json["elevation"] as double? ?? 0.0,
  hourlyUnits: HourlyUnits.fromJson(json["hourly_units"] ?? {}),
  hourly: Hourly.fromJson(json["hourly"] ?? {}),
);
}

@freezed
class Hourly with _$Hourly {
  factory Hourly({
    required List<String> time,
    required List<double> temperature_2m,
  }) = _Hourly;

  factory Hourly.fromJson(Map<String, dynamic> json) =>
      _$HourlyFromJson(json);
}

@freezed
class HourlyUnits with _$HourlyUnits {
  factory HourlyUnits({
    required String time,
    required String temperature_2m,
  }) = _HourlyUnits;

  factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyUnitsFromJson(json);
}
