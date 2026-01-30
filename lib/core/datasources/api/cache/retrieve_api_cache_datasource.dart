abstract class RetrieveApiCacheDataSource<T, QueryParams> {
  /// Throws [CacheException] on failure
  T retrieve(QueryParams params);
}
