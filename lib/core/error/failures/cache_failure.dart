import 'package:equatable/equatable.dart';

import 'failure.dart';

class CacheFailure extends Failure {
  const CacheFailure();
}

abstract class CacheFailureT<T extends Object?> extends CacheFailure {
  final T data;
  const CacheFailureT({required this.data});

  @override
  List<Object?> get props => [...super.props, ..._dataProps];

  List<Object?> get _dataProps =>
      (data is Equatable) ? (data as Equatable).props : [data];
}
