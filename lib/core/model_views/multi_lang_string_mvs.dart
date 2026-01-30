import '../generics/classes/multi_lang_string.dart';
import 'base/mv_n1_m1.dart';

class MultiLangStringMV extends MV<MultiLangString> {
  const MultiLangStringMV({required MultiLangString multiLangString})
      : super(e: multiLangString);

  MultiLangStringMV1 get mv1 => MultiLangStringMV1(e);
}

class MultiLangStringMV1 extends MV<MultiLangString> {
  const MultiLangStringMV1(MultiLangString e) : super(e: e);

  String get propreLanguage => e.en;
}
