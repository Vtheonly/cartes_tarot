import 'package:flutter/material.dart';

import '../../bloc/tab_controller/tab_controller_bloc.dart';
import '../ticker_provider/custom_ticker_povider.dart';

class EntryPageTabControllerBloc extends TabControllerBloc {
  EntryPageTabControllerBloc()
      : super(
          tabController: TabController(
              initialIndex: 0, length: 2, vsync: CustomTickerProvider()),
        );
}
