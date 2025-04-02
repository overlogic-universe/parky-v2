import 'package:flutter/material.dart';

import '../constants/common/locale_id_constant.dart';

class L10n {
  const L10n._();

  static final all = [
    const Locale(LocaleIdConstant.ID),
    const Locale(LocaleIdConstant.EN),
    // TODO: Menambahkan Locale ID yang disupport oleh aplikasi
  ];
}
