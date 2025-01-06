import 'package:flutter/material.dart';

import '../app/UI/main_screen/main_screen.dart';
import 'theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusScopeNode currentFoucus = FocusScope.of(context);
          if (!currentFoucus.hasPrimaryFocus &&
              currentFoucus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: const MainScreen(),
      ),
    );
  }
}
