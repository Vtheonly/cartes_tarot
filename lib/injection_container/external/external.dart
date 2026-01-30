import 'package:shared_preferences/shared_preferences.dart';

import '../service_locator.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
