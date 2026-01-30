import 'package:equatable/equatable.dart';

class NoQueryParams extends Equatable {
  const NoQueryParams();
  bool get hasNoParams => props.every((o) => o == null);
  bool get hasParams => !hasNoParams;
  @override
  List<Object?> get props => [];
}
