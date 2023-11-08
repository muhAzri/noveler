import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/models/novel/novel_model.dart';

class BookmarkServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<void> addOrRemoveBookmark(String novelID) async {
    try {
      final response = await dio.apiPost('/v1/novel/$novelID/bookmark');

      if (response.statusCode != 200) {
        throw (response);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<NovelModel>> getBookmarks() async {
    try {
      final response = await dio.apiGet('/v1/bookmark');

      if (response.statusCode == 200) {
        final data = response.data['data'];
        List<Map<String, dynamic>> novelData =
            List<Map<String, dynamic>>.from(data);

        List<NovelModel> bookmarksNovel = novelData
            .map((novelMap) => NovelModel.fromJson(novelMap['novel']))
            .toList();

        return bookmarksNovel;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }
}
