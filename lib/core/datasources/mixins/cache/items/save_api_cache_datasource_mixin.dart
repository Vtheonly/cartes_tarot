import '../../../../generics/base_classes/typed_list.dart';
import '../../../api/cache/save_api_cache_datasource.dart';
import '../../../base/items_cache_datasource.dart';

mixin SaveApiCacheDataSourceMixin<Item, Items extends TypedList<Item>>
    on ItemsCacheDataSource<Item, Items>
    implements SaveApiCacheDataSource<Items> {
  @override
  void save(Items items) => push(items, updateTest: equal);

  bool equal(Item item1, Item item2);
}
