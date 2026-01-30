import 'base/vm_n1_m1.dart';

class PageIndexVM extends VM<int> {
  const PageIndexVM({required int index}) : super(e: index);

  PageIndexMV1 get vm1 => PageIndexMV1(e);
}

class PageIndexMV1 extends VM<int> {
  const PageIndexMV1(int e) : super(e: e);

  int get pageIndex => e;
}
