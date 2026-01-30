import '../../../generics/base_classes/typed_list.dart';

abstract class ListApiRemoteDataSource<ListModel extends TypedList,
    QueryParams> {
  /// Throws [ServerException] on failure
  Future<ListModel> list(QueryParams params);
}
