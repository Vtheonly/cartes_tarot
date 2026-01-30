import '../../../api/cache/delete_api_cache_datasource.dart';
import '../../../base/item_cache_datasource.dart';

mixin DeleteApiCacheDataSourceMixin<Item, QueryParams>
    on ItemCacheDataSource<Item>
    implements DeleteApiCacheDataSource<QueryParams> {
  @override
  void delete(QueryParams params) => pop((item) => checkQuery(item, params));

  bool checkQuery(Item item, QueryParams params);
}
