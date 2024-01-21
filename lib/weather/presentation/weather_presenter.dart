import 'package:flutter/cupertino.dart';
import 'package:weather/weather/data/exceptions.dart';
import 'package:weather/weather/data/model.dart';
import 'package:weather/weather/data/use_cases.dart';

final class WeatherPresenter extends ValueNotifier<WeatherState> {
  WeatherPresenter({required this.getWeather}) : super(Loading());

  final GetWeatherUseCase getWeather;

  Future<void> requestData() async {
    value = Loading();

    try {
      final weather = await getWeather();

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
