import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/shared/storage.dart';

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
  AuthBloc() : super(AuthState());

  setIdentity(Client client) {
    emit(state.copyWith(identity: client, status: AuthStatus.Authenticated));
  }

  setlogOut() async {
    var storage = await LocalStorage.instance;
   await  storage.removeToken;
    AppService.currentUser.value = null;
    emit(state.copyWith(identity: null, status: AuthStatus.Unauthenticated));
  }
}
