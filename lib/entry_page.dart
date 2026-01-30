import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/language/en_lang.dart';
import 'core/others/bloc/tab_controller_bloc_i0_l2.dart';
import 'core/widgets/keep_alive_wrapper.dart';
import 'features/game/presentation/pages/home_page.dart';
import 'injection_container/service_locator.dart' as locator;

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  TabController _readTabController(BuildContext context) =>
      context.read<EntryPageTabControllerBloc>().state.data.vm1.controller;

  void _switchToIndex(BuildContext context, int index) =>
      context.read<EntryPageTabControllerBloc>().switchToIndex(index);

  int _watchIndex(BuildContext context) => context
      .watch<EntryPageTabControllerBloc>()
      .state
      .data
      .vm2
      .currentTabIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EntryPageTabControllerBloc>(
      create: (context) => locator.sl<EntryPageTabControllerBloc>(),
      child: Builder(builder: (context) {
        return const Scaffold(body: HomePage());
      }),
    );
  }
}


/*
@override
Widget build(BuildContext context) {
    return BlocProvider<EntryPageTabControllerBloc>(
      create: (context) => locator.sl<EntryPageTabControllerBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: TabBarView(
            controller: _readTabController(context),
            children: const [
              KeepAliveWrapper(child: Center(child: HomePage())),
              KeepAliveWrapper(child: Center(child: Text(EnLang.settings))),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _watchIndex(context),
            onDestinationSelected: (index) => _switchToIndex(context, index),
            backgroundColor: Theme.of(context).colorScheme.surface,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.gamepad),
                icon: Icon(Icons.gamepad),
                label: EnLang.game,
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(Icons.settings),
                label: EnLang.settings,
              ),
            ],
          ),
        );
      }),
    );
  }
*/