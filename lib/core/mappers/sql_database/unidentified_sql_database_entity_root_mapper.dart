import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/unidentified.dart';
import '../../entities/sql_database/relational/relational_root.dart';

abstract class EntityMapper<
    BaseEntity extends Equatable,
    CoreEntity extends UnIdentified<BaseEntity>,
    RelationalEntity extends RelationalRoot<CoreEntity>> {
  BaseEntity coreToBase(CoreEntity core) => core.baseData;
  CoreEntity relationalToCore(RelationalEntity relational) =>
      relational.coreData;

  CoreEntity baseToCore(BaseEntity base) => constructCore(base);
  RelationalEntity coreToRelational(CoreEntity core) =>
      constructRelational(core);

  @protected
  CoreEntity constructCore(BaseEntity base);

  @protected
  RelationalEntity constructRelational(CoreEntity b);
}
