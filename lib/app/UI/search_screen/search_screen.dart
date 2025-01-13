import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/Core/enum/lang_enum.dart';
import 'package:fast_news_application/app/UI/search_screen/search_provider.dart';
import 'package:fast_news_application/app/Util/language.dart';
import 'package:fast_news_application/app/Util/navigation_route.dart';
import 'package:fast_news_application/app/Util/widget/search_text_box.dart';
import 'package:fast_news_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constants/icon_constants.dart';
import '../../../Core/Constants/init_value.dart';
import '../../Entities/everything_model/everything.dart';
import '../../Util/route_name.dart';
import '../../Util/widget/circle_button.dart';
import '../../Util/widget/loading_lattie.dart';
import '../../Util/widget/news_list_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController tecSearch;
  late FocusNode focusNode;
  @override
  void initState() {
    focusNode = FocusNode();
    tecSearch = TextEditingController();
    focusNode.addListener(
      () {
        if (!focusNode.hasFocus) {
          context.read<SearchProvider>().turnOffHistorySearch();
        }
      },
    );
    context.read<SearchProvider>().callTopheadLinesNewsWithFilter();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    tecSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleButton(
            svgIcon: IconConstants.backIcon,
            onPressed: () {
              NavigationRoute.pop();
            },
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer2<SearchProvider, Language>(
                builder: (context, value, value2, child) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _discorverText(context),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Stack(
                          fit: StackFit.loose,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, 60),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _tabBarView(value),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  value.resultState.when(
                                    idle: () => Container(),
                                    loading: () => const LoadingLattie(),
                                    data: (data) {
                                      final List<Everything> list = data;
                                      return ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: list.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              NavigationRoute.pushName(
                                                  RouteName.newsDetailRoute,
                                                  arg: {
                                                    "index": index,
                                                    "data": list[index]
                                                  });
                                            },
                                            child: NewsListTile(
                                              model: list[index],
                                              index: index,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    error: (error) => SizedBox(
                                      child: Text(error.toString()),
                                    ),
                                  ),
                                ],
                              ),
                            ), // Text Search box
                            SearchTextBox(
                              tec: tecSearch,
                              focusNode: focusNode,
                              histroyList: value.searchHistory,
                              isshowExtend: value.isShowSearchbox,
                              onSubmitted: (text) async {
                                await value.callSearchEverything(
                                  text,
                                  language: (value2.localeSelected).langStr,
                                );
                              },
                              onTap: () async {
                                await value.getSearchHistory();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70.0,
                        ),
                      ],
                    ),
                  );
                },
              ))),
    );
  }
}

_tabBarView(SearchProvider provider) {
  return SizedBox(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: InitValue.categorylist.map(
          (e) {
            return InkWell(
              onTap: () {
                provider.seleteCatagory(e);
                provider.callTopheadLinesNewsWithFilter();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: provider.categorySeleted == e.toLowerCase()
                      ? const Color(0xff0A85E4)
                      : const Color(0xffF6F6F7),
                ),
                child: Text(e),
              ),
            );
          },
        ).toList(),
      ),
    ),
  );
}

_discorverText(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).Discover,
        style: MYTEXTSTYTE.boldRoboto(fontType: FontType.extraLarge),
      ),
      const SizedBox(
        height: 4.0,
      ),
      Text(
        S.of(context).NewsFromAllAroundTheWorld,
        style: MYTEXTSTYTE.lightRoboto(fontType: FontType.lable),
      ),
    ],
  );
}
