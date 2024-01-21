import 'package:flutter/material.dart';
import 'package:weather/weather/data/exceptions.dart';
import 'package:weather/weather/presentation/weather_presenter.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({
    super.key,
    required this.presenter,
  });

  final WeatherPresenter presenter;

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
    widget.presenter.requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clima"),
        actions: [
          IconButton(
            onPressed: () {
              // TODO(opaulovieira): logout
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: widget.presenter,
        builder: (context, value, child) {
          return switch (value) {
            // TODO: Handle this case.
            Loading() => const Center(
                child: CircularProgressIndicator(),
              ),
            // TODO: Handle this case.
            Success() => const Center(
                child: Text('Success'),
              ),
            // TODO: Handle this case.
            Failure(error: final WeatherRepositoryException error) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 64.0,
                ),
                child: Center(
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
              ),
          };
        },
      ),
    );
  }
}
