import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meteorologist/src/model/forecast.dart';
import 'package:meteorologist/src/model/temperature.dart';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

@freezed
class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    @JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
    required DateTime dateTime,
    @JsonKey(name: 'main') required Temperature temperature,
    @JsonKey(name: 'weather') required List<Forecast> forecasts,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}
