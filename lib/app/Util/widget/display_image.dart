import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_news_application/Core/Constants/image_constants.dart';
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String urlImage;
  const DisplayImage({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        cacheKey: urlImage,
        useOldImageOnUrlChange: true,
        imageUrl: urlImage,
        placeholder: (context, url) => Image.asset(
          ImageConstants.defaultImage,
          fit: BoxFit.fitHeight,
        ),
        errorWidget: (context, url, error) {
          return Image.asset(
            ImageConstants.defaultImage,
            fit: BoxFit.fitHeight,
          );
        },
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
