import 'package:flutter/material.dart';

import '../../../Core/Constants/my_text_styte.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? ontap;
  const TitleWidget({
    super.key,
    required this.title,
    this.ontap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MYTEXTSTYTE.boldRoboto(
              fontType: FontType.header,
            ),
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              'View all',
              style: MYTEXTSTYTE.boldRoboto(
                  fontType: FontType.lable, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
