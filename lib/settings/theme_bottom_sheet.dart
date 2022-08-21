import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../provider/settings_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.light);
              },
              child: SettingsProvider.currentTheme== ThemeMode.light
                  ? getSelectedItem(AppLocalizations.of(context)!.light)
                  : getUnSelectedItem(AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(ThemeMode.dark);
              },
              child: SettingsProvider.currentTheme== ThemeMode.dark
                  ? getSelectedItem(AppLocalizations.of(context)!.night)
                  : getUnSelectedItem(AppLocalizations.of(context)!.night))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.headline5),
      ],
    );
  }
}