import 'package:flutter/material.dart';

import 'base/vm_n1_m1.dart' as vmn1m1;
import 'base/vm_n2_m1.dart' as vmn2m1;

class TabControllerVM extends vmn2m1.VM<TabController, int> {
  TabControllerVM({required TabController tabController})
      : super(e1: tabController, e2: tabController.index);

  TabControllerVM1 get vm1 => TabControllerVM1(e1);
  TabControllerVM2 get vm2 => TabControllerVM2(e2);
}

class TabControllerVM1 extends vmn1m1.VM<TabController> {
  const TabControllerVM1(TabController e) : super(e: e);

  TabController get controller => e;
}

class TabControllerVM2 extends vmn1m1.VM<int> {
  const TabControllerVM2(int e) : super(e: e);

  int get currentTabIndex => e;
}
