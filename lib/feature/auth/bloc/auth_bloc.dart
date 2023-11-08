import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/form_model/login_form_model.dart';
import 'package:noveler/data/form_model/register_form_model.dart';
import 'package:noveler/data/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices services = GetIt.instance<AuthServices>();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoading());

        final response = await services.loginUser(event.model);

        emit(AuthSuccess(response: response));
      } catch (e) {
        if (e is DioException) {
          emit(AuthFailed(error: e.response?.data['error']));
          return;
        }
        emit(const AuthFailed(error: "Unexpected error"));
      }
    });

    on<RegisterEvent>((event, emit) async {
      try {
        emit(AuthLoading());

        final response = await services.registerUser(event.model);

        emit(AuthSuccess(response: response));
      } catch (e) {
        if (e is DioException) {
          emit(AuthFailed(error: e.response?.data['error']));
          return;
        }
        emit(const AuthFailed(error: "Unexpected error"));
      }
    });
  }
}
