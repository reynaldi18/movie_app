import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';

class HttpHelper {
  final navigationService = locator<NavigationService>();
  BuildContext? currentContext = StackedService.navigatorKey?.currentContext;

  var logger = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  getDioInterceptor() => InterceptorsWrapper(
        onRequest: (options, handler) {
          try {
            options.headers = {
              'Content-Type': Headers.jsonContentType,
            };
            logger.i(
                "${options.headers}\n${options.queryParameters}\n${options.data}");
            logger.i("${options.headers['Authorization']}");

            return handler.next(options);
          } catch (e) {
            logger.e("$options");
            return handler.next(options);
          }
        },
        onResponse: (response, handler) {
          try {
            logger.i(
                "${response.headers}\n${response.requestOptions}\n${response.requestOptions.baseUrl}");
            logger.i(
                "${response.requestOptions.baseUrl}\n${response.statusCode}\n${response.data}");
            return handler.next(response);
          } catch (e) {
            logger.e("$response");
            return handler.next(response);
          }
        },
        onError: (DioError e, handler) {
          logger.e("$e");
          logger.e("${e.response}");
          return handler.next(e);
        },
      );
}
