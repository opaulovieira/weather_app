import 'package:weather/weather/data/model.dart';
import 'package:weather/weather/data/repository.dart';

final class FailedToGetWeather implements Exception {}

final class GetWeatherUseCase {
  const GetWeatherUseCase({required this.repository});

  final WeatherRepository repository;

  Future<Weather> call() async {
    final hasPermission = await repository.allowWeatherRequest();
    final isEnabled = await repository.checkIfEnabled();

    if (!isEnabled || !hasPermission) {
      throw FailedToGetWeather();
    } else {
      return repository.getWeather();
    }
  }
}
