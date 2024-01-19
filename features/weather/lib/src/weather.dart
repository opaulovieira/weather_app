import 'package:weather/src/model/current.dart';

abstract interface class Weather {
  Future<Current> getCurrent(double longitude, double latitude);
  String? getAssetUrl(Current current);
}
