import 'package:equatable/equatable.dart';

class MultiLangString extends Equatable {
  final String ar, en, fr;

  const MultiLangString({required this.ar, required this.en, required this.fr});

  @override
  List<Object?> get props => [ar, en, fr];
}
