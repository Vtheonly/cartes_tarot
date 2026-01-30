abstract class RetrieveApiLocalDataSource<ResponseModel, QueryParams> {
  /// Throws [DatabaseException] on failure
  Future<ResponseModel> retrieve(QueryParams params);
}
