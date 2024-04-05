import 'package:sample_flutter/models/macros/model.dart';

@Model()
class Weather {
  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final int? elevation;
  final CurrentUnits? currentUnits;
  final Current? current;

  Weather({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
  });
}

@Model()
class Current {
    final String time;
    final int interval;
    final double temperature2M;
    final int weatherCode;

    Current({
        this.time,
        this.interval,
        this.temperature2M,
        this.weatherCode,
    });

}

@Model()
class CurrentUnits {
    final String time;
    final String interval;
    final String temperature2M;
    final String weatherCode;

    CurrentUnits({
        this.time,
        this.interval,
        this.temperature2M,
        this.weatherCode,
    });
}
