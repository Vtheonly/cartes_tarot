import '../../../generics/base_classes/typed_list.dart';

abstract class ListApiLocalDataSource<ResponseModel extends TypedList,
    QueryParams> {
  /// Throws [DatabaseException] on failure
  Future<ResponseModel> list(QueryParams params);
}
