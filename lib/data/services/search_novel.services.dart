import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/form_model/search_form_model.dart';
import 'package:noveler/data/models/novel/novel_model.dart';

class SearchNovelServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<List<NovelModel>> searchNovel(SearchFormModel searchParams) async {
    try {
      // Create an empty query parameters map
      final queryParameters = <String, dynamic>{};

      // Add non-null query parameters based on the searchParams
      if (searchParams.title != null && searchParams.title!.isNotEmpty) {
        queryParameters['title'] = searchParams.title;
      }
      if (searchParams.status != null) {
        queryParameters['status'] = searchParams.status;
      }
      if (searchParams.genres != null) {
        queryParameters['genres'] = searchParams.genres;
      }
      if (searchParams.page != null) {
        queryParameters['page'] = searchParams.page;
      }
      if (searchParams.pageSize != null) {
        queryParameters['pageSize'] = searchParams.pageSize;
      }

      final response =
          await dio.apiGet('/v1/novel/search', data: queryParameters);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        List<NovelModel> searchResults =
            data.map((novelData) => NovelModel.fromJson(novelData)).toList();

        return searchResults;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }
}
