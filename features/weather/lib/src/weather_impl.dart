import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather/src/model/current.dart';
import 'package:weather/src/model/exceptions.dart';
import 'package:weather/src/weather.dart';

final class WeatherImpl implements Weather {
  const WeatherImpl({
    required this.dio,
    required this.apiKey,
  });

  static const _assetUrl = "https://openweathermap.org/img/wn/";
  static const _url = "https://api.openweathermap.org/data/3.0/onecall";

  final Dio dio;
  final String apiKey;

  Future<Map<String, Object?>> _rawFetch(
    double longitude,
    double latitude,
  ) async {
    final response = await dio.get(
      "$_url?lat=$latitude&lon=$longitude&exclude=minutely,hourly,daily&units=metric&lang=en&appid=$apiKey",
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      return jsonDecode(response.data)['current'];
    } else {
      throw UnexpectedError();
    }
  }

  @override
  Future<Current> getCurrent(double longitude, double latitude) async {
    final rawData = await _rawFetch(longitude, latitude);

    final data = Current.fromJson(rawData);

    return data;
  }

  @override
  String? getAssetUrl(Current current) {
    final assetUrl = current.forecasts.isEmpty //
        ? null
        : '$_assetUrl${current.forecasts[0].code}@2x.png';

    return assetUrl;
  }
}
