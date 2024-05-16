import 'package:sample_flutter/macros/macro/model.dart';

@Model()
class Weather {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final int elevation;
  final CurrentUnits currentUnits;
  final Current current;

  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
  });
}

@Model()
class Current {
    final String time;
    final int interval;
    final double temperature2M;
    final int weatherCode;

    Current({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.weatherCode,
    });

}

@Model()
class CurrentUnits {
    final String time;
    final String interval;
    final String temperature2M;
    final String weatherCode;

    CurrentUnits({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.weatherCode,
    });
}
