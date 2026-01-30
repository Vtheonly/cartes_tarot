import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../view_models/page_index_vms.dart';
import '../../view_models/tab_controller_vms.dart';
import 'tab_controller_event.dart';
import 'tab_controller_state.dart';

abstract class TabControllerBloc
    extends Bloc<TabControllerEvent, TabControllerState> {
  final TabController _tabController;
  TabControllerBloc({required TabController tabController})
      : _tabController = tabController,
        super(InitialSt(
            tabController: TabControllerVM(tabController: tabController))) {
    _tabController.addListener(_handleTabChange);
    on<SwitchToEv>((event, emit) {
      _tabController.animateTo(event.data.vm1.pageIndex);
    });

    on<EmitInitialEv>((event, emit) => emit(InitialSt(
        tabController: TabControllerVM(tabController: _tabController))));
  }

  void switchToIndex(int index) =>
      add(SwitchToEv(pageIndex: PageIndexVM(index: index)));

  void lazySwitchToIndex(int index) async {
    await Future.delayed(const Duration(milliseconds: 300));
    add(SwitchToEv(pageIndex: PageIndexVM(index: index)));
  }

  void _handleTabChange() => add(const EmitInitialEv());

  @override
  Future<void> close() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    return super.close();
  }
}
