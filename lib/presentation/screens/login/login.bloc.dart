import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes/data/service/auth_service.dart';
import 'package:yes/presentation/blocs/auth_bloc.dart';

class LoginBloc extends Cubit<LoginState> {
  final AuthBloc authBloc;
  LoginBloc(this.authBloc) : super(LoginState());

  login(String phone, String password) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var res = await AuthService.login(phone, password);
      this.authBloc.setIdentity(res);
      emit(state.copyWith(status: LoginStatus.idle));
    } catch (_) {
      emit(state.copyWith(status: LoginStatus.error));
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

enum LoginStatus { idle, loading, error }
