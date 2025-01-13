import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/app/UI/search_screen/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextBox extends StatelessWidget {
  final TextEditingController tec;
  final bool isshowExtend;
  final void Function(String)? onSubmitted;
  final List<String> histroyList;
  final void Function()? onTap;
  final FocusNode? focusNode;
  const SearchTextBox({
    super.key,
    required this.tec,
    required this.histroyList,
    this.isshowExtend = false,
    this.onTap,
    this.onSubmitted,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xffF6F6F7),
      ),
      child: Consumer<SearchProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                child: TextField(
                  focusNode: focusNode,
                  controller: tec,
                  onTap: onTap,
                  onSubmitted: onSubmitted,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        MYTEXTSTYTE.lightRoboto(fontType: FontType.title),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Visibility(
                visible: isshowExtend,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(
                      height: 1,
                      indent: 8,
                      endIndent: 8,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: histroyList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            histroyList[index],
                            style: MYTEXTSTYTE.mediumRoboto(
                                fontType: FontType.large),
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              value.deleteSearchHistory(index);
                            },
                            child: Text(
                              'remove',
                              style: MYTEXTSTYTE.lightRoboto(
                                  fontType: FontType.lable),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
