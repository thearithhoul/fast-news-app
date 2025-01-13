import 'package:fast_news_application/app/Util/language.dart';
import 'package:fast_news_application/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final localeProvider = Provider.of<Language>(context);

    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: localeProvider.locale,
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
