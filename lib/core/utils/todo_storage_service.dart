



import 'package:hive/hive.dart';

import '../entities/todo_entitiy.dart';
import '../models/todo_model.dart';
import 'storage_boxes.dart';

class TodoStorageService{
  save(TodoEntitiy entitiy) async{
    final box = await Hive.openBox(StorageBoxes.todo);
final model =TodoModel.fromEntity(entitiy);
   await box.add(model.toJason());
  }
  saveNewList(List<TodoEntitiy> listTodo) async{

    final box = await Hive.openBox(StorageBoxes.todo);
    await box.clear();
    final List<Map<String,dynamic>> listJason = listTodo.map((element) => TodoModel.fromEntity(element).toJason()).toList();
    await box.addAll(listJason);


  }

  clearDataInBox()async{
    final box = await Hive.openBox(StorageBoxes.todo);

    box.clear();

  }

 Future<List<TodoEntitiy>> getListTodo() async{
    final box = await Hive.openBox(StorageBoxes.todo);

    final listJason= List.from(box.values);

    final List<TodoEntitiy> listData = [];

for (var json in listJason) {
listData.add(TodoModel.fromJson(Map<String, dynamic>.from(json)));
}

return listData;
  }



}
