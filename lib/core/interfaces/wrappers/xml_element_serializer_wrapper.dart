import '../xml_serializers/xml_element_serializer.dart';

abstract class XmlElementSerializerWrapper<Model,
    ModelXmlElementSerializer extends XmlElementSerializer<Model>> {
  ModelXmlElementSerializer xmlElementSerializer();
}
