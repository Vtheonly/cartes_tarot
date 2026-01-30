import 'package:flutter/foundation.dart';

import '../../error/exceptions/cache_exception.dart';
import '../../generics/base_classes/typed_list.dart';

abstract class ItemsCacheDataSource<T, TList extends TypedList<T>> {
  /// Throws [CacheException] if no cached data is present.
  TList get(bool Function(T) test);

  /// Throws [CacheException] if no cached data is present (zero items removed).
  void pop(bool Function(T) test);
  void push(TList items, {required bool Function(T, T) updateTest});

  /// Throws [CacheException] if no cached data is present.
  TList getAll();

  /// Throws [CacheException] if no cached data is present.
  void popAll();
}

abstract class ItemsCacheDataSourceImpl<T, TList extends TypedList<T>>
    implements ItemsCacheDataSource<T, TList> {
  final List<T> cachedData;

  ItemsCacheDataSourceImpl({required this.cachedData});

  @override
  @mustCallSuper
  TList get(bool Function(T) test) {
    List<T> items = [];
    for (final item in cachedData) {
      if (test(item)) items.add(item);
    }
    if (items.isEmpty) throw CacheException();
    return constructList(items);
  }

  @override
  @mustCallSuper
  void pop(bool Function(T) test) {
    List<T> items = get(test).values;
    for (final item in items) {
      cachedData.remove(item);
    }
  }

  @override
  @mustCallSuper
  TList getAll() => get((_) => true);

  @override
  @mustCallSuper
  void popAll() => pop((_) => true);

  @override
  @mustCallSuper
  void push(TList items, {required bool Function(T, T) updateTest}) {
    for (final item in items.values) {
      _pushItem(item, updateTest: updateTest);
    }
  }

  void _pushItem(T item, {required bool Function(T, T) updateTest}) {
    final index = cachedData.indexWhere((e) => updateTest(item, e));
    if (index != -1) {
      cachedData[index] = item;
    } else {
      cachedData.add(item);
    }
  }

  TList constructList(List<T> items);
}
