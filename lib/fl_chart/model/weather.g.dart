// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherImpl _$$WeatherImplFromJson(Map<String, dynamic> json) =>
    _$WeatherImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtimeMs'] as num).toDouble(),
      utcOffsetSeconds: json['utcOffsetSeconds'] as int?,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezoneAbbreviation'] as String,
      elevation: (json['elevation'] as num?)?.toDouble(),
      hourlyUnits:
          HourlyUnits.fromJson(json['hourlyUnits'] as Map<String, dynamic>),
      hourly: Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WeatherImplToJson(_$WeatherImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtimeMs': instance.generationtimeMs,
      'utcOffsetSeconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezoneAbbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'hourlyUnits': instance.hourlyUnits,
      'hourly': instance.hourly,
    };

_$HourlyImpl _$$HourlyImplFromJson(Map<String, dynamic> json) => _$HourlyImpl(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      temperature_2m: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$HourlyImplToJson(_$HourlyImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
    };

_$HourlyUnitsImpl _$$HourlyUnitsImplFromJson(Map<String, dynamic> json) =>
    _$HourlyUnitsImpl(
      time: json['time'] as String,
      temperature_2m: json['temperature_2m'] as String,
    );

Map<String, dynamic> _$$HourlyUnitsImplToJson(_$HourlyUnitsImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
    };
