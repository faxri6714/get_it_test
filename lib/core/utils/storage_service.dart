import 'package:hive/hive.dart';

import '../entities/todo_entitiy.dart';
import '../models/todo_model.dart';
import 'storage_boxes.dart';

class StorageService{
  seve(String key,dynamic value)async{
    final box = await Hive.openBox<Map<String,dynamic>>(StorageBoxes.storage);

    await box.put(key, value);
  }

  Future<List<TodoEntitiy>> getListStorage() async{
    final box = await Hive.openBox<Map<String,dynamic>>(StorageBoxes.todo);
    final listJason= List<Map<String,dynamic>>.from(box.values);

    final List<TodoEntitiy> listData = [];

    for (var json in listJason) {
      listData.add(TodoModel.fromJson(json));
    }

    return listData;
  }
}