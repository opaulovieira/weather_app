final class Weather {
  const Weather({
    required this.requestTime,
    required this.temperature,
    required this.feelsLikeTemperature,
    required this.maxTemperature,
    required this.minTemperature,
    this.forecast,
    this.forecastDescription,
    this.forecastAssetUrl,
  });

  final DateTime requestTime;
  final double temperature;
  final double feelsLikeTemperature;
  final double maxTemperature;
  final double minTemperature;
  final String? forecast;
  final String? forecastDescription;
  final String? forecastAssetUrl;
}
