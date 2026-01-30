import 'package:dartz/dartz.dart';

abstract class DoubleParamsFutureEitherUseCase<Type1, Type2, Params1, Params2> {
  Future<Either<Type1, Type2>> call(Params1 p1, Params2 p2);
}

abstract class FutureEitherUseCase<Type1, Type2, Params> {
  Future<Either<Type1, Type2>> call(Params params);
}

abstract class NoParamsFutureEitherUseCase<Type1, Type2> {
  Future<Either<Type1, Type2>> call();
}

abstract class DoubleParamsEitherUseCase<Type1, Type2, Params1, Params2> {
  Either<Type1, Type2> call(Params1 p1, Params2 p2);
}

abstract class EitherUseCase<Type1, Type2, Params> {
  Either<Type1, Type2> call(Params params);
}

abstract class NoParamsEitherUseCase<Type1, Type2> {
  Either<Type1, Type2> call();
}

abstract class DoubleParamsFutureUseCase<Type, Params1, Params2> {
  Future<Type> call(Params1 p1, Params2 p2);
}

abstract class FutureUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class NoParamsFutureUseCase<Type> {
  Future<Type> call();
}

abstract class DoubleParamsUseCase<Type, Params1, Params2> {
  Type call(Params1 p1, Params2 p2);
}

abstract class UseCase<Type, Params> {
  Type call(Params params);
}

abstract class NoParamsUseCase<Type> {
  Type call();
}
