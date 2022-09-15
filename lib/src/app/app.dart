import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/movie_service.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    CupertinoRoute(page: MainView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: MovieService),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
  /** flutter pub run build_runner build --delete-conflicting-outputs */
}
