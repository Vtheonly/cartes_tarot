abstract class TransactionalCreateApiLocalDataSource<Transaction, RequestModel,
    RequestParams, ResponseModel> {
  /// Throws [DatabaseException] on failure
  Future<ResponseModel> transactionalCreate(
      Transaction transaction, RequestModel model, RequestParams params);
}
