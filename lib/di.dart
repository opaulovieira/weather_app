import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locator/locator.dart';
import 'package:meteorologist/meteorologist.dart';

final locatorProvider = Provider.autoDispose((ref) => LocatorImpl());
final dioProvider = Provider.autoDispose((ref) => Dio());
final meteorologistProvider = Provider.autoDispose((ref) {
  final dio = ref.read(dioProvider);

  return MeteorologistImpl(
    dio: dio,
    apiKey: const String.fromEnvironment('APIKEY'),
  );
});
