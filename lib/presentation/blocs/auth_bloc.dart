import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/client/client.model.dart';

enum AuthStatus { Authenticated, Unauthenticated }

class AuthState {
  final AuthStatus? status;
  final Client? identity;

  AuthState({
    this.status,
    this.identity,
  });

  AuthState copyWith({
    AuthStatus? status,
    Client? identity,
  }) {
    return AuthState(
      status: status ?? this.status,
      identity: identity ?? this.identity,
    );
  }
}

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState(status: AuthStatus.Unauthenticated));

  setIdentity(Client? client) {
    if (client != null) {
      emit(state.copyWith(
        identity: client,
        status: AuthStatus.Authenticated,
      ));
    }
  }
}
