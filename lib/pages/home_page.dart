import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_project/database/database.dart';
import 'package:new_project/util/dialog_box.dart';
import 'package:new_project/util/todo_tile.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("mybox");

  final _controller = TextEditingController();

  late TodoDatabase db;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final user = authProvider.user;
      if (user == null) return;

      db = TodoDatabase(userId: user.uid);

      if (_myBox.get(db.userKey) == null) {
        db.createInitialData();
      } else {
        db.loadData();
      }

      setState(() {});
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value;
    });
    db.updateData();
  }

  void _onSave() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: _onSave,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user == null || db == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Row(
          children: [
            if (user?.photoURL != null)
              CircleAvatar(backgroundImage: NetworkImage(user!.photoURL!))
            else
              const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(width: 10),
            Text(
              user?.displayName ?? 'Guest',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () async {
              final nav = Navigator.of(context);
              await authProvider.signOut();
              nav.pushReplacementNamed('/auth');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskComplete: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
