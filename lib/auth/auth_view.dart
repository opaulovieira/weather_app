import 'package:flutter/material.dart';
import 'package:weather/auth/auth_presenter.dart';
import 'package:weather/auth/data/user.dart';

class AuthView extends StatefulWidget {
  const AuthView({
    super.key,
    required this.presenter,
  });

  final AuthPresenter presenter;

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();
  final _emailTEC = TextEditingController();
  final _emailFN = FocusNode();
  final _passwordTEC = TextEditingController();
  final _passwordFN = FocusNode();

  @override
  void initState() {
    super.initState();

    _emailFN.addListener(() {
      if (_emailFN.hasFocus) {
        widget.presenter.waitForUserCredentials();
      }
    });

    _passwordFN.addListener(() {
      if (_passwordFN.hasFocus) {
        widget.presenter.waitForUserCredentials();
      }
    });
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailTEC.dispose();
    _emailFN.dispose();
    _passwordTEC.dispose();
    _passwordFN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 64.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400.0),
              child: Column(
                children: [
                  Icon(
                    Icons.people_alt_rounded,
                    color: Theme.of(context).colorScheme.primary,
                    size: 128.0,
                  ),
                  ValueListenableBuilder<AuthState>(
                    valueListenable: widget.presenter,
                    builder: (context, state, child) {
                      return _DecoratedTextFormField(
                        label: 'Email',
                        hint: 'olly@olly.com',
                        icon: Icons.email_rounded,
                        controller: _emailTEC,
                        focus: _emailFN,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return _emailFN.hasFocus
                                ? null
                                : 'Please enter some text';
                          } else {
                            return switch (state) {
                              AuthState.waitingForUser ||
                              AuthState.authenticated ||
                              AuthState.loading =>
                                null,
                              AuthState.unauthenticated =>
                                'Email or password is not valid.',
                            };
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 8.0),
                  ValueListenableBuilder<AuthState>(
                    valueListenable: widget.presenter,
                    builder: (context, state, child) {
                      return _DecoratedTextFormField(
                        label: 'Password',
                        hint: '123456',
                        icon: Icons.key_rounded,
                        controller: _passwordTEC,
                        focus: _passwordFN,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return _passwordFN.hasFocus
                                ? null
                                : 'Please enter some text';
                          } else {
                            final password = int.tryParse(value);

                            if (password != null && value.length >= 6) {
                              return switch (state) {
                                AuthState.waitingForUser ||
                                AuthState.authenticated ||
                                AuthState.loading =>
                                  null,
                                AuthState.unauthenticated =>
                                  'Email or password is not valid.',
                              };
                            } else {
                              return 'The password should be a numerical value with at least 6 digits.';
                            }
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      final isValid =
                          _formKey.currentState?.validate() ?? false;

                      if (isValid) {
                        await widget.presenter.validateCredentials(
                          User(
                            id: _emailTEC.text,
                            password: int.parse(_passwordTEC.text),
                          ),
                        );

                        final isValidated = widget.presenter.isValid;
                      }
                    },
                    child: ValueListenableBuilder<AuthState>(
                      valueListenable: widget.presenter,
                      builder: (context, state, child) {
                        return switch (state) {
                          AuthState.waitingForUser ||
                          AuthState.authenticated ||
                          AuthState.unauthenticated =>
                            const Text('Get me in!'),
                          AuthState.loading =>
                            const CircularProgressIndicator(),
                        };
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DecoratedTextFormField extends StatelessWidget {
  const _DecoratedTextFormField({
    required this.label,
    required this.icon,
    required this.validator,
    this.controller,
    this.hint,
    this.focus,
  });

  final String label;
  final String? hint;
  final IconData icon;
  final String? Function(String?) validator;
  final TextEditingController? controller;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      focusNode: focus,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        hintText: hint,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Icon(icon),
        ),
        suffixIconColor: Theme.of(context).colorScheme.primary,
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      validator: validator,
    );
  }
}
