import 'package:bloc/bloc.dart';

import 'background_process_event.dart';
import 'background_process_state.dart';

class BackgroundProcessBloc
    extends Bloc<BackgroundProcessEvent, BackgroundProcessState> {
  BackgroundProcessBloc() : super(const InitialSt()) {
    on<EmitStateEv>((event, emit) {
      final eventState = event.data;
      emit(eventState);
    });
  }

  void emitInitial() => add(EmitStateEv(state: const InitialSt()));
  void emitLoading() => add(EmitStateEv(state: const LoadingSt()));
  void emitLoaded() => add(EmitStateEv(state: const LoadedSt()));
  void emitError() => add(EmitStateEv(state: const ErrorSt()));
}
