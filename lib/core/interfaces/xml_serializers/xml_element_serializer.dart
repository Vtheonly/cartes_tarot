import 'from_xml_element_serializers/from_xml_element_serializer.dart';
import 'to_xml_element_serializers/to_xml_element_serializer.dart';

abstract class XmlElementSerializer<Model>
    implements ToXmlElementSerializer, FromXmlElementSerializer<Model> {}
