import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';
import 'package:noveler/data/models/genre/genre_model.dart';

class GenreServices {
  final ApiClient dio = GetIt.instance<ApiClient>();

  Future<List<GenreModel>> getAllGenresServices() async {
    try {
      final response = await dio.apiGet('/v1/genre');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        List<GenreModel> genres =
            data.map((genre) => GenreModel.fromJson(genre)).toList();

        return genres;
      }
      throw response;
    } catch (error) {
      rethrow;
    }
  }
}
