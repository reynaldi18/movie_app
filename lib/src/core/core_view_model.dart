import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class CoreViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;

  void back() => navigationService.back();
}
