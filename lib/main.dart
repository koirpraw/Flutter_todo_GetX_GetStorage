import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_todo_box_storage/view/add_todo_page.dart';

import 'package:get_todo_box_storage/view/todo_home_page.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Getx Todo Box Storage Home';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: TodoHomePage.id,
      getPages: [
        GetPage(name: AddTodoPage.id, page: () => AddTodoPage()),
        GetPage(name: TodoHomePage.id, page: () => TodoHomePage()),
      ],
    );
  }
}




