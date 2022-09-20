import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/shared/styles.dart';
import 'package:movie_app/src/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../item_movie.dart';
import 'movie_list_viewmodel.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieListViewModel>.reactive(
      builder: (context, vm, child) => Scaffold(
        backgroundColor: BaseColors.background,
        appBar: AppBar(
          backgroundColor: BaseColors.primaryDark,
          elevation: 0,
          automaticallyImplyLeading: false,
          leadingWidth: 74.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: BaseColors.white,
            ),
            onPressed: () => vm.back(),
          ),
          title: Text(
            'Movie List',
            style: whiteSemiBoldTextStyle.copyWith(
              fontSize: 18.0,
            ),
          ),
        ),
        body: Column(
          children: [
            verticalSpace(18.0),
            Container(
              height: 38.0,
              width: 264.0,
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: BaseColors.grey.withOpacity(0.25),
                borderRadius: BorderRadius.circular(
                  8.0,
                ),
              ),
              child: TabBar(
                isScrollable: false,
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: BaseColors.primary,
                ),
                labelColor: BaseColors.white,
                labelStyle: whiteRegularTextStyle.copyWith(
                  fontSize: 11.0,
                ),
                unselectedLabelColor: BaseColors.white.withOpacity(0.6),
                unselectedLabelStyle: blackRegularTextStyle.copyWith(
                  fontSize: 11.0,
                ),
                tabs: const [
                  Tab(text: 'Now Playing'),
                  Tab(text: 'Coming Soon'),
                ],
              ),
            ),
            verticalSpace(24.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  vm.fetchingNowPlaying
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: vm.nowPlaying?.results?.length,
                          itemBuilder: (context, index) {
                            var item = vm.nowPlaying?.results?[index];
                            return ItemMovie(movie: item!);
                          },
                        ),
                  vm.fetchingUpcoming
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: vm.upcoming?.results?.length,
                          itemBuilder: (context, index) {
                            var item = vm.upcoming?.results?[index];
                            return ItemMovie(movie: item!);
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => MovieListViewModel(),
    );
  }
}
