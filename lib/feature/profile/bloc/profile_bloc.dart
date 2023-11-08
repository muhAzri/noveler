import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/models/profile/profile_model.dart';
import 'package:noveler/data/services/profile_services.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileServices services = GetIt.instance<ProfileServices>();

  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileInfoEvent>((event, emit) async {
      try {
        emit(ProfileLoading());

        final info = await services.getProfileInfo();

        emit(ProfileSuccess(info));
      } catch (e) {
        if (e is DioException) {
          emit(ProfileFailed(e.response?.data['error']));
          return;
        }
        emit(const ProfileFailed("Unexpected error"));
      }
    });
  }
}
