import 'package:flutter/foundation.dart';

import '../../error/exceptions/cache_exception.dart';

abstract class ItemCacheDataSource<T> {
  /// Throws [CacheException] if no cached data is present.
  T get(bool Function(T) test);

  /// Throws [CacheException] if no cached data is present.
  void pop(bool Function(T) test);
  void push(T item, {required bool Function(T, T) updateTest});
}

abstract class ItemCacheDataSourceImpl<T> implements ItemCacheDataSource<T> {
  final List<T> cachedData;

  ItemCacheDataSourceImpl({required this.cachedData});

  @override
  @mustCallSuper
  T get(bool Function(T) test) {
    try {
      return cachedData.firstWhere(test);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  @mustCallSuper
  void pop(bool Function(T) test) {
    final item = get(test);
    if (item != null) {
      cachedData.remove(item);
    }
  }

  @override
  @mustCallSuper
  void push(T item, {required bool Function(T, T) updateTest}) {
    final index = cachedData.indexWhere((e) => updateTest(item, e));
    if (index != -1) {
      cachedData[index] = item;
    } else {
      cachedData.add(item);
    }
  }
}
