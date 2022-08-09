import 'package:flutter_bloc/flutter_bloc.dart';

class IndexBloc extends Cubit<int> {
  IndexBloc() : super(0);

  void changeIndex(int value) => emit(value);

  resetIndex() {
    emit(0);
  }
}
