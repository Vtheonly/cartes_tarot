abstract class CountApiLocalDataSource<ResponseModel, QueryParams> {
  /// Throws [DatabaseException] on failure
  Future<ResponseModel> count(QueryParams params);
}
