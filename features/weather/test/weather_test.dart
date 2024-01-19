import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';
import 'package:weather/src/weather_impl.dart';
import 'package:weather/weather.dart';

void main() {
  final dio = Dio();
  final mockAdapter = DioAdapter(dio: dio);

  late Weather weather;

  setUpAll(() {
    dio.httpClientAdapter = mockAdapter;
  });

  setUp(() {
    mockAdapter.onGet(
      "https://api.openweathermap.org/data/3.0/onecall?lat=0.0&lon=0.0&exclude=minutely,hourly,daily&units=metric&lang=en&appid=apiKey",
      (server) => server.reply(
        200,
        '''
        {
          "lat": 33.44,
          "lon": -94.04,
          "timezone": "America/Chicago",
          "timezone_offset": -18000,
          "current": {
            "dt": 1684929490,
            "sunrise": 1684926645,
            "sunset": 1684977332,
            "temp": 292.55,
            "feels_like": 292.87,
            "pressure": 1014,
            "humidity": 89,
            "dew_point": 290.69,
            "uvi": 0.16,
            "clouds": 53,
            "visibility": 10000,
            "wind_speed": 3.13,
            "wind_deg": 93,
            "wind_gust": 6.71,
            "weather": [
              {
                "id": 803,
                "main": "Clouds",
                "description": "broken clouds",
                "icon": "04d"
              }
            ]
          }
        }
        ''',
      ),
    );
  });

  group('Weather', () {
    setUp(() {
      weather = WeatherImpl(dio: dio, apiKey: 'apiKey');
    });

    test('should correctly map to Current model', () async {
      final current = await weather.getCurrent(0.0, 0.0);

      expect(
        current,
        Current(
          dateTime: DateTime.fromMillisecondsSinceEpoch(1684929490),
          sunrise: DateTime.fromMillisecondsSinceEpoch(1684926645),
          sunset: DateTime.fromMillisecondsSinceEpoch(1684977332),
          temperature: 292.55,
          forecasts: [
            Forecast(
              id: 803,
              main: 'Clouds',
              description: 'broken clouds',
              code: '04d',
            ),
          ],
        ),
      );
    });

    test(
      'should throw a UnexpectedError exception when statusCode is not 200',
      () {
        mockAdapter.onGet(
          "https://api.openweathermap.org/data/3.0/onecall?lat=0.0&lon=0.0&exclude=minutely,hourly,daily&units=metric&lang=en&appid=apiKey",
          (server) => server.reply(201, null),
        );

        expect(
          () => weather.getCurrent(0.0, 0.0),
          throwsA(isA<UnexpectedError>()),
        );
      },
    );
  });
}
