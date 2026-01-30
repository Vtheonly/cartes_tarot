extension StringExtension on String {
  ///adds a dash between [this] and [str]
  String dash(String str) => "${this}_$str";

  bool equals(String o) => compareTo(o) == 0;
}
