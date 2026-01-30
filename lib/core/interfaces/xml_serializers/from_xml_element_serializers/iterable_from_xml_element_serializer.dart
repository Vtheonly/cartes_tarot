import 'package:xml/xml.dart';

abstract class IterableFromXmlElementSerializer<Model> {
  Model fromXmlElements(Iterable<XmlElement> xmlElements);
}
