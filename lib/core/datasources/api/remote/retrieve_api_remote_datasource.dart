abstract class RetrieveApiRemoteDataSource<GetModel, QueryParams> {
  /// Throws [ServerException] on failure
  Future<GetModel> retrieve(QueryParams params);
}
