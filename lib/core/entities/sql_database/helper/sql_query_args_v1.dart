import 'package:equatable/equatable.dart';

class QueryArgs extends Equatable {
  final String? where;
  final List<Object?>? whereArgs;

  const QueryArgs({required this.where, required this.whereArgs});

  @override
  List<Object?> get props => [where, whereArgs];
}
