import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/models/auth/login_request.model.dart';
import 'package:yes/data/service/auth_service.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';

enum LoginStatus { idle, loading, error, success }

class LoginBloc extends Cubit<LoginState> {
  final AuthBloc authBloc;
  LoginBloc(this.authBloc) : super(LoginState());

  login(LoginDTO data) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var res = await AuthService.login(data);
    
      if (res.success == true) {
        authBloc.setIdentity(res);
        emit(state.copyWith(status: LoginStatus.success));
      }
    } catch (_) {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  logOut() async {
    try {
      await authBloc.setlogOut();
    } catch (_) {
      throw _;
    }
  }
}

class LoginState {
  final LoginStatus? status;

  LoginState({
    this.status = LoginStatus.idle,
  });

  LoginState copyWith({
    LoginStatus? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
