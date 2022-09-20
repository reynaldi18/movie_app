import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../network/api_service.dart';

class CoreService {
  ApiService apiService = ApiService(Dio());
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;
  String apiKey = "YOUR_API_KEY";
  String language = "en-US";
  final navigationService = locator<NavigationService>();
  final snackBarService = locator<SnackbarService>();
}
