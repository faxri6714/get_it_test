import 'package:flutter/material.dart';
import 'package:get_it_test/core/utils/todo_storage_service.dart';
import 'package:get_it_test/locator.dart';

import '../core/entities/todo_entitiy.dart';
import '../widgets/text_form_field_widget.dart';


class CreateTodoScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => CreateTodoScreen(onAdd: (TodoEntitiy entitiy) {  },));
  final Function(TodoEntitiy entitiy) onAdd;
  const CreateTodoScreen({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  TodoEntitiy entitiy = TodoEntitiy.empty();
  late TodoStorageService storageService;
  @override
  void initState() {
    storageService = locator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          "Create Todo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormFieldWidget(
              controller: controllerTitle,
              hintText: "Title",
              onChanged: (value) {
               entitiy = entitiy.copyWith(title: value);
              },
            ),
            SizedBox(height: 20),
            TextFormFieldWidget(
              controller: controllerDescription,
              hintText: "Description",
              onChanged: (value) {
              entitiy =  entitiy.copyWith(description: value);
              },
              maxLines: 2,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: ElevatedButton(
                onPressed: () async{
                 await storageService.save(entitiy);
                 widget.onAdd.call(entitiy);
                 Navigator.pop(context);
                },
                child: Text("save"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
