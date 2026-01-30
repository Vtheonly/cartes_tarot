import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:xml/xml.dart';

abstract class XmlDocumentClient {
  Future<XmlDocument> parseFile(File file);
}

class XmlDocumentClientImpl implements XmlDocumentClient {
  const XmlDocumentClientImpl();

  @override
  Future<XmlDocument> parseFile(File file) async {
    List<int> bytes = await file.readAsBytes();
    final decodedContent = _utf16leToString(base64Decode(utf8.decode(bytes)));
    final decodedXml = XmlDocument.parse(decodedContent);
    return decodedXml;
  }

  String _utf16leToString(List<int> bytes) {
    Uint8List list = Uint8List.fromList(bytes);
    List<int> charCodes = list.buffer.asUint16List().toList();
    return String.fromCharCodes(charCodes);
  }
}
