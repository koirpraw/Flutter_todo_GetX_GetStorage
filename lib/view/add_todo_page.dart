import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_todo_box_storage/controller/todo_controller.dart';
import 'package:get_todo_box_storage/model/todo.dart';

class AddTodoPage extends StatelessWidget {
  static const id = '/add_page';
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController titleController = TextEditingController();

   AddTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        centerTitle: true,
        automaticallyImplyLeading: false,

        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                  width: Get.width * 0.9,
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Add Task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                todoController.todos.add(Todo(
                  text: titleController.text,
                  done: false,
                ));
                Get.back();
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}