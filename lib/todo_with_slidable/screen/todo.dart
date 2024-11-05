import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../cubit/todo_cubit.dart';
import '../cubit/todo_model.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late TextEditingController todoTitleController = TextEditingController();
  late TextEditingController searchController = TextEditingController();
  int? editingIndex;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String searchQuery = '';
  //
  // @override
  // void dispose() {
  //   todoTitleController.dispose();
  //   searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Todo List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.brown,
                    controller: todoTitleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22)),
                      hintText: 'Enter Your Task',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Task cannot be empty';
                      }
                      if (value.length < 4) {
                        return 'Task must be at least 4 letters';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _isLoading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() {
                        _isLoading = true;
                      });

                      await Future.delayed(Duration(seconds: 1));

                      final title = todoTitleController.text.trim();
                      if (editingIndex != null) {
                        context.read<TodoCubit>().updateTodo(
                              editingIndex!,
                              title,
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Updated: $title'),
                          ),
                        );

                        setState(() {
                          editingIndex = null;
                        });
                      } else {
                        context.read<TodoCubit>().addTodo(
                              title,
                            );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(' $title is Added Successfully'),
                          ),
                        );
                      }

                      todoTitleController.clear();

                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: Text(editingIndex != null ? 'Update' : 'Add'),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
                hintText: 'Search Tasks',
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, List<Todo>>(
              builder: (context, todos) {
                final filteredTodos = todos
                    .where((i) => i.name
                        .toLowerCase()
                        .contains(searchQuery.toLowerCase()))
                    .toList();

                return filteredTodos.isEmpty
                    ? Center(child: Text('No tasks found'))
                    : ListView.builder(
                        itemCount: filteredTodos.length,
                        itemBuilder: (context, index) {
                          final todo = filteredTodos[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Slidable(
                              startActionPane: ActionPane(
                                extentRatio: 0.5,
                                motion: DrawerMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (val) {
                                      setState(() {
                                        todoTitleController.text = todo.name;
                                        editingIndex = index;
                                      });
                                    },
                                    backgroundColor: Colors.blue,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                    autoClose: false,
                                  ),
                                  SlidableAction(
                                    onPressed: (val) {},
                                    backgroundColor: Colors.green,
                                    icon: Icons.remove_red_eye,
                                    label: 'View',
                                  ),
                                ],
                              ),
                              endActionPane: ActionPane(
                                extentRatio: 0.3,
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (val) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('${todo.name} is Deleted'),
                                        ),
                                      );

                                      context
                                          .read<TodoCubit>()
                                          .removeTodo(index);
                                    },
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Text(
                                  todo.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                tileColor: Colors.black54,
                                textColor: Colors.white,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                // leading: GestureDetector(
                                //   child: CircleAvatar(
                                //     backgroundColor: Colors.blueGrey,
                                //     child: Icon(
                                //       Icons.edit,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                //   onTap: () {
                                //     setState(() {
                                //       todoTitleController.text = todo.name;
                                //       editingIndex = index;
                                //     });
                                //   },
                                // ),
                                // trailing: GestureDetector(
                                //     child: CircleAvatar(
                                //       backgroundColor: Colors.blueGrey,
                                //       child: Icon(
                                //         Icons.delete,
                                //         color: Colors.red,
                                //         size: 19,
                                //       ),
                                //     ),
                                //     onTap: () {
                                //       ScaffoldMessenger.of(context)
                                //           .showSnackBar(
                                //         SnackBar(
                                //           content:
                                //               Text('${todo.name} is Deleted'),
                                //         ),
                                //       );
                                //
                                //       context
                                //           .read<TodoCubit>()
                                //           .removeTodo(index);
                                //     }),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
