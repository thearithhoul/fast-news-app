import 'package:dio/dio.dart';
import 'package:fast_news_application/app/Entities/result_state/result_state.dart';
import 'package:flutter/material.dart';

import 'package:html/parser.dart' as html;

class NewsDetailProvider extends ChangeNotifier {
  var resultState = const ResultState.idle();

  Future<void> scrapeArticleContent(String url) async {
    resultState = const ResultState.loading();
    try {
      final dio = Dio()
        ..options.connectTimeout =
            const Duration(milliseconds: Duration.millisecondsPerMinute)
        ..options.receiveTimeout =
            const Duration(milliseconds: Duration.millisecondsPerMinute);

      await dio.get(url).then(
        (response) {
          if (response.statusCode == 200) {
            final document = html.parse(response.data);
            final paragraphs = document.querySelectorAll('p');
            final content = paragraphs.map((p) => p.text).join('\n');

            resultState = ResultState.data(content);
          } else {
            resultState = const ResultState.error("There Something Wrong!");
          }
          notifyListeners();
        },
      );
    } catch (e) {
      resultState = const ResultState.error("There Something Wrong!");
      notifyListeners();
    }
  }
}
