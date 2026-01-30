import 'package:dartz/dartz.dart';

import '../../../error/failures/failures.dart';

mixin RemoteMixin {
  Future<Either<Failure, R>> remoteFetch<T, R>(
      {required Future<T> Function() fetch,
      required Future<bool> isConnected,
      required R Function(T) mapper}) async {
    if (await isConnected) {
      try {
        final data = await fetch();
        return Right(mapper(data));
      } catch (e) {
        return const Left(ServerFailure());
      }
    }
    return const Left(ConnectionFailure());
  }
}
