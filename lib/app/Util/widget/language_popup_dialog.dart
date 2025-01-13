import 'package:fast_news_application/Core/Constants/color_constants.dart';
import 'package:fast_news_application/Core/Constants/init_value.dart';
import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/app/Util/language.dart';
import 'package:fast_news_application/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/enum/lang_enum.dart';

class LanguagePopupDialog extends StatefulWidget {
  const LanguagePopupDialog({super.key});

  @override
  State<LanguagePopupDialog> createState() => _LanguagePopupDialogState();
}

class _LanguagePopupDialogState extends State<LanguagePopupDialog> {
  List<LanguageObj> langList = InitValue.langSupportsList;
  late LangEnum templang;

  @override
  void initState() {
    final provider = Provider.of<Language>(context, listen: false);
    templang = provider.localeSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<Language>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      S.of(context).Language,
                      style: MYTEXTSTYTE.boldRoboto(
                        fontType: FontType.large,
                      ),
                    ),
                  ),
                  Wrap(
                      children: List.generate(
                    langList.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          value.changeLanguage(langList[index].langCode);
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(4.0),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(langList[index].flagImg),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: langList[index].langCode ==
                                  value.localeSelected,
                              child: const Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(
                                  Icons.check_circle,
                                  color: ColorConstants.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          value.changeLanguage(templang);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: MYTEXTSTYTE.mediumRoboto(
                              fontType: FontType.title),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.blue),
                        onPressed: () {
                          Navigator.pop(context, value.localeSelected);
                        },
                        child: Text(
                          'OK',
                          style: MYTEXTSTYTE.mediumRoboto(
                              fontType: FontType.title, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
