import '../generics/classes/multi_lang_string.dart';
import '../generics/classes/multi_lang_string_list.dart';

abstract class DateTimeUtils {
  MultiLangStringList get allDays;
  MultiLangStringList get allMonths;
  MultiLangString getMonthOf(DateTime dateTime);
}

class DateTimeUtilsImpl implements DateTimeUtils {
  const DateTimeUtilsImpl();

  @override
  MultiLangStringList get allDays => const MultiLangStringList(values: [
        MultiLangString(ar: "Saturday", en: "Saturday", fr: "Samedi"),
        MultiLangString(ar: "Sunday", en: "Sunday", fr: "Dimanche"),
        MultiLangString(ar: "Monday", en: "Monday", fr: "Lundi"),
        MultiLangString(ar: "Tuesday", en: "Tuesday", fr: "Mardi"),
        MultiLangString(ar: "Wednesday", en: "Wednesday", fr: "Mercredi"),
        MultiLangString(ar: "Thirsday", en: "Thirsday", fr: "Jeudi"),
        MultiLangString(ar: "Friday", en: "Friday", fr: "Vendredi"),
      ]);

  @override
  MultiLangStringList get allMonths => const MultiLangStringList(values: [
        MultiLangString(ar: "January", en: "January", fr: "Janvier"),
        MultiLangString(ar: "February", en: "February", fr: "Février"),
        MultiLangString(ar: "March", en: "March", fr: "Mars"),
        MultiLangString(ar: "April", en: "April", fr: "Avril"),
        MultiLangString(ar: "May", en: "May", fr: "Mai"),
        MultiLangString(ar: "June", en: "June", fr: "Juin"),
        MultiLangString(ar: "July", en: "July", fr: "Juillet"),
        MultiLangString(ar: "August", en: "August", fr: "Aout"),
        MultiLangString(ar: "September", en: "September", fr: "Septembre"),
        MultiLangString(ar: "October", en: "October", fr: "Octobre"),
        MultiLangString(ar: "November", en: "November", fr: "Novembre"),
        MultiLangString(ar: "December", en: "December", fr: "Decembre"),
      ]);

  @override
  MultiLangString getMonthOf(DateTime dateTime) =>
      allMonths.values.elementAt(dateTime.month - 1);
}
