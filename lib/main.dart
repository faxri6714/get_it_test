import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'application.dart';
import 'locator.dart';




void main() async{

  await Hive.initFlutter();
setup();
  runApp(const Application());
}