import '../../../../generics/base_classes/typed_list.dart';
import '../../../api/cache/list_api_cache_datasource.dart';
import '../../../base/items_cache_datasource.dart';

mixin ListApiCacheDataSourceMixin<Item, Items extends TypedList<Item>,
        QueryParams> on ItemsCacheDataSource<Item, Items>
    implements ListApiCacheDataSource<Items, QueryParams> {
  @override
  Items list(QueryParams params) => get((item) => checkQuery(item, params));

  bool checkQuery(Item item, QueryParams params);
}
