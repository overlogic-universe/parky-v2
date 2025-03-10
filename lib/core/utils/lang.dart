import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';

class Lang {
  const Lang._();

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}
