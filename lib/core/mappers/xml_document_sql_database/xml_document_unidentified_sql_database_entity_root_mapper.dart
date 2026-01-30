import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/unidentified.dart';
import '../../entities/sql_database/relational/relational_root.dart';

abstract class EntityMapper<
    SDBaseEntity extends Equatable,
    SDCoreEntity extends UnIdentified<SDBaseEntity>,
    SDRelationalEntity extends RelationalRoot<SDCoreEntity>,
    XDEntity extends Equatable> {
  SDBaseEntity toBaseSDE(XDEntity xde) => constructBaseSDE(xde);

  SDCoreEntity toCoreSDE(XDEntity xde) => constructCoreSDE(toBaseSDE(xde));

  SDRelationalEntity toRelationalSDE(XDEntity xde) =>
      constructRelationalSDE(toCoreSDE(xde));

  @protected
  SDBaseEntity constructBaseSDE(XDEntity xde);

  @protected
  SDCoreEntity constructCoreSDE(SDBaseEntity base);

  @protected
  SDRelationalEntity constructRelationalSDE(SDCoreEntity core);
}
