import 'package:stacked/stacked_annotations.dart';

import '../core/core_service.dart';
import '../models/movie.dart';
import '../models/movies.dart';
import '../network/api_result.dart';
import '../network/network_exceptions.dart';

@LazySingleton()
class MovieService extends CoreService {
  Future<ApiResult<Movie>> fetchMovieDetail(int movieId) async {
    try {
      var result = await apiService.getMovieDetail(
        movieId,
        apiKey,
      );
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<Movies>> fetchMovieNowPlaying(int page) async {
    try {
      var result = await apiService.getMovieNowPlaying(
        apiKey,
        language,
        page,
      );
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<Movies>> fetchMovieUpcoming(int page) async {
    try {
      var result = await apiService.getMovieUpcoming(
        apiKey,
        language,
        page,
      );
      return ApiResult.success(data: result);
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }
}
