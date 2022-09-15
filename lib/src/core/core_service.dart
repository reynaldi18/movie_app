import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class CoreService {
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;
  // ApiService apiService = ApiService(Dio());
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
}
