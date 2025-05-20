import 'package:intl/intl.dart';

class DateTimeUtil {
  static String? formatTimeWIB(DateTime? dateTime) {
    if (dateTime == null) return null;
    return "${DateFormat('HH:mm', 'id_ID').format(dateTime)} WIB";
  }

  static String? formatDayID(DateTime? dateTime) {
    if (dateTime == null) return null;
    return DateFormat('d MMM yyyy', 'id_ID').format(dateTime);
  }

  static bool isToday(String? dayNameEnglish) {
    if (dayNameEnglish == null) return false;

    final now = DateTime.now();
    final todayName = DateFormat(
      'EEEE',
      'en_US',
    ).format(now);

    return dayNameEnglish.toLowerCase() == todayName.toLowerCase();
  }
}
