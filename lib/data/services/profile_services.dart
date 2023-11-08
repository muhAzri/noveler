import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/models/profile/profile_model.dart';

class ProfileServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<ProfileModel> getProfileInfo() async {
    try {
      final response = await dio.apiGet('/v1/profile');

      if (response.statusCode == 200) {
        dynamic data = response.data['data'];

        ProfileModel result = ProfileModel.fromJson(data);
        return result;
      }
      throw response;
    } on DioException catch (error, _) {
      rethrow;
    }
  }
}
