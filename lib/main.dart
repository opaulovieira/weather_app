import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:locator/locator.dart';
import 'package:meteorologist/meteorologist.dart';
import 'package:weather/auth/auth_presenter.dart';
import 'package:weather/auth/auth_view.dart';
import 'package:weather/auth/data/use_case.dart';
import 'package:weather/weather/data/repository.dart';
import 'package:weather/weather/data/use_cases.dart';
import 'package:weather/weather/presentation/weather_presenter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final presenter = WeatherPresenter(
    getWeather: GetWeatherUseCase(
      repository: WeatherRepository(
        locator: LocatorImpl(),
        meteorologist: MeteorologistImpl(
          dio: Dio(),
          apiKey: const String.fromEnvironment('APIKEY'),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthView(
        presenter: AuthPresenter(
          validateCredentials: ValidateCredentialsUseCase(),
        ),
      ),
      builder: (context, child) {
        return SafeArea(
          child: child!,
        );
      },
    );
  }
}
