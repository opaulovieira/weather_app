import 'package:meteorologist/src/model/current_weather.dart';

abstract interface class Meteorologist {
  Future<CurrentWeather> getCurrent(double longitude, double latitude);
  String? getAssetUrl(CurrentWeather current);
}
