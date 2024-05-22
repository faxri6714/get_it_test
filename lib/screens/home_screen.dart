import 'package:flutter/material.dart';
import 'package:get_it_test/core/utils/todo_storage_service.dart';
import 'package:get_it_test/locator.dart';
import 'package:get_it_test/widgets/text_form_field_widget.dart';

import '../core/entities/todo_entitiy.dart';
import '../widgets/todo_card_widget.dart';
import 'create_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => HomeScreen());

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  late TodoStorageService storageService;
  late List<TodoEntitiy> listTodo = [];
  @override
  void initState() {
    listTodo = [];
    storageService = locator();
    initialize();
    super.initState();
  }

  initialize() async {
    final data = await storageService.getListTodo();
    listTodo = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Todo list",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateTodoScreen(
                          onAdd: (TodoEntitiy entitiy) {
                            listTodo.add(entitiy);
                            setState(() {});
                          },
                        )));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextFormFieldWidget(
              controller: controller,
              hintText: "Serch",
              onChanged: (value) {
                int valueLengh = value.toString().length;
                for (TodoEntitiy i in listTodo) {
                  String f = i.title.substring(0, valueLengh);
                  if (f.toLowerCase() != value?.toLowerCase()) {
                    listTodo.remove(i);
                  }

                  setState(() {});

                  // if (i.title.substring(valueLengh) != value) {
                  //     listTodo.remove(i);
                  //     setState(() {});
                  // }
                }
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await initialize();
                  controller.clear();
                },
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final todo = listTodo[index];
                    return TodoCardWidget(
                      entitiy: todo,
                      onDelete: () {
                        listTodo.remove(todo);
                        storageService.saveNewList(listTodo);
                        setState(() {});
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 10,
                  ),
                  itemCount: listTodo.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textIndecatorItem(TodoEntitiy entitiy) {}
}
