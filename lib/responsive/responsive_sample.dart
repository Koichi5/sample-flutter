import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

enum Breakpoint {
  small,
  large;

  double get width {
    switch (this) {
      case Breakpoint.small:
        return 640;
      case Breakpoint.large:
        return 1024;
    }
  }
}

enum DeviceType {
  phonePortrait,
  phoneLandscape,
  tabletPortrait,
  tabletLandscape,
}

extension DeviceTypeExtension on DeviceType {
  String get name {
    switch (this) {
      case DeviceType.phonePortrait:
        return 'iPhone縦向き';
      case DeviceType.phoneLandscape:
        return 'iPhone横向き';
      case DeviceType.tabletPortrait:
        return 'iPad縦向き';
      case DeviceType.tabletLandscape:
        return 'iPad横向き';
    }
  }
}

DeviceType getDeviceTypeByMediaQuery(BuildContext context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  final isTablet = isPortrait &&
          MediaQuery.of(context).size.width > Breakpoint.small.width ||
      !isPortrait && MediaQuery.of(context).size.width > Breakpoint.large.width;

  if (isTablet) {
    return isPortrait ? DeviceType.tabletPortrait : DeviceType.tabletLandscape;
  } else {
    return isPortrait ? DeviceType.phonePortrait : DeviceType.phoneLandscape;
  }
}

Future<DeviceType> getDeviceTypeByDeviceInfo(BuildContext context) async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  final isTablet = iosDeviceInfo.model.contains('iPad');
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  if (isTablet) {
    return isPortrait ? DeviceType.tabletPortrait : DeviceType.tabletLandscape;
  } else {
    return isPortrait ? DeviceType.phonePortrait : DeviceType.phoneLandscape;
  }
}



class ResponsiveSample extends StatelessWidget {
  const ResponsiveSample({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceTypeByMediaQuery(context);

    String type;
    switch (deviceType) {
      case DeviceType.phonePortrait:
        type = deviceType.name;
        break;
      case DeviceType.phoneLandscape:
        type = deviceType.name;
        break;
      case DeviceType.tabletPortrait:
        type = deviceType.name;
        break;
      case DeviceType.tabletLandscape:
        type = deviceType.name;
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'レスポンシブ対応',
        ),
      ),
      body: Center(
        child: Text(
          type,
        ),
      ),
    );
  }
}
