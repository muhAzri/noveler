import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCubit extends Cubit<int> {
  CreditCubit() : super(10);

  int getCredit() {
    return state;
  }

  void addCredit() {
    emit(state + 10);
  }

  void decreaseCredit() {
    if (state - 1 >= 0) {
      emit(state - 1);
    } else {
      emit(0);
    }
  }
}
