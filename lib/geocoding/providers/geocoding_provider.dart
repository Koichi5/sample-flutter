import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geocoding_provider.g.dart';

@riverpod
class GeocodingController extends _$GeocodingController {
  late bool isServiceEnabled;
  late LocationPermission permission;

  @override
  Future<void> build() async {
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<Placemark> getPlacemarkFromPosition(
      {required double latitude, required double longitude}) async {
    final placeMarks = await GeocodingPlatform.instance
        .placemarkFromCoordinates(latitude, longitude);
    final placeMark = placeMarks[0];
    return placeMark;
  }

  Future<Address> getCurrentAddress() async {
    final currentPosition = await getCurrentPosition();
    final placeMark = await getPlacemarkFromPosition(
      latitude: currentPosition.latitude,
      longitude: currentPosition.longitude,
    );
    log('name: ${placeMark.name}');
    log('street: ${placeMark.street}');
    log('isoCountryCode: ${placeMark.isoCountryCode}');
    log('country: ${placeMark.country}');
    log('postalCode: ${placeMark.postalCode}');
    log('administrativeArea: ${placeMark.administrativeArea}');
    log('subAdministrativeArea: ${placeMark.subAdministrativeArea}');
    log('locality: ${placeMark.locality}');
    log('subLocality: ${placeMark.subLocality}');
    log('thoroughfare: ${placeMark.thoroughfare}');
    log('subThoroughfare: ${placeMark.subThoroughfare}');

    final address = Address(
      country: placeMark.country ?? '',
      prefecture: placeMark.administrativeArea ?? '',
      city: placeMark.locality ?? '',
      street: placeMark.street ?? '',
    );
    log('country: ${address.country}');
    log('prefecture: ${address.prefecture}');
    log('city: ${address.city}');
    log('street: ${address.street}');

    return address;
  }

  Future<Address> getAddressInfoFromPosition(
      {required double latitude, required double longitude}) async {
    final placeMark = await getPlacemarkFromPosition(
        latitude: latitude, longitude: longitude);
    final address = Address(
      country: placeMark.country ?? '',
      prefecture: placeMark.administrativeArea ?? '',
      city: placeMark.locality ?? '',
      street: placeMark.street ?? '',
    );
    return address;
  }
}

class Address {
  final String country;
  final String prefecture;
  final String city;
  final String street;

  Address({
    required this.country,
    required this.prefecture,
    required this.city,
    required this.street,
  });
}
