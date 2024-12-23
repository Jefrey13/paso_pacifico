import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

const String datetimeFormatPattern = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  String format({
    String pattern = datetimeFormatPattern,
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}
