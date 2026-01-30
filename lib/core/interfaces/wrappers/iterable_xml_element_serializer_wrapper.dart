import '../xml_serializers/iterable_xml_element_serializer.dart';

abstract class IterableXmlElementSerializerWrapper<Model,
    ModelXmlElementSerializer extends IterableXmlElementSerializer<Model>> {
  ModelXmlElementSerializer xmlElementsSerializer();
}
