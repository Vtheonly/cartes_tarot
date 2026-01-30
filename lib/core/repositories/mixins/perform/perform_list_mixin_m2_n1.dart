import 'package:dartz/dartz.dart';

import '../../../error/failures/failure.dart';
import '../../crud/list/list_options_m2_n1.dart';
import '../cache/cache_mixin.dart';
import '../remote/remote_mixin.dart';

mixin PerformListMixin on RemoteMixin, CacheMixin {
  Future<Either<Failure, R>> performFetch<T, R>(
      {required Future<bool> checkConnection,
      required Future<T> Function() remoteFetch,
      required R Function() cacheFetch,
      required void Function(R) cacheSave,
      required void Function() cacheDelete,
      required ListOptions fetchOptions,
      required R Function(T) mapper}) async {
    if (fetchOptions.reload) {
      this.cacheDelete(delete: cacheDelete);
    } else if (fetchOptions.useCache) {
      final result = this.cacheFetch(fetch: cacheFetch);
      final data = result.fold((l) => null, (r) => r);
      if (data != null) return Right(data);
    }

    final result = await this.remoteFetch(
        isConnected: checkConnection, fetch: remoteFetch, mapper: mapper);
    result.fold((l) => null, (r) => this.cacheSave(save: () => cacheSave(r)));

    return result;
  }
}
