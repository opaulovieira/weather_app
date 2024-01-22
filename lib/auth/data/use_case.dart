import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/auth/data/user.dart';

final validateCredentialsUseCaseProvider = Provider.autoDispose(
  (ref) => ValidateCredentialsUseCase(),
);

final class ValidateCredentialsUseCase {
  Future<bool> call(User user) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () => user.id == 'olly@olly.com' && user.password == 123456,
    );
  }
}
