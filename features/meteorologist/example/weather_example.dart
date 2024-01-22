import 'package:dio/dio.dart';
import 'package:meteorologist/src/meteorologist_impl.dart';

Future<void> main() async {
  const apiKey = String.fromEnvironment('APIKEY');

  final dio = Dio();
  final weather = MeteorologistImpl(dio: dio, apiKey: apiKey);
  final current = await weather.getCurrent(-94.04, -33.44);
  print(current);
}
