import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { Authenticated, Unauthenticated }

class AuthState {
  final AuthStatus? status;
  final Map<String, dynamic>? identity;

  AuthState({
    this.status,
    this.identity,
  });
}

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState(status: AuthStatus.Unauthenticated));

  // loadIdentity

}
