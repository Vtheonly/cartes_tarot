import '../utils/date_time_utils.dart';
import 'base/mv_n1_m1.dart';

import '../../../injection_container/service_locator.dart';
import 'multi_lang_string_mvs.dart';

class DateTimeMV extends MV<DateTime> {
  const DateTimeMV({required DateTime dateTime}) : super(e: dateTime);

  DateTimeMV1 get mv1 => DateTimeMV1(e);
}

class DateTimeMV1 extends MV<DateTime> {
  const DateTimeMV1(DateTime e) : super(e: e);

  String get formatedDate =>
      "${e.day.toString().padLeft(2, "0")} ${MultiLangStringMV(multiLangString: sl<DateTimeUtils>().getMonthOf(e)).mv1.propreLanguage} ${e.year}";
}
