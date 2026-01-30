import 'package:dartz/dartz.dart';

import '../../../error/failures/failure.dart';
import '../../crud/retrieve/base_retrieve_options.dart';

abstract class RetrieveApiRepository<Entity, QueryParams,
    RetrieveOptions extends BaseRetrieveOptions> {
  Future<Either<Failure, Entity>> retrieve(
      {required QueryParams params, required RetrieveOptions retrieveOptions});
}
