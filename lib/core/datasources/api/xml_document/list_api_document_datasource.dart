abstract class ListApiDocumentDataSource<ResponseModel, Document> {
  /// Throws [DocumentException] on failure
  Future<ResponseModel> list(Document document);
}
