import 'package:carousel_slider/carousel_controller.dart';
import 'package:movie_app/src/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../core/core_view_model.dart';
import '../../../models/movies.dart';
import '../../../network/network_exceptions.dart';
import '../../../network/result_state.dart';
import '../../../services/movie_service.dart';

class HomeViewModel extends FutureViewModel with CoreViewModel {
  final CarouselController controller = CarouselController();
  final _movieService = locator<MovieService>();
  final List<String> images = [
    'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
    'https://images.unsplash.com/photo-1585951237318-9ea5e175b891?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80',
    'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3570&q=80',
    'https://images.unsplash.com/photo-1547130542-00f463cf8c0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
  ];

  int current = 0;
  int pageNowPlaying = 1;
  Movies? nowPlaying;

  @override
  Future futureToRun() => getNowPlaying();

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

  void showMovieList() => navigationService.navigateToMovieListView();
}
