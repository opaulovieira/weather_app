import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/auth/data/use_case.dart';
import 'package:weather/auth/data/user.dart';

final authPresenterProvider = ChangeNotifierProvider.autoDispose((ref) {
  final validateCredentials = ref.read(validateCredentialsUseCaseProvider);

  return AuthPresenter(validateCredentials: validateCredentials);
});

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

  void logout() => value = AuthState.unauthenticated;

  void waitForUserCredentials() => value = AuthState.waitingForUser;

  bool get isAuthenticated => value == AuthState.authenticated;
}

enum AuthState {
  waitingForUser,
  authenticated,
  unauthenticated,
  loading,
}
