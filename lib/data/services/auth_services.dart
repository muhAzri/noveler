import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/form_model/login_form_model.dart';
import 'package:noveler/data/form_model/register_form_model.dart';

class AuthServices {
  final ApiClient dio = GetIt.instance<ApiClient>();
  final storage = GetIt.instance<ApiClient>().storage;

  Future<Response> loginUser(LoginFormModel model) async {
    try {
      final response = await dio.apiPost('/v1/sessions', data: model.toJson());


      if (response.statusCode == 200) {
        final data = response.data['data'];
        await storage.write(key: 'token', value: data['access_token']);
        await storage.write(key: 'refresh_token', value: data['refresh_token']);
        return response;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerUser(RegisterFormModel model) async {
    try {
      final response = await dio.apiPost('/v1/register', data: model.toJson());

      if (response.statusCode == 200) {
        final data = response.data['data'];
        await storage.write(key: 'token', value: data['access_token']);
        await storage.write(key: 'refresh_token', value: data['refresh_token']);
        return response;
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refreshSession() async {
    final refreshToken = await storage.read(key: 'refresh_token');
    try {
      final response = await dio.apiPost('/v1/sessions/refresh',
          data: {"refresh_token": refreshToken});

      if (response.statusCode == 200) {
        final data = response.data['data'];
        await storage.write(key: 'token', value: data['access_token']);
      } else {
        throw response;
      }
    } catch (e) {
      rethrow;
    }
  }
}
