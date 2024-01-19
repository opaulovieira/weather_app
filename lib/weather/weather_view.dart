import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          // TODO(opaulovieira): create class for constants
          horizontal: 32.0,
          vertical: 64.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  // TODO(opaulovieira): use variables for State and City
                  "State, City",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  // TODO(opaulovieira): use variables for Temperature
                  "92 °C",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                // TODO(opaulovieira): fetch location and weather data
              },
              icon: const Icon(
                Icons.refresh_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
