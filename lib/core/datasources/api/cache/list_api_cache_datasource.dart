import '../../../generics/base_classes/typed_list.dart';

abstract class ListApiCacheDataSource<T extends TypedList, QueryParams> {
  /// Throws [CacheException] on failure
  T list(QueryParams params);
}
