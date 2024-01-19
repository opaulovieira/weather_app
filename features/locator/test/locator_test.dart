import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:locator/locator.dart';

class TestGeolocatorPlatform extends GeolocatorPlatform {
  TestGeolocatorPlatform({
    this.checkPermissionResponse = LocationPermission.always,
    this.isLocationServiceEnabledResponse = true,
    this.requestPermissionResponse = LocationPermission.always,
  });

  final LocationPermission checkPermissionResponse;
  final bool isLocationServiceEnabledResponse;
  final LocationPermission requestPermissionResponse;

  @override
  Future<LocationPermission> checkPermission() async {
    return checkPermissionResponse;
  }

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async {
    return Position(
      longitude: 0.0,
      latitude: 0.0,
      timestamp: DateTime.utc(2024),
      accuracy: 0.0,
      altitude: 0.0,
      altitudeAccuracy: 0.0,
      heading: 0.0,
      headingAccuracy: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return isLocationServiceEnabledResponse;
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return requestPermissionResponse;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Locator', () {
    late Locator locator;

    setUp(() {
      locator = LocatorImpl();
    });

    group('when LocationPermission is allowed', () {
      setUp(() {
        GeolocatorPlatform.instance = TestGeolocatorPlatform();
      });

      test('should return the current Location', () async {
        final location = await locator.getLocation();

        expect(
          location,
          Location(
            latitude: 0.0,
            longitude: 0.0,
          ),
        );
      });

      test(
        'should throw the ServiceIsNotEnabled exception when the service is not enabled',
        () {
          GeolocatorPlatform.instance = TestGeolocatorPlatform(
            checkPermissionResponse: LocationPermission.whileInUse,
            isLocationServiceEnabledResponse: false,
          );

          expect(
            () => locator.getLocation(),
            throwsA((isA<ServiceIsNotEnabled>())),
          );
        },
      );
    });

    group('when LocationPermission is deniedForever', () {
      setUp(() {
        GeolocatorPlatform.instance = TestGeolocatorPlatform(
          checkPermissionResponse: LocationPermission.deniedForever,
        );
      });

      test(
        'should throw the DeniedUntilChangedOnAppSettings exception',
        () {
          expect(
            () => locator.getLocation(),
            throwsA((isA<DeniedUntilChangedOnAppSettings>())),
          );
        },
      );
    });

    group('when LocationPermission is unableToDetermine', () {
      setUp(() {
        GeolocatorPlatform.instance = TestGeolocatorPlatform(
          checkPermissionResponse: LocationPermission.unableToDetermine,
        );
      });

      test(
        'should throw the WebBrowserHasNoPermissionAPI exception',
        () {
          expect(
            () => locator.getLocation(),
            throwsA((isA<WebBrowserHasNoPermissionAPI>())),
          );
        },
      );
    });

    group('when LocationPermission is denied', () {
      setUp(() {
        GeolocatorPlatform.instance = TestGeolocatorPlatform(
          checkPermissionResponse: LocationPermission.denied,
        );
      });

      test(
        'should request for the permission once',
        () async {
          await locator.getLocation();

          expectAsync0(locator.requestPermission, max: 1)();
        },
      );

      test(
        'should allow the service to fetch the position since permission is now given',
        () async {
          final location = await locator.getLocation();

          expect(
            location,
            Location(
              latitude: 0.0,
              longitude: 0.0,
            ),
          );
        },
      );

      test(
        'should throw the UserDoNotAllowService exception since permission is still not given',
        () {
          GeolocatorPlatform.instance = TestGeolocatorPlatform(
            checkPermissionResponse: LocationPermission.denied,
            requestPermissionResponse: LocationPermission.denied,
          );

          expect(
            () => locator.getLocation(),
            throwsA((isA<UserDoNotAllowService>())),
          );
        },
      );
    });
  });
}
