import 'package:locator/locator.dart';
import 'package:weather/weather/data/exceptions.dart';
import 'package:weather/weather/data/model.dart';
import 'package:weather/weather/data/repository.dart';

final class GetWeatherUseCase {
  const GetWeatherUseCase({required this.repository});

  final WeatherRepository repository;

  Future<Weather> call() async {
    try {
      final hasPermission = await repository.allowWeatherRequest();
      final isEnabled = await repository.checkIfEnabled();

      if (!isEnabled || !hasPermission) {
        throw FailedToGetWeather();
      } else {
        final weather = await repository.getWeather();

        return weather;
      }
    } on LocatorException catch (error) {
      switch (error) {
        case WebBrowserHasNoPermissionAPI():
          throw UserMayChangeWebBrowser();
        case DeniedUntilChangedOnAppSettings():
          throw UserShouldAllowOnAppSettings();
      }
    }
  }
}
