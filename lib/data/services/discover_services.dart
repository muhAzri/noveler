import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/models/novel/novel_model.dart';

class DiscoverServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<List<NovelModel>> getNewestNovel() async {
    try {
      final response = await dio.apiGet('/v1/novel/newest');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        List<NovelModel> newestNovel =
            data.map((novelData) => NovelModel.fromJson(novelData)).toList();

        return newestNovel;
      }
      throw response;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<NovelModel>> getNewUpdatedNovel() async {
    try {
      final response = await dio.apiGet('/v1/novel/updated');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        List<NovelModel> newestNovel =
            data.map((novelData) => NovelModel.fromJson(novelData)).toList();

        return newestNovel;
      }
      throw response;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<NovelModel>> getBestNovel() async {
    try {
      final response = await dio.apiGet('/v1/novel/best');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        List<NovelModel> newestNovel =
            data.map((novelData) => NovelModel.fromJson(novelData)).toList();

        return newestNovel;
      }
      throw response;
    } catch (error) {
      rethrow;
    }
  }
}
