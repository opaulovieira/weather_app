// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] as int),
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sunrise'] as int),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sunset'] as int),
      temperature: (json['temp'] as num).toDouble(),
      forecasts: (json['weather'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'dt': instance.dateTime.toIso8601String(),
      'sunrise': instance.sunrise.toIso8601String(),
      'sunset': instance.sunset.toIso8601String(),
      'temp': instance.temperature,
      'weather': instance.forecasts,
    };
