import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../view_models/option_vms.dart';
import '../../view_models/options_list_vms.dart';
import 'multi_option_selection_event.dart';
import 'multi_option_selection_state.dart';

abstract class MultiOptionSelectionBloc<T, TOptionVM extends OptionVM<T>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends Bloc<
        MultiOptionSelectionEvent<TOptionVM, XEvent<TOptionVM>>,
        MultiOptionSelectionState<TOptionVM, TOptionsListVM,
            XState<TOptionVM, TOptionsListVM>>> {
  MultiOptionSelectionBloc({required TOptionsListVM initialOptionsList})
      : super(SelectedSt(optionsList: initialOptionsList)) {
    on<InverseSelectionEv<TOptionVM>>((event, emit) {
      final selectedOption = event.data;
      final newOptionsList = _inverseOptionSelection(selectedOption);
      emit(SelectedSt(optionsList: newOptionsList));
      onConfirmed(newOptionsList);
    });

    on<ClearAllEv<TOptionVM>>((event, emit) {
      final newOptionsList = _makeAllOptions(false);
      emit(SelectedSt(optionsList: newOptionsList));
      onConfirmed(newOptionsList);
    });

    on<SelectAllEv<TOptionVM>>((event, emit) {
      final newOptionsList = _makeAllOptions(true);
      emit(SelectedSt(optionsList: newOptionsList));
      onConfirmed(newOptionsList);
    });
  }

  TOptionsListVM _makeAllOptions(bool isSelected) =>
      _inverseWhenSatisfyTest((op) => op.isSelected != isSelected);

  TOptionsListVM _inverseOptionSelection(OptionVM<T> selectedOption) =>
      _inverseWhenSatisfyTest((op) => op == selectedOption);

  TOptionsListVM _inverseWhenSatisfyTest(bool Function(TOptionVM) test) {
    final optionsList = state.data;
    List<TOptionVM> newOptionsList = [];

    for (var op in optionsList.options) {
      newOptionsList
          .add(test(op) ? constructOptionVM(op.option, !op.isSelected) : op);
    }
    return constructOptionVMsListVM(newOptionsList);
  }

  @protected
  void onConfirmed(TOptionsListVM options);
  @protected
  TOptionVM constructOptionVM(T option, bool isSelected);
  @protected
  TOptionsListVM constructOptionVMsListVM(List<TOptionVM> optionVMs);

  void inverseSelection(TOptionVM option) =>
      add(InverseSelectionEv(option: option));
  void selectAll() => add(const SelectAllEv());
  void clearAll() => add(const ClearAllEv());
}
