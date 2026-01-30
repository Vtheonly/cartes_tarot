import '../../../../generics/base_classes/typed_list.dart';
import '../../../api/cache/delete_api_cache_datasource.dart';
import '../../../base/items_cache_datasource.dart';

mixin DeleteApiCacheDataSourceMixin<Item, Items extends TypedList<Item>,
        QueryParams> on ItemsCacheDataSource<Item, Items>
    implements DeleteApiCacheDataSource<QueryParams> {
  @override
  void delete(QueryParams params) => pop((item) => checkQuery(item, params));

  bool checkQuery(Item item, QueryParams params);
}
