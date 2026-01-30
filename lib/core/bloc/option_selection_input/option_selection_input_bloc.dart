import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../view_models/option_vms.dart';
import '../../view_models/options_list_vms.dart';
import '../background_process_bloc/background_process_bloc.dart';
import 'option_selection_input_event.dart';
import 'option_selection_input_state.dart';

typedef OSIState<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = OptionSelectionInputState<TOptionVM, TOptionsListVM,
        XState<TOptionVM, TOptionsListVM>>;
typedef OSIStateEmitter<TOptionVM extends OptionVM<dynamic>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    = Emitter<OSIState<TOptionVM, TOptionsListVM>>;

abstract class OptionSelectionInputBloc<T, TOptionVM extends OptionVM<T>,
        TOptionsListVM extends OptionsListVM<TOptionVM>>
    extends Bloc<OptionSelectionInputEvent<TOptionVM, XEvent<TOptionVM>>,
        OSIState<TOptionVM, TOptionsListVM>> {
  BackgroundProcessBloc backgroundProcessBloc;
  OptionSelectionInputBloc({required this.backgroundProcessBloc})
      : super(const InitialSt()) {
    on<LoadWithEv<TOptionVM>>((event, emit) async {
      //final firstOptionsList = getStateOptionsList(state);
      backgroundProcessBloc.emitLoading();
      //emit(LoadingSt(optionsList: firstOptionsList));
      await Future.delayed(const Duration(milliseconds: 500));
      final option = event.data;
      final optionsList = constructOptionVMsListVM([option]);
      backgroundProcessBloc.emitLoaded();
      emit(LoadedSt(optionsList: optionsList));
    });

    on<ChooseAllEv<TOptionVM>>((event, emit) async {
      final firstState = state;
      final firstOptionsList = getStateOptionsList(firstState);
      backgroundProcessBloc.emitLoading();
      emit(LoadingSt(optionsList: firstOptionsList));
      await chooseAllHandler(firstState, emit);
    });

    on<LoadToChooseEv<TOptionVM>>((event, emit) async {
      final firstState = state;
      //final firstOptionsList = getStateOptionsList(firstState);
      backgroundProcessBloc.emitLoading();
      //emit(LoadingSt(optionsList: firstOptionsList));
      await loadToChooseHandler(firstState, emit);
    });
  }

  @protected
  TOptionsListVM? getStateOptionsList(
          OSIState<TOptionVM, TOptionsListVM> state) =>
      state.maybeWhen(
        loaded: (optionsList) => optionsList,
        loading: (optionsList) => optionsList,
        error: (optionsList) => optionsList,
        orElse: () => null,
      );

  void backgroundProcessBlocStateEmitter(
          OSIState<TOptionVM, TOptionsListVM> state) =>
      state.when(
          initial: (_) => backgroundProcessBloc.emitInitial(),
          loading: (_) => backgroundProcessBloc.emitLoading(),
          loaded: (_) => backgroundProcessBloc.emitLoaded(),
          error: (_) => backgroundProcessBloc.emitError());

  @mustCallSuper
  Future<void> handleLoadToChooseError(
      OSIState<TOptionVM, TOptionsListVM> firstState,
      OSIStateEmitter<TOptionVM, TOptionsListVM> emit) async {
    //final TOptionsListVM? firstOptionsList = getStateOptionsList(firstState);
    backgroundProcessBloc.emitError();
    //emit(ErrorSt(optionsList: firstOptionsList));
    await Future.delayed(const Duration(milliseconds: 500));
    backgroundProcessBlocStateEmitter(firstState);
    emit(firstState);
  }

  @mustCallSuper
  Future<void> handleChooseAllError(
      OSIStateEmitter<TOptionVM, TOptionsListVM> emit) async {
    //final TOptionsListVM? firstOptionsList = getStateOptionsList(firstState);
    backgroundProcessBloc.emitError();
    emit(ErrorSt(optionsList: null));
    //emit(ErrorSt(optionsList: firstOptionsList));
    await Future.delayed(const Duration(milliseconds: 500));
    backgroundProcessBloc.emitInitial();
    emit(const InitialSt());
  }

  @mustCallSuper
  Future<void> handleLoading(OSIState<TOptionVM, TOptionsListVM> firstState,
      OSIStateEmitter<TOptionVM, TOptionsListVM> emit) async {
    backgroundProcessBlocStateEmitter(firstState);
    emit(firstState);
  }

  @mustCallSuper
  Future<void> handleChooseAllLoaded(
      List<T> options, OSIStateEmitter<TOptionVM, TOptionsListVM> emit) async {
    final TOptionsListVM optionsList = prepareOptionsList(
        options, (option) => constructOptionVM(option, true));
    backgroundProcessBloc.emitLoaded();
    emit(LoadedSt(optionsList: optionsList));
  }

  @mustCallSuper
  Future<void> handleLoadToChooseLoaded(
      List<T> options,
      OSIState<TOptionVM, TOptionsListVM> firstState,
      OSIStateEmitter<TOptionVM, TOptionsListVM> emit) async {
    final TOptionsListVM? firstOptionsList = getStateOptionsList(firstState);
    final TOptionsListVM preparedOptionsList = firstOptionsList == null
        ? prepareOptionsList(
            options, (option) => constructOptionVM(option, false))
        : prepareOptionsList(
            options, (option) => prepareOption(option, firstOptionsList));

    TOptionsListVM savedOptionsList = preparedOptionsList;
    await optionsSelectionHandler(
        preparedOptionsList, (optionsList) => savedOptionsList = optionsList);
    backgroundProcessBloc.emitLoaded();
    emit(LoadedSt(optionsList: savedOptionsList));
  }

  void chooseAll() => add(const ChooseAllEv());
  void loadToChoose() => state.maybeWhen(
        loading: (_) => null,
        orElse: () => add(const LoadToChooseEv()),
      );
  void loadWith(T option) =>
      add(LoadWithEv(option: constructOptionVM(option, true)));

  @protected
  TOptionVM prepareOption(T option, TOptionsListVM optionsList) {
    return optionsList.options.firstWhere(
      (el) => el.option == option,
      orElse: () => constructOptionVM(option, false),
    );
  }

  @protected
  TOptionsListVM prepareOptionsList(
          List<T> options, TOptionVM Function(T) toOption) =>
      constructOptionVMsListVM(options.map(toOption).toList());

  @protected
  TOptionVM constructOptionVM(T option, bool isSelected);
  @protected
  TOptionsListVM constructOptionVMsListVM(List<TOptionVM> optionVMs);
  @protected
  Future<void> optionsSelectionHandler(
      TOptionsListVM optionsList, void Function(TOptionsListVM) saveOptions);

  @protected
  Future<void> chooseAllHandler(OSIState<TOptionVM, TOptionsListVM> firstState,
      OSIStateEmitter<TOptionVM, TOptionsListVM> emit);
  @protected
  Future<void> loadToChooseHandler(
      OSIState<TOptionVM, TOptionsListVM> firstState,
      OSIStateEmitter<TOptionVM, TOptionsListVM> emit);

  @override
  Future<void> close() {
    backgroundProcessBloc.close();
    return super.close();
  }
}
