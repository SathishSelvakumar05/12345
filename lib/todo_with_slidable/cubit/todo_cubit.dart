import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_try/todo_with_slidable/cubit/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    emit([...state, todo]);
  }

  void updateTodo(int index, String newTitle) {
    if (newTitle.isEmpty) {
      addError('Title cannot be empty!');
      return;
    }
    if (index < 0 || index >= state.length) {
      addError('Invalid index!');
      return;
    }
    final updatedTodo =
        state[index].copy(name: newTitle, updatedAt: DateTime.now());

    final updatedList = [...state];
    updatedList[index] = updatedTodo;
    emit(updatedList);
  }

  void removeTodo(int index) {
    state.removeAt(index);
    emit([...state]);
  }

  // void filterTodo(String filtername) {
  //   if (filtername.isEmpty) {
  //     emit([...state]);
  //   } else {
  //     final filteredList = state
  //         .where((i) => i.name.toLowerCase().contains(filtername.toLowerCase()))
  //         .toList();
  //     print(filteredList);
  //     emit(filteredList);
  //   }
  // }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print(state);
    print('TodoCubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('TodoCubit - $error');
  }
}
