import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/images.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.background,
        appBar: AppBar(
          backgroundColor: BaseColors.background,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: ClipOval(
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconLocation,
                        width: 18.0,
                      ),
                      horizontalSpace(4.0),
                      Text(
                        'Bandung',
                        style: whiteSemiBoldTextStyle.copyWith(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(
                  iconNotification,
                  width: 24.0,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(42.0),
              SizedBox(
                height: 163.0,
                child: CarouselSlider(
                  items: vm.images
                      .map(
                        (item) => ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              10.0,
                            ),
                          ),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: screenWidth(context),
                          ),
                        ),
                      )
                      .toList(),
                  carouselController: vm.controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      enlargeCenterPage: true,
                      height: 163.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          vm.current = index;
                        });
                      }),
                ),
              ),
              verticalSpace(16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: vm.images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => vm.controller.animateToPage(entry.key),
                    child: Container(
                      width: vm.current == entry.key ? 30.0 : 12.0,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ),
                        color: vm.current == entry.key
                            ? BaseColors.primary
                            : BaseColors.primaryDark,
                      ),
                    ),
                  );
                }).toList(),
              ),
              verticalSpace(34.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now Playing',
                      style: whiteBoldTextStyle.copyWith(
                        fontSize: 24.0,
                      ),
                    ),
                    InkWell(
                      onTap: () => vm.showMovieList(),
                      child: Row(
                        children: [
                          Text(
                            'See all',
                            style: whiteSemiBoldTextStyle.copyWith(
                              fontSize: 10.0,
                              color: BaseColors.white.withOpacity(0.6),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 16.0,
                            color: BaseColors.white.withOpacity(0.6),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
