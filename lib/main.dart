import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:weather/auth/auth_presenter.dart';
import 'package:weather/routes.dart';

void main() {
  usePathUrlStrategy();

  runApp(
    const ProviderScope(
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isLoggedIn = ref.watch(
          authPresenterProvider.select(
            (presenter) => presenter.isAuthenticated,
          ),
        );

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          routerConfig: buildRouter(isLoggedIn),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          builder: (context, child) {
            return SafeArea(
              child: child!,
            );
          },
        );
      },
    );
  }
}
