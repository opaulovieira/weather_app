import 'package:go_router/go_router.dart';
import 'package:weather/auth/auth_view.dart';
import 'package:weather/weather/presentation/weather_view.dart';

GoRouter buildRouter(bool isLoggedIn) => GoRouter(
      routes: [
        GoRoute(
          path: AuthView.route,
          builder: (context, state) => const AuthView(),
        ),
        GoRoute(
          path: WeatherView.route,
          builder: (context, state) => const WeatherView(),
        ),
      ],
      redirect: (context, state) {
        final isLogging = state.matchedLocation == AuthView.route;

        if (!isLoggedIn && !isLogging) {
          return AuthView.route;
        } else if (isLoggedIn && isLogging) {
          return WeatherView.route;
        } else {
          return null;
        }
      },
    );
