import 'package:fast_news_application/app/UI/Home_screen/provider/home_provider.dart';
import 'package:fast_news_application/app/UI/news_detail_screen/news_detail_provider.dart';
import 'package:fast_news_application/app/UI/search_screen/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/app.dart';
import 'Core/flaver_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const Flavor flavor = Flavor.Production;

  FlavorConfig(
    flavor: flavor,
    values: FlavorValues(baseUrl: flavor.baseUrl),
  );
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => NewsDetailProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchProvider(),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
