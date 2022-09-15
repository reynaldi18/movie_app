import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/images.dart';
import '../../shared/styles.dart';
import '../blank_view.dart';
import '../home/home_view.dart';
import 'main_viewmodel.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: vm.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: getViewForIndex(vm.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: BaseColors.primaryDark,
          currentIndex: vm.currentIndex,
          selectedItemColor: BaseColors.primaryDark,
          unselectedItemColor: BaseColors.primaryDark,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          selectedLabelStyle: mainRegularTextStyle.copyWith(
            fontSize: overline,
          ),
          unselectedLabelStyle: blackRegularTextStyle.copyWith(
            fontSize: overline,
          ),
          onTap: vm.setIndex,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  iconHome,
                  width: 24.0,
                  color: BaseColors.white,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  iconHome,
                  width: 24.0,
                  color: BaseColors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  iconTicket,
                  width: 24.0,
                  color: BaseColors.white,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  iconTicket,
                  width: 24.0,
                  color: BaseColors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  iconCity,
                  width: 24.0,
                  color: BaseColors.white,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  iconCity,
                  width: 24.0,
                  color: BaseColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const BlankView();
      case 2:
        return const BlankView();
      default:
        return const BlankView();
    }
  }
}
