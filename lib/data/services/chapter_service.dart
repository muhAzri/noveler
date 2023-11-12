import 'package:dio/dio.dart';
import 'package:noveler/data/models/chapter/chapter_model.dart';
import 'package:noveler/data/services/base_services.dart';

class ChapterService extends BaseService {
  Future<List<Chapter>> getChaptersList(String novelID) async {
    try {
      final response = await dio.apiGet('/v1/novel/$novelID/chapters');

      if (response.statusCode == 200) {
        final data = response.data['data'];
        List<Map<String, dynamic>> chapters =
            List<Map<String, dynamic>>.from(data);

        List<Chapter> bookmarksNovel =
            chapters.map((chapter) => Chapter.fromJson(chapter)).toList();

        return bookmarksNovel;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }

  Future<ChapterDetail> getChapterDetail(String chapterID) async {
    try {
      final response = await dio.apiGet('/v1/chapter/$chapterID/detail');

      if (response.statusCode == 200) {
        final data = response.data['data'];

        final detail = ChapterDetail.fromJson(data);
        return detail;
      }

      throw response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getChapterHTML(String htmlURI) async {
    try {
      final response = await Dio().get("https://$htmlURI");

      if (response.statusCode == 200) {
        return response.data;
      }
      throw response;
    } catch (e) {
      rethrow;
    }
  }
}
