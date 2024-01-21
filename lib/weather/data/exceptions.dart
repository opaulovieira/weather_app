sealed class WeatherRepositoryException implements Exception {}

final class FailedToGetWeather implements WeatherRepositoryException {}

final class UserMayChangeWebBrowser implements WeatherRepositoryException {}

final class UserShouldAllowOnAppSettings
    implements WeatherRepositoryException {}
