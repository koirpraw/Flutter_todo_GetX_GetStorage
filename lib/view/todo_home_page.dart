import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_todo_box_storage/view/add_todo_page.dart';

import '../controller/todo_controller.dart';
import '../main.dart';
import 'edit_todo.dart';

class TodoHomePage extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  TodoHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade300,
        // Color(0xffd1c4e9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed(AddTodoPage.id);
        },
      ),
      body: Center(
        child: Obx(
          () => todoController.todos.isEmpty
              ? Center(
                  child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.3,
                    ),
                    Text(
                      "You don't have any task yet",
                      style: TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AddTodoPage.id);
                        },
                        child: Text("Create new Task"))
                  ],
                ))
              : ListView.builder(
                  itemBuilder: (context, index) => Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text(
                              "Delete  ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onDismissed: (_) {
                      todoController.todos.removeAt(index);
                      Get.snackbar('Deleted!',
                          "Item: ${todoController.todos[index].text!} deleted",
                          snackPosition: SnackPosition.BOTTOM);
                    },
                    child: Card(
                      child: ListTile(
                          title: Text(
                            todoController.todos[index].text!,
                            style: todoController.todos[index].done
                                ? TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    decoration: TextDecoration.lineThrough,
                                  )
                                : const TextStyle(
                                    color: Colors.black,
                                  ),
                          ),
                          trailing: todoController.todos[index].done
                              ? const SizedBox(
                                  height: 10,
                                  width: 10,
                                )
                              : IconButton(
                                  onPressed: () =>
                                      Get.to(() => TodoEdit(index: index)),
                                  icon: const Icon(Icons.edit,color: Colors.green,),
                                ),
                          leading: Checkbox(
                            activeColor: Colors.deepPurple.shade300,
                            checkColor: Colors.white,
                            value: todoController.todos[index].done,
                            onChanged: (newVal) {
                              //Creating a variable and storing the current index of the to do list.
                              var myTodo = todoController.todos[index];
                              //Changing the value of the done(bool) type  to the new value(which is users toggled bool value).
                              myTodo.done = newVal!;
                              //Updating the list with the new value(bool) assigned to the Done(bool) status.
                              todoController.todos[index] = myTodo;
                            },
                          )),
                    ),
                  ),
                  itemCount: todoController.todos.length,
                ),
        ),
      ),
    );
  }

  ListTile buildCheckedListTile(int index) {
    return ListTile(
      title: Text(
        todoController.todos[index].text!,
        style: todoController.todos[index].done
            ? const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              )
            : const TextStyle(
                color: Colors.black,
              ),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => TodoEdit(index: index)),
        icon: const Icon(Icons.edit),
      ),
      leading: Checkbox(
        value: todoController.todos[index].done,
        onChanged: (newVal) {
          //Creating a variable and storing the current index of the to do list.
          var myTodo = todoController.todos[index];
          //Changing the value of the done(bool) type  to the new value(which is users toggled bool value).
          myTodo.done = newVal!;
          //Updating the list with the new value(bool) assigned to the Done(bool) status.
          todoController.todos[index] = myTodo;
        },
      ),
    );
  }
}

// class TodoHomePage extends StatelessWidget {
//   static const id = '/Home_screen';
//   final TodoController todoController = Get.put(TodoController());
//
//   TodoHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(MyApp.title),
//         centerTitle: true,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(
//           Icons.add,
//         ),
//         onPressed: () {
//           Get.toNamed(AddTodoPage.id);
//         },
//       ),
//       body: Obx(
//         () => ListView.builder(
//           itemBuilder: (context, index) => Dismissible(
//             key: UniqueKey(),
//             background: Container(
//               color: Colors.deepOrange,
//               child: const Icon(
//                 Icons.delete,
//                 color: Colors.white,
//               ),
//             ),
//             onDismissed: (_) {
//               todoController.todoList.removeAt(index);
//               Get.snackbar('Remove!', "Task was succesfully Delete",
//                   snackPosition: SnackPosition.BOTTOM);
//             },
//             child: ListTile(
//               title: Text(
//                 todoController.todoList[index].text!,
//                 style: todoController.todoList[index].done
//                     ? const TextStyle(
//                         color: Colors.red,
//                         decoration: TextDecoration.lineThrough,
//                       )
//                     : const TextStyle(
//                         color: Colors.black,
//                       ),
//               ),
//               trailing: IconButton(
//                 onPressed: () => Get.to(() => EditTodoPage(index: index)),
//                 icon: const Icon(Icons.edit),
//               ),
//               leading: Checkbox(
//                 value: todoController.todoList[index].done,
//                 onChanged: (newVal) {
//                   var todo = todoController.todoList[index];
//                   todo.done = newVal!;
//                   todoController.todoList[index] = todo;
//                 },
//               ),
//             ),
//           ),
//           itemCount: todoController.todoList.length,
//         ),
//       ),
//     );
//   }
// }
