// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentWeatherImpl _$$CurrentWeatherImplFromJson(Map<String, dynamic> json) =>
    _$CurrentWeatherImpl(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] as int),
      temperature: Temperature.fromJson(json['main'] as Map<String, dynamic>),
      forecasts: (json['weather'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurrentWeatherImplToJson(
        _$CurrentWeatherImpl instance) =>
    <String, dynamic>{
      'dt': instance.dateTime.toIso8601String(),
      'main': instance.temperature,
      'weather': instance.forecasts,
    };
