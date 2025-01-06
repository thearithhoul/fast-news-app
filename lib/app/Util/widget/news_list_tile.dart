import 'package:fast_news_application/app/Entities/everything_model/everything.dart';
import 'package:flutter/material.dart';

import '../../../Core/Constants/my_text_styte.dart';
import 'display_image.dart';

class NewsListTile extends StatelessWidget {
  final Everything model;
  final int index;
  const NewsListTile({super.key, required this.model, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Hero(
              tag: index,
              child: DisplayImage(urlImage: model.urlToImage),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.source.name,
                  style: MYTEXTSTYTE.mediumRoboto(fontType: FontType.lable),
                ),
                Text(
                  model.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MYTEXTSTYTE.boldRoboto(
                    fontType: FontType.title,
                  ),
                ),
                FractionallySizedBox(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${model.author} •',
                          overflow: TextOverflow.ellipsis,
                          style: MYTEXTSTYTE.mediumRoboto(
                              fontType: FontType.lable),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          ' ${model.publishedAt}',
                          overflow: TextOverflow.ellipsis,
                          style: MYTEXTSTYTE.mediumRoboto(
                              fontType: FontType.lable),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
