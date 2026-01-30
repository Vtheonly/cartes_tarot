import 'package:equatable/equatable.dart';

abstract class UnIdentified<Base extends Equatable> extends Equatable {
  final Base baseData;

  const UnIdentified({required this.baseData});

  @override
  List<Object?> get props => baseData.props;
}
