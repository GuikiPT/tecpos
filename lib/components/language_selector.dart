import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageSelectorDialog extends StatelessWidget {
  const LanguageSelectorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final supportedLocales = context.supportedLocales;

    return SingleChildScrollView(
      child: ListBody(
        children: supportedLocales.map(
          (locale) {
            String label;
            switch (locale.languageCode) {
              case 'pt':
                label = tr('languages.pt');
                break;
              case 'en':
                label = 'English';
                break;
              default:
                label = locale.languageCode;
                break;
            }
            return ListTile(
              leading: SvgPicture.asset(
                'assets/flags/${locale.languageCode}.svg',
                width: 24,
              ),
              title: Text(label),
              onTap: () {
                context.setLocale(locale);
                Navigator.pop(context);
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;
    String currentLanguageName = tr('languages.${currentLocale.languageCode}');

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/flags/${currentLocale.languageCode}.svg',
          width: 24,
        ),
        const SizedBox(width: 30),
        Text(currentLanguageName),
        const Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
