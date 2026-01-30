abstract class CreateApiLocalDataSource<RequestModel, RequestParams,
    ResponseModel> {
  /// Throws [DatabaseException] on failure
  Future<ResponseModel> create(RequestModel model, RequestParams params);
}
