import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/src/model/forecast.dart';

part 'current.freezed.dart';
part 'current.g.dart';

@freezed
class Current with _$Current {
  const factory Current({
    @JsonKey(name: 'dt', fromJson: DateTime.fromMillisecondsSinceEpoch)
    required DateTime dateTime,
    @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
    required DateTime sunrise,
    @JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch)
    required DateTime sunset,
    @JsonKey(name: 'temp') required double temperature,
    @JsonKey(name: 'weather') required List<Forecast> forecasts,
  }) = _Current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
}
