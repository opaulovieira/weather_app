import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
sealed class Forecast with _$Forecast {
  const factory Forecast({
    required int id,
    required String main,
    required String description,
    @JsonKey(name: 'icon') required String code,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
