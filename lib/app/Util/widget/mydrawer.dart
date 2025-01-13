import 'package:fast_news_application/Core/Constants/color_constants.dart';
import 'package:fast_news_application/Core/Constants/image_constants.dart';
import 'package:fast_news_application/Core/Constants/init_value.dart';
import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/Core/enum/lang_enum.dart';
import 'package:fast_news_application/app/UI/Home_screen/provider/home_provider.dart';
import 'package:fast_news_application/app/Util/language.dart';
import 'package:fast_news_application/app/Util/widget/language_popup_dialog.dart';
import 'package:fast_news_application/app/helper/flag_mapper.dart';
import 'package:fast_news_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constants/icon_constants.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: ColorConstants.drawerColor,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.black,
                ),
                Consumer2<Language, HomeProvider>(
                  builder: (context, value, value2, child) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: InitValue.drawerList.length + 1,
                      itemBuilder: (context, index) {
                        if (InitValue.drawerList.length == index) {
                          return _buildLangWidget(context, value, value2);
                        } else {
                          return Container();
                        }
                      },
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Version 1.0',
                style: MYTEXTSTYTE.boldRoboto(fontType: FontType.lable),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_buildLangWidget(BuildContext context, Language value, HomeProvider value2) {
  return Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: ColorConstants.blue,
      borderRadius: BorderRadius.circular(8),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(8.0),
      leading: SvgPicture.asset(IconConstants.languageIcon),
      title: Text(
        S.of(context).Language,
        style: MYTEXTSTYTE.mediumRoboto(
            fontType: FontType.title, color: Colors.white),
      ),
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) {
            return const LanguagePopupDialog();
          },
        ).then(
          (result) async {
            if (result == value.localeSelected) {
              String temp = (result as LangEnum).langStr;

              await value2.callTopHeadlineNews(
                  country: temp == 'en' ? 'us' : temp, isBuildInit: false);
            }
          },
        );
      },
      trailing: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(
                    FlagMapper.flagMapping[value.localeSelected] ??
                        ImageConstants.enFlag))),
      ),
    ),
  );
}
