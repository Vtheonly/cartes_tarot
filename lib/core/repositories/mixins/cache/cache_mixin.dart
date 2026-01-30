import 'package:dartz/dartz.dart';

import '../../../error/failures/failures.dart';

mixin CacheMixin {
  Either<Failure, T> cacheFetch<T>({required T Function() fetch}) {
    try {
      final data = fetch();
      return Right(data);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  Either<Failure, void> cacheSave({required void Function() save}) {
    try {
      save();
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  Either<Failure, void> cacheDelete({required void Function() delete}) {
    try {
      delete();
      return const Right(null);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
