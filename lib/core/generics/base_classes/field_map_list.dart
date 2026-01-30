import 'package:cartes_tarot/core/extensions/string_extensions.dart';

import 'typed_list.dart';
import 'field_map.dart';

abstract class FieldMapList<T> extends TypedList<FieldMap<T>> {
  const FieldMapList({required super.values});

  T getValue(String name) =>
      values.firstWhere((e) => e.name.equals(name)).value;
}
