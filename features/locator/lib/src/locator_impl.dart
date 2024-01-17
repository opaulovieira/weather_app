import 'package:geolocator/geolocator.dart';
import 'package:locator/src/locator.dart';
import 'package:locator/src/model/exceptions.dart';
import 'package:locator/src/model/location.dart';

final class LocatorImpl implements Locator {
  @override
  Future<bool> checkPermission() async {
    final permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.always || LocationPermission.whileInUse:
        return permission.isAllowed;
      case LocationPermission.unableToDetermine:
        throw WebBrowserHasNoPermissionAPI();
      case LocationPermission.deniedForever:
        throw DeniedUntilChangedOnAppSettings();
      case LocationPermission.denied:
        return requestPermission();
    }
  }

  @override
  Future<bool> checkIfEnabled() async {
    final hasUserPermission = await checkPermission();

    if (hasUserPermission) {
      return await Geolocator.isLocationServiceEnabled();
    } else {
      return false;
    }
  }

  @override
  Future<Location> getLocation() async {
    final isEnabled = await checkIfEnabled();

    if (isEnabled) {
      final position = await Geolocator.getCurrentPosition();

      return Location(
        longitude: position.longitude,
        latitude: position.latitude,
      );
    } else {
      throw ServiceIsNotEnabled();
    }
  }

  @override
  Future<bool> requestPermission() async {
    final requestedPermission = await Geolocator.requestPermission();

    if (requestedPermission.isAllowed) {
      return true;
    } else {
      throw UserDoNotAllowService();
    }
  }
}

extension on LocationPermission {
  bool get isAllowed =>
      this == LocationPermission.always ||
      this == LocationPermission.whileInUse;
}
