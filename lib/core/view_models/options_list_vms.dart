import 'base/vm_n1_m1.dart';
import 'option_vms.dart';

abstract class OptionsListVM<TOptionVM extends OptionVM<dynamic>>
    extends VM<List<TOptionVM>> {
  const OptionsListVM({required List<TOptionVM> options}) : super(e: options);

  List<TOptionVM> get options => e;
  OptionsListVM1<TOptionVM> get vm1 => OptionsListVM1<TOptionVM>(options: e);
}

class OptionsListVM1<TOptionVM extends OptionVM<dynamic>>
    extends VM<List<TOptionVM>> {
  const OptionsListVM1({required List<TOptionVM> options}) : super(e: options);

  List<TOptionVM> get selectedOptions =>
      e.where((op) => op.isSelected).toList();

  bool get noOptionsSelected => selectedOptions.isEmpty;
  String get selectedOptionsNbr =>
      selectedOptions.length.toString().padLeft(2, "0");
  bool get onlyOneOptionSelected => selectedOptions.length == 1;
  bool get allOptionsSelected => selectedOptions.length == e.length;
}
