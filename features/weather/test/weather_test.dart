import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';
import 'package:weather/src/weather_impl.dart';
import 'package:weather/weather.dart';

void main() {
  final dio = Dio();
  final mockAdapter = DioAdapter(dio: dio);

  const baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  late Weather weather;

  setUpAll(() {
    dio.httpClientAdapter = mockAdapter;
  });

  setUp(() {
    mockAdapter.onGet(
      "$baseUrl?lat=0.0&lon=0.0&units=metric&lang=en&appid=apiKey",
      (server) => server.reply(
        200,
        '''
        {
          "coord": {
            "lon": 10.99,
            "lat": 44.34
          },
          "weather": [
            {
              "id": 501,
              "main": "Rain",
              "description": "moderate rain",
              "icon": "10d"
            }
          ],
          "base": "stations",
          "main": {
            "temp": 298.48,
            "feels_like": 298.74,
            "temp_min": 297.56,
            "temp_max": 300.05,
            "pressure": 1015,
            "humidity": 64,
            "sea_level": 1015,
            "grnd_level": 933
          },
          "visibility": 10000,
          "wind": {
            "speed": 0.62,
            "deg": 349,
            "gust": 1.18
          },
          "rain": {
            "1h": 3.16
          },
          "clouds": {
            "all": 100
          },
          "dt": 1661870592,
          "sys": {
            "type": 2,
            "id": 2075663,
            "country": "IT",
            "sunrise": 1661834187,
            "sunset": 1661882248
          },
          "timezone": 7200,
          "id": 3163858,
          "name": "Zocca",
          "cod": 200
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
          dateTime: DateTime.fromMillisecondsSinceEpoch(1661870592),
          temperature: Temperature(
            value: 298.48,
            feelsLike: 298.74,
            min: 297.56,
            max: 300.05,
          ),
          forecasts: [
            Forecast(
              id: 501,
              main: 'Rain',
              description: 'moderate rain',
              code: '10d',
            ),
          ],
        ),
      );
    });

    test(
      'should throw a UnexpectedError exception when statusCode is not 200',
      () {
        mockAdapter.onGet(
          "$baseUrl?lat=0.0&lon=0.0&units=metric&lang=en&appid=apiKey",
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
