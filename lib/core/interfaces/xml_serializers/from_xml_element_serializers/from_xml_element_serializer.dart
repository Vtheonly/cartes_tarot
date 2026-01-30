import 'package:xml/xml.dart';

abstract class FromXmlElementSerializer<Model> {
  Model fromXmlElement(XmlElement xmlElement);
}
