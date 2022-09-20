import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../constant/config.dart';
import '../helpers/http_helper.dart';
import '../models/movie.dart';
import '../models/movies.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Config.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(HttpHelper().getDioInterceptor());
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET("movie/{movie_id}")
  Future<Movie> getMovieDetail(
    @Path("movie_id") int movieId,
    @Query("api_key") String apiKey,
  );

  @GET("movie/now_playing")
  Future<Movies> getMovieNowPlaying(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("page") int page,
  );

  @GET("movie/upcoming")
  Future<Movies> getMovieUpcoming(
    @Query("api_key") String apiKey,
    @Query("language") String language,
    @Query("page") int page,
  );
}
