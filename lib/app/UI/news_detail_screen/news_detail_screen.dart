import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/UI/news_detail_screen/news_detail_provider.dart';
import 'package:fast_news_application/app/Util/navigation_route.dart';
import 'package:fast_news_application/app/Util/widget/loading_lattie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Core/Constants/icon_constants.dart';
import '../../Util/widget/circle_button.dart';

class NewsDetailScreen extends StatefulWidget {
  final Map data;
  const NewsDetailScreen({super.key, required this.data});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _amController;
  late Animation<double> tsTopBox;
  late ScrollController _scrollController;

  late Everything model;

  late int index;

  void listenToScroll() {
    if (_scrollController.offset == 0) {
      _amController.reverse();
    } else {
      _amController.forward();
    }
  }

  @override
  void initState() {
    model = widget.data['data'];
    index = widget.data['index'];
    Provider.of<NewsDetailProvider>(context, listen: false)
        .scrapeArticleContent(model.url);
    _scrollController = ScrollController();
    _amController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    tsTopBox = Tween<double>(begin: 200, end: 100).animate(
      CurvedAnimation(parent: _amController, curve: Curves.easeInOutCubic),
    );
    _scrollController.addListener(listenToScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(listenToScroll);
    _scrollController.dispose();
    _amController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy < 0) {
                _amController.forward();
              } else {
                _amController.reverse();
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              }
            },
            child: AnimatedBuilder(
              animation: tsTopBox,
              builder: (context, child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: CachedNetworkImageProvider(
                              cacheKey: model.urlToImage,
                              model.urlToImage,
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleButton(
                              svgIcon: IconConstants.backIcon,
                              onPressed: () async {
                                NavigationRoute.pop();
                              },
                            ),
                            Row(
                              children: [
                                CircleButton(
                                  svgIcon: IconConstants.externalLinkIcon,
                                  onPressed: () async {
                                    if (!await launchUrl(
                                      Uri.parse(model.url),
                                      mode: LaunchMode.inAppBrowserView,
                                      browserConfiguration:
                                          const BrowserConfiguration(
                                              showTitle: true),
                                    )) {
                                      throw Exception(
                                          'Could not launch ${model.url}');
                                    }
                                  },
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                CircleButton(
                                  svgIcon: IconConstants.moreOptionIcon,
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: tsTopBox.value,
                        child: NotificationListener<OverscrollNotification>(
                          onNotification: (notification) {
                            if (notification.overscroll < 0) {
                              // User is stretching the scrollable past the top
                              _amController.reverse();
                            } else {
                              _amController.forward();
                            }
                            return false;
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.title,
                                        style: MYTEXTSTYTE.boldRoboto(
                                            fontType: FontType.title,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        '${model.author} ${model.publishedAt}',
                                        style: MYTEXTSTYTE.lightRoboto(
                                            fontType: FontType.lable,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Hero(
                                tag: index,
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    child: Consumer<NewsDetailProvider>(
                                      builder: (context, value, child) {
                                        return Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xffF6F6F7),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      IconConstants.perosnIcon,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8.0,
                                                  ),
                                                  Text(
                                                    textAlign: TextAlign.start,
                                                    model.source.name,
                                                    style:
                                                        MYTEXTSTYTE.boldRoboto(
                                                      fontType: FontType.title,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              value.resultState.when(
                                                idle: () => Container(),
                                                loading: () => const Center(
                                                    child: LoadingLattie()),
                                                data: (data) {
                                                  return Text(
                                                    textAlign:
                                                        TextAlign.justify,
                                                    data,
                                                    style: MYTEXTSTYTE
                                                        .mediumRoboto(
                                                      fontType:
                                                          FontType.subtitle,
                                                    ),
                                                  );
                                                },
                                                error: (error) => Container(),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
