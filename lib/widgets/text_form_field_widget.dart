import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String?)? onChanged;
  final int maxLines;

  const TextFormFieldWidget({super.key, required this.controller, required this.hintText, this.onChanged, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * maxLines +0,
      child: TextFormField(
maxLines: maxLines,
        controller: controller,
        onChanged: onChanged,

        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.black26,
              width: 2
            )
          ),
          focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 3
                )
            ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          )

        ),
      ),
    );
  }
}

