import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../view_models/option_vms.dart';
import '../../view_models/options_list_vms.dart';
import 'single_option_selection_event.dart';
import 'single_option_selection_state.dart';

abstract class SingleOptionSelectionBloc<T, TOptionVM extends OptionVM<T>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends Bloc<
        SingleOptionSelectionEvent<TOptionVM, XEvent<TOptionVM>>,
        SingleOptionSelectionState<TOptionVM, TOptionsListVM,
            XState<TOptionVM, TOptionsListVM>>> {
  SingleOptionSelectionBloc({required TOptionsListVM initialOptionsList})
      : super(SelectedSt(optionsList: initialOptionsList)) {
    on<SelectEv<TOptionVM>>((event, emit) {
      final selectedOption = event.data;
      final newOptionsList = _selectOption(selectedOption);
      emit(SelectedSt(optionsList: newOptionsList));
    });

    on<ClearAllEv<TOptionVM>>((event, emit) {
      final newOptionsList = _makeAllOptions(false);
      emit(SelectedSt(optionsList: newOptionsList));
    });

    on<SelectAllEv<TOptionVM>>((event, emit) {
      final newOptionsList = _makeAllOptions(true);
      emit(SelectedSt(optionsList: newOptionsList));
    });

    on<ConfirmEv<TOptionVM>>((event, emit) {
      onConfirmed(state.data);
    });
  }

  TOptionsListVM _makeAllOptions(bool isSelected) =>
      _inverseWhenSatisfyTest((op) => op.isSelected != isSelected,
          onFalse: (op) => op);

  TOptionsListVM _selectOption(OptionVM<T> selectedOption) =>
      _inverseWhenSatisfyTest((op) => op == selectedOption,
          onFalse: (op) =>
              op.isSelected ? constructOptionVM(op.option, false) : op);

  TOptionsListVM _inverseWhenSatisfyTest(bool Function(TOptionVM) test,
      {required TOptionVM Function(TOptionVM) onFalse}) {
    final optionsList = state.data;
    List<TOptionVM> newOptionsList = [];

    for (var op in optionsList.options) {
      newOptionsList.add(test(op)
          ? constructOptionVM(op.option, !op.isSelected)
          : onFalse(op));
    }
    return constructOptionVMsListVM(newOptionsList);
  }

  @protected
  void onConfirmed(TOptionsListVM options);
  @protected
  TOptionVM constructOptionVM(T option, bool isSelected);
  @protected
  TOptionsListVM constructOptionVMsListVM(List<TOptionVM> optionVMs);

  void select(TOptionVM option) => add(SelectEv(option: option));
  void selectAll() => add(const SelectAllEv());
  void clearAll() => add(const ClearAllEv());
  void confirm() => add(const ConfirmEv());
}
