import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureLocalData {
  /// Throws [PlatformException] on failure
  Future<String?> read(String key);

  /// Throws [PlatformException] on failure
  Future<void> write(String key, String? value);

  /// Throws [PlatformException] on failure
  Future<void> delete(String key);
}

class SecureLocalDataImpl implements SecureLocalData {
  final FlutterSecureStorage secureStorage;

  SecureLocalDataImpl({required this.secureStorage});

  @override
  Future<String?> read(String key) => secureStorage.read(key: key);

  @override
  Future<void> write(String key, String? value) =>
      secureStorage.write(key: key, value: value);

  @override
  Future<void> delete(String key) => secureStorage.delete(key: key);
}
