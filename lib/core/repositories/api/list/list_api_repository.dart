import 'package:dartz/dartz.dart';

import '../../../error/failures/failure.dart';
import '../../../generics/base_classes/typed_list.dart';
import '../../crud/list/base_list_options.dart';

abstract class ListApiRepository<Entity extends TypedList, QueryParams,
    ListOptions extends BaseListOptions> {
  Future<Either<Failure, Entity>> list(
      {required QueryParams params, required ListOptions listOptions});
}
