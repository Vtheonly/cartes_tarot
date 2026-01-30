abstract class CountApiDocumentDataSource<ResponseModel, Document> {
  /// Throws [DocumentException] on failure
  ResponseModel count(Document document);
}
