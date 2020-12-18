import 'package:get_it/get_it.dart';
import 'package:tuto_get_it/services/api/api.dart';
import 'package:tuto_get_it/services/api/http_api.dart';
import 'package:tuto_get_it/services/storage/localstorage_service.dart';
import 'package:tuto_get_it/services/storage/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Api>(() => HttpApi());
  locator.registerLazySingleton<StorageService>(() => LocalStorageService());
}
