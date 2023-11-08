import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/models/novel/novel_detail_model.dart';
import 'package:noveler/data/models/novel/novel_model.dart';

class NovelDetailServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<NovelDetailModel> getModelDetail(String novelID) async {
    try {
      final response = await dio.apiGet('/v1/novel/$novelID/detail');

      if (response.statusCode == 200) {
        final NovelDetailModel novelDetail = NovelDetailModel.fromJson(
          response.data['data'],
        );

        return novelDetail;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NovelModel>> getRecommendedNovel() async {
    try {
      final response = await dio.apiGet('/v1/novel/recommended');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        List<NovelModel> recommendedNovels =
            data.map((novelData) => NovelModel.fromJson(novelData)).toList();

        return recommendedNovels;
      }
      throw response;
    } catch (error) {
      rethrow;
    }
  }
}
