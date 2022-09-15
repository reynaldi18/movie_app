import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../constant/config.dart';
import '../helpers/http_helper.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptor());
    return _ApiService(dio, baseUrl: baseUrl);
  }
}
