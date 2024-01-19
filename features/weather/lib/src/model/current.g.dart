// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentImpl _$$CurrentImplFromJson(Map<String, dynamic> json) =>
    _$CurrentImpl(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] as int),
      temperature: Temperature.fromJson(json['main'] as Map<String, dynamic>),
      forecasts: (json['weather'] as List<dynamic>)
          .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurrentImplToJson(_$CurrentImpl instance) =>
    <String, dynamic>{
      'dt': instance.dateTime.toIso8601String(),
      'main': instance.temperature,
      'weather': instance.forecasts,
    };
