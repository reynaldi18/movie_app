import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/images.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';
import '../item_now_playing.dart';
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
                height: 183.0,
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
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      height: 183.0,
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
              ),
              verticalSpace(28.0),
              SizedBox(
                height: 260.0,
                child: vm.isBusy
                    ? const Center(child: CircularProgressIndicator())
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: vm.nowPlaying?.results?.length,
                          itemBuilder: (context, index) {
                            var item = vm.nowPlaying?.results?[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 20.0 : 0.0,
                                right: 20.0,
                              ),
                              child: ItemNowPlaying(movie: item!),
                            );
                          },
                        ),
                      ),
              ),
              verticalSpace(18.0),
              Divider(
                color: BaseColors.white.withOpacity(0.25),
                thickness: 1.0,
                height: 0.0,
              ),
              verticalSpace(12.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News',
                      style: whiteBoldTextStyle.copyWith(
                        fontSize: 24.0,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
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
              ),
              verticalSpace(28.0),
              SizedBox(
                height: 147.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: vm.images.length,
                    itemBuilder: (context, index) {
                      var item = vm.images[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 20.0 : 0.0,
                          right: 20.0,
                        ),
                        child: SizedBox(
                          width: 255.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                  BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress,
                                  ) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              verticalSpace(32.0),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
