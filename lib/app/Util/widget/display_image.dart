import 'package:cached_network_image/cached_network_image.dart';
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
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: CachedNetworkImageProvider(
            cacheKey: urlImage,
            urlImage,
          ),
        ),
      ),
    );
  }
}
