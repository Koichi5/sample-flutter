import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_flutter/fl_chart/model/weather.dart';
import 'package:http/http.dart' as http;

part 'weather_provider.g.dart';

@riverpod
Future<Weather> weather(WeatherRef ref) async {
  const url =
      'https://api.open-meteo.com/v1/forecast?latitude=35.6894&longitude=139.6917&hourly=temperature_2m&timezone=Asia%2FTokyo&forecast_days=1';
  final uri = Uri.parse(url);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return Weather.fromJson(json);
  } else {
    throw Exception('Failed to load weather data');
  }
}
