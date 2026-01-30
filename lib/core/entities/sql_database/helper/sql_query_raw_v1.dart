import 'package:equatable/equatable.dart';

class QueryRaw extends Equatable {
  final String sql;
  final List<Object?>? arguments;

  const QueryRaw({required this.sql, required this.arguments});

  @override
  List<Object?> get props => [sql, arguments];
}
