import 'package:fast_news_application/app/UI/news_detail_screen/news_detail_screen.dart';
import 'package:fast_news_application/app/UI/search_screen/search_screen.dart';
import 'package:fast_news_application/app/Util/route_name.dart';
import 'package:flutter/material.dart';

import '../UI/Home_screen/home_screen.dart';

class NavigationRoute {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  static void pushName(String routeName, {Object? arg}) {
    globalKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  static void pop() {
    bool? canpop = globalKey.currentState?.canPop();
    if (canpop != null && canpop) {
      globalKey.currentState?.pop();
    } else {
      return;
    }
  }
}

class AppGenerateRoute {
  static MaterialPageRoute routes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case RouteName.newsDetailRoute:
        return MaterialPageRoute(
          builder: (context) {
            return NewsDetailScreen(
              data: settings.arguments as Map,
            );
          },
        );
      case RouteName.searchRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SearchScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
    }
  }
}
