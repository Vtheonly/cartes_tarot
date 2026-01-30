abstract class DeleteApiLocalDatasource<ResponseModel, QueryParams> {
  /// Throws [DatabaseException] on failure
  Future<ResponseModel> delete(QueryParams params);
}
