import 'package:flutter/material.dart';
import 'components/dialog_box.dart';
import 'components/todo_tile.dart';
import 'helpers/helpers_database.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final _controller = TextEditingController();
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> _toDoList = [];

  @override
  void initState() {
    super.initState();
    _loadToDoList();
  }

  // Görev listesini yükleyen metot
  void _loadToDoList() async {
    final tasks = await _databaseHelper.getTasks();
    setState(() {
      _toDoList.clear();
      _toDoList.addAll(tasks);
    });
  }

  // Checkbox değiştiğinde çağrılan metot
  void checkBoxChanged(bool? value, int index) async {
    final int id = _toDoList[index]['id'];
    final bool taskCompleted = value ?? false;
    await _databaseHelper.updateTask(id, taskCompleted);

    setState(() {
      _toDoList[index]['taskCompleted'] = taskCompleted ? 1 : 0;
    });
  }

  // Yeni bir görevi kaydeden metot
  void saveNewTask() async {
    final String taskName = _controller.text;
    final bool taskCompleted = false;
    final int id = await _databaseHelper.insertTask(taskName, taskCompleted);

    setState(() {
      _toDoList.add({
        'id': id,
        'taskName': taskName,
        'taskCompleted': taskCompleted ? 1 : 0,
      });
    });

    Navigator.of(context).pop();
  }

  // Yeni görev oluşturmak için çağrılan metot
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  // Bir görevi silen metot
  void deleteTask(int index) async {
    final int id = _toDoList[index]['id'];
    await _databaseHelper.deleteTask(id);

    setState(() {
      _toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 42.0, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TO DO ',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 40,
                fontFamily: 'BrunoAce',
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: createNewTask,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView.builder(
          itemCount: _toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: _toDoList[index]['taskName'],
              taskCompleted: _toDoList[index]['taskCompleted'] == 1,
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
