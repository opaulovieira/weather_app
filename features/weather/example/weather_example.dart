import 'package:dio/dio.dart';
import 'package:weather/src/weather_impl.dart';

Future<void> main() async {
  const apiKey = String.fromEnvironment('APIKEY');

  final dio = Dio();
  final weather = WeatherImpl(dio: dio, apiKey: apiKey);
  final current = await weather.getCurrent(-94.04, -33.44);
  print(current);
}
