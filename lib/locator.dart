import 'package:get_it/get_it.dart';
import 'package:get_it_test/core/utils/todo_storage_service.dart';

final locator = GetIt.I;

void setup(){
  locator.registerSingleton(TodoStorageService());
}