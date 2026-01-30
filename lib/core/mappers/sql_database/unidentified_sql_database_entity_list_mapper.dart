import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/unidentified.dart';
import '../../entities/sql_database/relational/relational.dart';
import '../../generics/base_classes/typed_list.dart';
import 'unidentified_sql_database_entity_mapper.dart';

abstract class EntityListMapper<
    BaseEntity extends Equatable,
    BaseEntityList extends TypedList<BaseEntity>,
    CoreEntity extends UnIdentified<BaseEntity>,
    CoreEntityList extends TypedList<CoreEntity>,
    RelationalIds extends Equatable,
    RelationalEntity extends Relational<CoreEntity, RelationalIds>,
    RelationalEntityList extends TypedList<RelationalEntity>,
    Mapper extends EntityMapper<BaseEntity, CoreEntity, RelationalIds,
        RelationalEntity>> {
  final Mapper mapper;
  EntityListMapper({required this.mapper});

  BaseEntityList coreToBase(CoreEntityList cl) =>
      constructBaseList(cl.values.map((c) => mapper.coreToBase(c)).toList());

  CoreEntityList relationalToCore(RelationalEntityList rl) => constructCoreList(
      rl.values.map((r) => mapper.relationalToCore(r)).toList());

  CoreEntityList baseToCore(BaseEntityList bl, coreIds) =>
      constructCoreList(bl.values.map((b) => mapper.baseToCore(b)).toList());

  RelationalEntityList coreToRelational(
          CoreEntityList cl, RelationalIds relationalIds) =>
      constructRelationalList(cl.values
          .map((c) => mapper.coreToRelational(c, relationalIds))
          .toList());

  @protected
  BaseEntityList constructBaseList(List<BaseEntity> bl);

  @protected
  CoreEntityList constructCoreList(List<CoreEntity> cl);

  @protected
  RelationalEntityList constructRelationalList(List<RelationalEntity> rl);
}
