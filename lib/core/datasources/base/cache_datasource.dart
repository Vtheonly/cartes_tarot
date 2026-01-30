import 'package:flutter/material.dart';

import '../../error/exceptions/cache_exception.dart';
import '../../generics/base_classes/typed_list.dart';

abstract class CacheDataSource<T, TList extends TypedList<T>> {
  /// Throws [CacheException] if no cached data is present.
  TList getMultiple(bool Function(T) test);

  /// Throws [CacheException] if no cached data is present (zero items removed).
  void popMultiple(bool Function(T) test);
  void pushMultiple(TList items, {required bool Function(T, T) updateTest});

  /// Throws [CacheException] if no cached data is present.
  TList getAll();

  /// Throws [CacheException] if no cached data is present.
  void popAll();

  /// Throws [CacheException] if no cached data is present.
  T get(bool Function(T) test);

  /// Throws [CacheException] if no cached data is present.
  void pop(bool Function(T) test);
  void push(T item, {required bool Function(T, T) updateTest});
}

abstract class CacheDataSourceImpl<T, TList extends TypedList<T>>
    implements CacheDataSource<T, TList> {
  final List<T> _cachedData = [];

  @override
  @mustCallSuper
  TList getMultiple(bool Function(T) test) {
    List<T> items = [];
    for (final item in _cachedData) {
      if (test(item)) items.add(item);
    }
    if (items.isEmpty) throw CacheException();
    return constructList(items);
  }

  @override
  @mustCallSuper
  void popMultiple(bool Function(T) test) {
    List<T> items = getMultiple(test).values;
    for (final item in items) {
      _cachedData.remove(item);
    }
  }

  @override
  @mustCallSuper
  TList getAll() => getMultiple((_) => true);

  @override
  @mustCallSuper
  void popAll() => popMultiple((_) => true);

  @override
  @mustCallSuper
  T get(bool Function(T) test) {
    try {
      return _cachedData.firstWhere(test);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  @mustCallSuper
  void pop(bool Function(T) test) {
    final item = get(test);
    if (item != null) {
      _cachedData.remove(item);
    }
  }

  @override
  @mustCallSuper
  void pushMultiple(TList items, {required bool Function(T, T) updateTest}) {
    for (final item in items.values) {
      push(item, updateTest: updateTest);
    }
  }

  @override
  @mustCallSuper
  void push(T item, {required bool Function(T, T) updateTest}) {
    final index = _cachedData.indexWhere((e) => updateTest(item, e));
    if (index != -1) {
      _cachedData[index] = item;
    } else {
      _cachedData.add(item);
    }
  }

  TList constructList(List<T> items);
}
