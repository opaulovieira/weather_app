import 'package:flutter/widgets.dart';
import 'package:locator/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final locator = LocatorImpl();
  try {
    final position = await locator.getLocation();
    print("position: $position");
  } catch (error) {
    print("error: $error");
  }
}
