import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../entities/sql_database/core/unidentified.dart';
import '../../entities/sql_database/relational/relational.dart';

abstract class EntityMapper<
    SDBaseEntity extends Equatable,
    SDCoreEntity extends UnIdentified<SDBaseEntity>,
    SDRelationalIds extends Equatable,
    SDRelationalEntity extends Relational<SDCoreEntity, SDRelationalIds>,
    XDEntity extends Equatable> {
  SDBaseEntity toBaseSDE(XDEntity xde) => constructBaseSDE(xde);

  SDCoreEntity toCoreSDE(XDEntity xde) => constructCoreSDE(toBaseSDE(xde));

  SDRelationalEntity toRelationalSDE(XDEntity xde) =>
      constructRelationalSDE(toCoreSDE(xde), constructRelationalIdsSDE(xde));

  @protected
  SDBaseEntity constructBaseSDE(XDEntity xde);

  @protected
  SDCoreEntity constructCoreSDE(SDBaseEntity base);

  @protected
  SDRelationalIds constructRelationalIdsSDE(XDEntity xde);

  @protected
  SDRelationalEntity constructRelationalSDE(
      SDCoreEntity core, SDRelationalIds relationalIds);
}
