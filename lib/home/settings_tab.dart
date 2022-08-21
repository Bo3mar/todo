import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/my_theme.dart';
import '../provider/settings_provider.dart';
import '../settings/language_bottom_sheet.dart';
import '../settings/theme_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(

                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(

                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      settingsProvider.currentLang =='en'?'English':'العربية',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Icon(Icons.arrow_drop_down_outlined,size: 25,)
                  ],
                )
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 4,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(

                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).backgroundColor),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      SettingsProvider.currentTheme ==ThemeMode.light
                          ?AppLocalizations.of(context)!.light
                          :AppLocalizations.of(context)!.night,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Icon(Icons.arrow_drop_down_outlined,size: 25,)
                  ],
                ),
    ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return ThemeBottomSheet();
        });
  }
}