import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/settings_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    // change lang
                    settingsProvider.changeLanguage('en');
                  },
                  child: settingsProvider.currentLang == 'en'
                      ? getSelectedItem('English')
                      : getUnSelectedItem('الإنجليزية')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    settingsProvider.changeLanguage('ar');
                  },
                  child: settingsProvider.currentLang == 'ar'
                      ? getSelectedItem('العربيه')
                      : getUnSelectedItem('Arabic')),
            ],
          )
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
