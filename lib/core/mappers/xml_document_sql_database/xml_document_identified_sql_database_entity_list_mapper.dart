import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/identified.dart';
import '../../entities/sql_database/relational/relational.dart';
import '../../generics/base_classes/typed_list.dart';
import 'xml_document_identified_sql_database_entity_mapper.dart';

abstract class EntityListMapper<
    SDBaseEntity extends Equatable,
    SDBaseEntityList extends TypedList<SDBaseEntity>,
    SDCoreIds extends Equatable,
    SDCoreEntity extends Identified<SDBaseEntity, SDCoreIds>,
    SDCoreEntityList extends TypedList<SDCoreEntity>,
    SDRelationalIds extends Equatable,
    SDRelationalEntity extends Relational<SDCoreEntity, SDRelationalIds>,
    SDRelationalEntityList extends TypedList<SDRelationalEntity>,
    XDEntity extends Equatable,
    XDEntityList extends TypedList<XDEntity>,
    Mapper extends EntityMapper<SDBaseEntity, SDCoreIds, SDCoreEntity,
        SDRelationalIds, SDRelationalEntity, XDEntity>> {
  final Mapper mapper;
  EntityListMapper({required this.mapper});

  SDBaseEntityList toBaseSDE(XDEntityList xdeList) => constructBaseSDEList(
      xdeList.values.map((xde) => mapper.toBaseSDE(xde)).toList());

  SDCoreEntityList toCoreSDE(XDEntityList xdeList) => constructCoreSDEList(
      xdeList.values.map((xde) => mapper.toCoreSDE(xde)).toList());

  SDRelationalEntityList toRelationalSDE(XDEntityList xdeList) =>
      constructRelationalSDEList(
          xdeList.values.map((xde) => mapper.toRelationalSDE(xde)).toList());

  @protected
  SDBaseEntityList constructBaseSDEList(List<SDBaseEntity> bl);

  @protected
  SDCoreEntityList constructCoreSDEList(List<SDCoreEntity> cl);

  @protected
  SDRelationalEntityList constructRelationalSDEList(
      List<SDRelationalEntity> rl);
}
