import 'package:locator/src/model/location.dart';

abstract interface class Locator {
  Future<bool> checkPermission();
  Future<bool> checkIfEnabled();
  Future<Location> getLocation();
  Future<bool> requestPermission();
}
