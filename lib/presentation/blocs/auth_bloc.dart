import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/client/client.model.dart';
import 'package:yes/data/models/response.dart';
import 'package:yes/data/service/app_service.dart';
import 'package:yes/presentation/shared/storage.dart';

enum AuthStatus { Authenticated, Unauthenticated, Idle }

class AuthState {
  final AuthStatus? status;
  final Client? identity;

  AuthState({
    this.status = AuthStatus.Idle,
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
  setIdentity(ApiResponse res) {
    if (res.success == true) {
      log(res.success.toString());
      emit(state.copyWith(status: AuthStatus.Authenticated));
    }
  }

  setlogOut() async {
    var storage = await LocalStorage.instance;
    var res = await storage.removeToken;
    log(res.toString());
    AppService.currentUser.value = null;
    emit(state.copyWith(identity: null, status: AuthStatus.Unauthenticated));
  }
}
