import 'dart:async';

import 'package:movie_app/src/app/app.router.dart';
import 'package:stacked/stacked.dart';

import '../../../core/core_view_model.dart';

class SplashScreenViewModel extends FutureViewModel with CoreViewModel {
  final _duration = const Duration(seconds: 2);
  String? version;

  @override
  Future futureToRun() => versionCheck();

  Future versionCheck() async {
    Timer(_duration, showDashboard);
  }

  void showDashboard() => navigationService.navigateToMainView();
}
