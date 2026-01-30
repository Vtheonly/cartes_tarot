import 'package:xml/xml.dart';

abstract class IterableToXmlElementSerializer {
  Iterable<XmlElement> toXmlElements();
}
