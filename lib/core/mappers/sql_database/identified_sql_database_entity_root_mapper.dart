import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/identified.dart';
import '../../entities/sql_database/relational/relational_root.dart';

abstract class EntityMapper<
    BaseEntity extends Equatable,
    CoreIds extends Equatable,
    CoreEntity extends Identified<BaseEntity, CoreIds>,
    RelationalEntity extends RelationalRoot<CoreEntity>> {
  BaseEntity coreToBase(CoreEntity core) => core.baseData;
  CoreEntity relationalToCore(RelationalEntity relational) =>
      relational.coreData;

  CoreEntity baseToCore(BaseEntity base, CoreIds coreIds) =>
      constructCore(base, coreIds);
  RelationalEntity coreToRelational(CoreEntity core) =>
      constructRelational(core);

  @protected
  CoreEntity constructCore(BaseEntity base, CoreIds coreIds);

  @protected
  RelationalEntity constructRelational(CoreEntity b);
}
