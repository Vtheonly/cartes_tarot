import '../../router/router.dart';
import '../service_locator.dart';

void init() => sl.registerSingleton<AppRouter>(AppRouter());
