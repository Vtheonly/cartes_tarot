import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/relational/relational.dart';
import '../../entities/sql_database/core/unidentified.dart';

abstract class EntityMapper<
    BaseEntity extends Equatable,
    CoreEntity extends UnIdentified<BaseEntity>,
    RelationalIds extends Equatable,
    RelationalEntity extends Relational<CoreEntity, RelationalIds>> {
  BaseEntity coreToBase(CoreEntity core) => core.baseData;
  CoreEntity relationalToCore(RelationalEntity relational) =>
      relational.coreData;

  CoreEntity baseToCore(BaseEntity base) => constructCore(base);
  RelationalEntity coreToRelational(
          CoreEntity core, RelationalIds relationalIds) =>
      constructRelational(core, relationalIds);

  @protected
  RelationalEntity constructRelational(
      CoreEntity core, RelationalIds relationalIds);

  @protected
  CoreEntity constructCore(BaseEntity base);
}
