import 'package:flutter/material.dart';

import 'src/app/app.locator.dart';
import 'src/my_app.dart';

Future main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    return runApp(const MyApp());
  } catch (error) {
    // print('$error & $stacktrace');
  }
}