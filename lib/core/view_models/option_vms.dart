import 'base/vm_n2_m1.dart';

abstract class OptionVM<T> extends VM<T, bool> {
  const OptionVM({required T option, required bool isSelected})
      : super(e1: option, e2: isSelected);

  T get option => e1;
  bool get isSelected => e2;
}
