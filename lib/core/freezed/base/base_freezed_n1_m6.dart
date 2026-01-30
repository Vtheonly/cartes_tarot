import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../common/freezed_n6_m1.dart';

abstract class BaseFreezed<TFreezed extends Freezed> extends Equatable {
  @protected
  final TFreezed freezed;

  const BaseFreezed(this.freezed);

  Object? get data;

  @override
  List<Object?> get props => [freezed];
}
