import 'package:fast_news_application/Core/Constants/my_text_styte.dart';
import 'package:fast_news_application/app/UI/search_screen/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchTextBox extends StatefulWidget {
  const SearchTextBox({
    super.key,
  });

  @override
  State<SearchTextBox> createState() => _SearchTextBoxState();
}

class _SearchTextBoxState extends State<SearchTextBox>
    with WidgetsBindingObserver {
  bool _isKeyboardVisible = false;
  late TextEditingController tec;
  @override
  void initState() {
    tec = TextEditingController();
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    tec.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final isKeyboardVisible = bottomInset > 0.0;
    if (_isKeyboardVisible != isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = isKeyboardVisible;
      });
    }
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color(0xffF6F6F7),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
            child: TextField(
              controller: tec,
              onSubmitted: (value) {
                final provider =
                    Provider.of<SearchProvider>(context, listen: false);
                provider.callSearchEverything(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: MYTEXTSTYTE.lightRoboto(fontType: FontType.title),
                border: InputBorder.none,
              ),
            ),
          ),
          Visibility(
            visible: _isKeyboardVisible,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 1,
                  indent: 8,
                  endIndent: 8,
                ),
                Container(
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
