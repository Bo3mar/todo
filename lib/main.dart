import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/my_theme.dart';
import 'package:todo/provider/settings_provider.dart';
import 'home/home_screen.dart';


void main()
{
  runApp(ChangeNotifierProvider(create:(context) => SettingsProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
var provider =Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(), //=HomeScreen.routeName:(context)=>HomeScreen()
      },
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      locale: Locale(provider.currentLang),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

    );
  }
}
