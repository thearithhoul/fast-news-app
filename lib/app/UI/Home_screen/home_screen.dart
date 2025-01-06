import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/UI/Home_screen/provider/home_provider.dart';
import 'package:fast_news_application/app/Util/navigation_route.dart';
import 'package:fast_news_application/app/Util/route_name.dart';
import 'package:fast_news_application/app/Util/widget/circle_button.dart';
import 'package:fast_news_application/app/Util/widget/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constants/icon_constants.dart';
import '../../Util/widget/loading_lattie.dart';
import '../../Util/widget/news_list_tile.dart';
import '../../Util/widget/news_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.callEverythingNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleButton(
            svgIcon: IconConstants.menuIcon,
            onPressed: () {},
          ),
        ),
        actions: [
          CircleButton(
            svgIcon: IconConstants.searchIcon,
            onPressed: () {
              NavigationRoute.pushName(RouteName.searchRoute);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleButton(
              svgIcon: IconConstants.notification,
              onPressed: () {},
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  TitleWidget(
                    title: 'Breaking News',
                    ontap: () {},
                  ),
                  NewsSlider(
                    topNews: value.topNews,
                  ),
                  TitleWidget(
                    title: 'Recommendation',
                    ontap: () {},
                  ),
                  value.resultState.when(
                    idle: () => Container(),
                    loading: () => const LoadingLattie(),
                    data: (data) {
                      final List<Everything> list = data;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              NavigationRoute.pushName(
                                  RouteName.newsDetailRoute,
                                  arg: {"index": index, "data": list[index]});
                            },
                            child: _listTile(context, list[index], index),
                          );
                        },
                      );
                    },
                    error: (error) => SizedBox(
                      child: Text(error.toString()),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

_listTile(BuildContext context, Everything model, int index) {
  return NewsListTile(
    model: model,
    index: index,
  );
}
