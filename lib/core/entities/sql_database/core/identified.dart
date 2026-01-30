import 'package:equatable/equatable.dart';

import 'unidentified.dart';

abstract class Identified<Base extends Equatable, CoreIds extends Equatable>
    extends UnIdentified<Base> {
  final CoreIds coreIds;

  const Identified({required this.coreIds, required super.baseData});

  @override
  List<Object?> get props => [coreIds, ...super.props];
}
