import 'dart:async';

import 'package:locator/locator.dart';
import 'package:meteorologist/meteorologist.dart';
import 'package:weather/weather/data/model.dart';

final class WeatherRepository {
  const WeatherRepository({
    required this.locator,
    required this.meteorologist,
  });

  final Locator locator;
  final Meteorologist meteorologist;

  Future<bool> allowWeatherRequest() => locator.checkPermission();

  Future<bool> checkIfEnabled() => locator.checkIfEnabled();

  Future<Weather> getWeather() async {
    final location = await locator.getLocation();

    final currentWeather = await meteorologist.getCurrent(
      location.longitude,
      location.latitude,
    );

    final forecast = currentWeather.forecasts.isEmpty //
        ? null
        : currentWeather.forecasts[0];

    return Weather(
      requestTime: currentWeather.dateTime,
      temperature: currentWeather.temperature.value,
      feelsLikeTemperature: currentWeather.temperature.feelsLike,
      maxTemperature: currentWeather.temperature.max,
      minTemperature: currentWeather.temperature.min,
      forecast: forecast?.main,
      forecastDescription: forecast?.description,
      forecastAssetUrl: meteorologist.getAssetUrl(currentWeather),
    );
  }
}
