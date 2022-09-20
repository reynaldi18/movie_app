import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/core_view_model.dart';
import '../../../models/movies.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';
import '../../../services/movie_service.dart';

const String _nowPlayingData = 'delayedNowPlaying';
const String _upcomingData = 'delayedUpcoming';
class MovieListViewModel extends MultipleFutureViewModel with CoreViewModel {
  final _movieService = locator<MovieService>();

  bool get fetchingNowPlaying => busy(_nowPlayingData);

  bool get fetchingUpcoming => busy(_upcomingData);

  int pageNowPlaying = 1;
  int pageUpcoming = 1;
  Movies? nowPlaying;
  Movies? upcoming;

  @override
  Map<String, Future Function()> get futuresMap => {
    _nowPlayingData: getNowPlaying,
    _upcomingData: getUpcoming,
  };

  Future<ResultState<Movies?>> getNowPlaying() async {
    var result = await _movieService.fetchMovieNowPlaying(pageNowPlaying);
    return result.when(
      success: (Movies data) async {
        nowPlaying = data;
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (NetworkExceptions error) async {
        return ResultState.error(error: error);
      },
    );
  }

  Future<ResultState<Movies?>> getUpcoming() async {
    var result = await _movieService.fetchMovieUpcoming(pageUpcoming);
    return result.when(
      success: (Movies data) async {
        upcoming = data;
        notifyListeners();
        return ResultState.data(data: data);
      },
      failure: (NetworkExceptions error) async {
        return ResultState.error(error: error);
      },
    );
  }
}
