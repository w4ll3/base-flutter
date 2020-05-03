import 'package:baseproject/core/localizations/app_localizations.dart';
import 'package:intl/intl.dart';

class DateParser {
  static const String DATE_FORMAT = 'yyyy-MM-dd';
  static String getWrittenDate(DateTime date, context) {
    return '''${date.day} de ${_getMonthName(date.month, context)} de ${date.year}''';
  }

  static String getWrittenMonthYear(DateTime date, context) {
    return '${date.month} ${_getMonthName(0, context)}, ${date.year}';
  }

  static DateTime getDateTime(String date) {
    return date != null ? DateFormat(DATE_FORMAT).parse(date) : date;
  }

  static String getDateString(DateTime date) {
    return date != null ? DateFormat(DATE_FORMAT).format(date) : '';
  }

  static String _getMonthName(int month, context) {
    switch (month) {
      case 00:
        return AppLocalizations.of(context).trans('default.month.label');
      case 01:
        return AppLocalizations.of(context).trans('default.month.january');
      case 02:
        return AppLocalizations.of(context).trans('default.month.february');
      case 03:
        return AppLocalizations.of(context).trans('default.month.march');
      case 04:
        return AppLocalizations.of(context).trans('default.month.april');
      case 05:
        return AppLocalizations.of(context).trans('default.month.may');
      case 06:
        return AppLocalizations.of(context).trans('default.month.june');
      case 07:
        return AppLocalizations.of(context).trans('default.month.july');
      case 08:
        return AppLocalizations.of(context).trans('default.month.august');
      case 09:
        return AppLocalizations.of(context).trans('default.month.september');
      case 10:
        return AppLocalizations.of(context).trans('default.month.octuber');
      case 11:
        return AppLocalizations.of(context).trans('default.month.november');
      case 12:
        return AppLocalizations.of(context).trans('default.month.december');
      default:
        return 'Invalid month';
    }
  }
}
