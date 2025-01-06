import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:fast_news_application/app/Util/navigation_route.dart';
import 'package:fast_news_application/app/Util/route_name.dart';
import 'package:flutter/material.dart';

class NewsSlider extends StatefulWidget {
  final List<Everything> topNews;
  const NewsSlider({super.key, required this.topNews});

  @override
  State<NewsSlider> createState() => _NewsSliderState();
}

class _NewsSliderState extends State<NewsSlider> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    final list = widget.topNews;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: list.isNotEmpty ? 5 : list.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                if (list.isNotEmpty) {
                  NavigationRoute.pushName(RouteName.newsDetailRoute,
                      arg: {"index": index, "data": list[index]});
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, blurRadius: 4, spreadRadius: 1),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: list.isNotEmpty
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            cacheKey: list[index].urlToImage,
                            list[index].urlToImage,
                          ),
                        )
                      : null,
                ),
                child: list.isNotEmpty
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${list[index].author} ',
                                style: MYTEXTSTYTE.lightRoboto(
                                    fontType: FontType.lable,
                                    color: Colors.white),
                              ),
                              Text(
                                list[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: MYTEXTSTYTE.lightRoboto(
                                    fontType: FontType.title,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
            );
          },
          options: CarouselOptions(
              height: 150,
              initialPage: 0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currIndex = index;
                });
              },
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              enlargeFactor: 0.2),
        ),
        const SizedBox(
          height: 5.0,
        ),
        _indecator(currIndex),
      ],
    );
  }
}

_indecator(
  int currIndex,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      5,
      (index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: AnimatedContainer(
            height: 10,
            width: currIndex == index ? 50 : 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: currIndex == index ? Colors.blue : Colors.grey[300],
            ),
            duration: const Duration(milliseconds: 400),
          ),
        );
      },
    ),
  );
}
