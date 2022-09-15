import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import 'splash_screen_viewmodel.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
      builder: (context, vm, child) => const Scaffold(
        backgroundColor: BaseColors.background,
        body: Center(
          child: Text('TEST')
        ),
      ),
      viewModelBuilder: () => SplashScreenViewModel(),
    );
  }
}
