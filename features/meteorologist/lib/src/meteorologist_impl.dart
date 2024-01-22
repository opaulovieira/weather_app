import 'package:dio/dio.dart';
import 'package:meteorologist/src/meteorologist.dart';
import 'package:meteorologist/src/model/current_weather.dart';
import 'package:meteorologist/src/model/exceptions.dart';

final class MeteorologistImpl implements Meteorologist {
  const MeteorologistImpl({
    required this.dio,
    required this.apiKey,
  });

  static const _assetUrl = "https://openweathermap.org/img/wn/";
  static const _url = "https://api.openweathermap.org/data/2.5/weather";

  final Dio dio;
  final String apiKey;

  Future<Map<String, Object?>> _rawFetch(
    double longitude,
    double latitude,
  ) async {
    final response = await dio.get(
      "$_url?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey",
    );

    final statusCode = response.statusCode;

    if (statusCode == 200) {
      return response.data;
    } else {
      throw UnexpectedError();
    }
  }

  @override
  Future<CurrentWeather> getCurrent(double longitude, double latitude) async {
    final rawData = await _rawFetch(longitude, latitude);

    final data = CurrentWeather.fromJson(rawData);

    return data;
  }

  @override
  String? getAssetUrl(CurrentWeather current) {
    final assetUrl = current.forecasts.isEmpty //
        ? null
        : '$_assetUrl${current.forecasts[0].code}@2x.png';

    return assetUrl;
  }
}
