import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/auth/auth_presenter.dart';
import 'package:weather/weather/data/exceptions.dart';
import 'package:weather/weather/data/model.dart';
import 'package:weather/weather/presentation/weather_presenter.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    super.key,
  });

  static const route = '/weather';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clima"),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  ref.read(authPresenterProvider).logout();
                },
                icon: const Icon(
                  Icons.exit_to_app_rounded,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final presenter = ref.read(weatherPresenterProvider);

          return FutureBuilder(
            future: presenter.requestData(),
            builder: (context, snapshot) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  top: 64.0,
                ),
                child: ValueListenableBuilder(
                  valueListenable: presenter,
                  builder: (context, value, child) {
                    return switch (value) {
                      Loading() => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      Success(data: final Weather weather) => Center(
                          child: Column(
                            children: [
                              Forecast(weather: weather),
                              const SizedBox(height: 8.0),
                              Card(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                elevation: 8.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: FittedBox(
                                    child: Temperature(weather: weather),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              TextButton(
                                onPressed: presenter.requestData,
                                child: const Text('Get weather'),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      Failure(error: final WeatherRepositoryException error) =>
                        Center(
                          child: Text(
                            switch (error) {
                              FailedToGetWeather() =>
                                "Sorry, we couldn't obtain the weather from your device's location.",
                              UserMayChangeWebBrowser() =>
                                "It seems your web browser does not allow to obtain your device's location",
                              UserShouldAllowOnAppSettings() =>
                                "Sorry, we don't have the permission to use your device's location. You may change it in the permissions settings.",
                            },
                          ),
                        ),
                    };
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Temperature extends StatelessWidget {
  const Temperature({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  '${weather.maxTemperature} °C',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.red.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Icon(
                  Icons.arrow_upward,
                  size: 16.0,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${weather.minTemperature} °C',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.blue.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Icon(
                  Icons.arrow_downward,
                  size: 16.0,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${weather.temperature} °C',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4.0),
            Text(
              '(feels like: ${weather.feelsLikeTemperature} °C)',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}

class Forecast extends StatelessWidget {
  const Forecast({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    if (weather.forecastAssetUrl case final String forecast) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Image.network(forecast),
          ),
          const SizedBox(height: 4.0),
          Text(
            '(${weather.forecastDescription})',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
