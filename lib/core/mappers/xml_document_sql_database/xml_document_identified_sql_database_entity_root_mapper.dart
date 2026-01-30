import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/identified.dart';
import '../../entities/sql_database/relational/relational_root.dart';

abstract class EntityMapper<
    SDBaseEntity extends Equatable,
    SDCoreIds extends Equatable,
    SDCoreEntity extends Identified<SDBaseEntity, SDCoreIds>,
    SDRelationalEntity extends RelationalRoot<SDCoreEntity>,
    XDEntity extends Equatable> {
  SDBaseEntity toBaseSDE(XDEntity xde) => constructBaseSDE(xde);

  SDCoreEntity toCoreSDE(XDEntity xde) =>
      constructCoreSDE(toBaseSDE(xde), constructCoreIdsSDE(xde));

  SDRelationalEntity toRelationalSDE(XDEntity xde) =>
      constructRelationalSDE(toCoreSDE(xde));

  @protected
  SDBaseEntity constructBaseSDE(XDEntity xde);

  @protected
  SDCoreIds constructCoreIdsSDE(XDEntity xde);

  @protected
  SDCoreEntity constructCoreSDE(SDBaseEntity base, SDCoreIds coreIds);

  @protected
  SDRelationalEntity constructRelationalSDE(SDCoreEntity core);
}
