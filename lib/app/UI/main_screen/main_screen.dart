import 'package:fast_news_application/app/Util/navigation_route.dart';
import 'package:fast_news_application/app/Util/route_name.dart';
import 'package:fast_news_application/app/Util/widget/mydrawer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        NavigationRoute.pop();
      },
      child: Scaffold(
        drawer: const Mydrawer(),
        body: Navigator(
          observers: [HeroController()],
          key: NavigationRoute.globalKey,
          initialRoute: RouteName.homeRoute,
          onGenerateRoute: (settings) {
            return AppGenerateRoute.routes(settings);
          },
        ),
      ),
    );
  }
}
