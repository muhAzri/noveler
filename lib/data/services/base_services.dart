import 'package:get_it/get_it.dart';
import 'package:noveler/config/api_client.dart';

class BaseService {
  final ApiClient dio = GetIt.instance<ApiClient>();
  final storage = GetIt.instance<ApiClient>().storage;
}
