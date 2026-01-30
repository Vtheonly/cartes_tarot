import '../../../api/cache/save_api_cache_datasource.dart';
import '../../../base/item_cache_datasource.dart';

mixin SaveApiCacheDataSourceMixin<Item> on ItemCacheDataSource<Item>
    implements SaveApiCacheDataSource<Item> {
  @override
  void save(Item item) => push(item, updateTest: equal);

  bool equal(Item item1, Item item2);
}
