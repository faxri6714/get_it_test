import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../core/entities/todo_entitiy.dart';

class TodoCardWidget extends StatefulWidget {
  final TodoEntitiy entitiy;
  final Function() onDelete;
  const TodoCardWidget({Key? key, required this.entitiy, required this.onDelete}) : super(key: key);

  @override
  State<TodoCardWidget> createState() => _TodoCardWidgetState();
}

class _TodoCardWidgetState extends State<TodoCardWidget> {
  bool isMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: widget.entitiy.isDone ? Colors.blueGrey : Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: widget.entitiy.isDone
                        ? Colors.blueGrey
                        : Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.entitiy.title,
                  style: TextStyle(
                      color:
                          widget.entitiy.isDone ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 3),
                Text(
                  widget.entitiy.description,
                  style: TextStyle(
                    color: widget.entitiy.isDone
                        ? Colors.white
                        : Colors.grey.shade400,
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DateFormat("dd-MM-yyyy").format(widget.entitiy.createdAt),
                      style: TextStyle(
                        color: widget.entitiy.isDone
                            ? Colors.white
                            : Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        if (isMenuOpen)
          SizedBox(
            height: 10,
          ),
        if (isMenuOpen)
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: widget.entitiy.isDone ? Colors.blueGrey : Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: widget.entitiy.isDone
                        ? Colors.blueGrey
                        : Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            height: 100,
            child: Column(
              children: [
                _menuItem(title: "Edit", icon: Icons.edit, onTap: (){}),
                SizedBox(height: 6),
                _menuItem(title: "Delete", icon: Icons.delete_outline, onTap: widget.onDelete),
              ],
            ),
          ),
        if (isMenuOpen)
          SizedBox(
            height: 30,
          ),
      ],
    );
  }

  _menuItem(
      {required String title,
      required IconData icon,
      required Function() onTap
      }) {
    return GestureDetector(
      onTap: (){
        isMenuOpen = false;
        setState(() {

        });
        onTap.call();
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(title)
        ],
      ),
    );
  }
}
