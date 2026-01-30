import '../../../api/cache/retrieve_api_cache_datasource.dart';
import '../../../base/item_cache_datasource.dart';

mixin RetrieveApiCacheDataSourceMixin<Item, QueryParams>
    on ItemCacheDataSource<Item>
    implements RetrieveApiCacheDataSource<Item, QueryParams> {
  @override
  Item retrieve(QueryParams params) => get((item) => checkQuery(item, params));

  bool checkQuery(Item item, QueryParams params);
}
