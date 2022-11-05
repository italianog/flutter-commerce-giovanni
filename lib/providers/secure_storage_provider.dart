import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

final secureStorageProvider = Provider((ref) {
  return const FlutterSecureStorage();
});
