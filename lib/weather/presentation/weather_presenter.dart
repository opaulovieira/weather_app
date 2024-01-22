import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather/data/exceptions.dart';
import 'package:weather/weather/data/model.dart';
import 'package:weather/weather/data/use_cases.dart';

final weatherPresenterProvider = Provider.autoDispose((ref) {
  final getWeather = ref.read(getWeatherUseCaseProvider);

  return WeatherPresenter(getWeather: getWeather);
});

final class WeatherPresenter extends ValueNotifier<WeatherState> {
  WeatherPresenter({required GetWeatherUseCase getWeather})
      : _getWeather = getWeather,
        super(Loading());

  final GetWeatherUseCase _getWeather;

  Future<void> requestData() async {
    value = Loading();

    try {
      final weather = await _getWeather();

      value = Success(data: weather);
    } on WeatherRepositoryException catch (error) {
      value = Failure(error: error);
    }
  }
}

sealed class WeatherState {}

class Loading implements WeatherState {}

class Success implements WeatherState {
  const Success({required this.data});

  final Weather data;
}

class Failure implements WeatherState {
  const Failure({required this.error});

  final WeatherRepositoryException error;
}
