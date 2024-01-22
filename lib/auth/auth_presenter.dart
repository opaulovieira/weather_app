import 'package:flutter/foundation.dart';
import 'package:weather/auth/data/use_case.dart';
import 'package:weather/auth/data/user.dart';

class AuthPresenter extends ValueNotifier<AuthState> {
  AuthPresenter({
    required ValidateCredentialsUseCase validateCredentials,
  })  : _validateCredentials = validateCredentials,
        super(AuthState.waitingForUser);

  final ValidateCredentialsUseCase _validateCredentials;

  Future<void> validateCredentials(User user) async {
    value = AuthState.loading;
    final isValid = await _validateCredentials(user);

    value = isValid ? AuthState.authenticated : AuthState.unauthenticated;
  }

  void waitForUserCredentials() => value = AuthState.waitingForUser;

  bool get isValid => value == AuthState.authenticated;
}

enum AuthState {
  waitingForUser,
  authenticated,
  unauthenticated,
  loading,
}
