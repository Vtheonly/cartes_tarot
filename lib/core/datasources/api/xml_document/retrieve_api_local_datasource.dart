abstract class RetrieveApiDocumentDataSource<ResponseModel, QueryParams> {
  /// Throws [DocumentException] on failure
  Future<ResponseModel> retrieve(QueryParams params);
}
