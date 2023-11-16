import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozzok/common/constans/Environment.dart';

class MobileApplication extends StatelessWidget {
  final Environment? environment;
  const MobileApplication({Key? key, this.environment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepository(
      providers: [
        _configureApplicationEnvironment(),
        _configureInternetValidator(),
        _configureUserAuthenticationRepository(),
        _configureApiClient(),
        _configureSignInRepository(),
        _configureSignUpRepository(),
        _configureAccountRepository(),
        _configureConfigurationRepository(),
      ],
    );
  }

  RepositoryProvider<ApiClient> _configureApiClient() {
    return RepositoryProvider<ApiClient>(
      create: (context) => ApiClient(environment.baseUrl),
      lazy: true,
    );
  }

  RepositoryProvider<InternetConnectionValidator>
      _configureInternetValidator() {
    return RepositoryProvider<InternetConnectionValidator>(
      create: (context) => InternetConnectionValidator(),
      lazy: true,
    );
  }

  RepositoryProvider<Environment> _configureApplicationEnvironment() {
    return RepositoryProvider<Environment>(
      create: (context) => environment,
      lazy: true,
    );
  }
}
