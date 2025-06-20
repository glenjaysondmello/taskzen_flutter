import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  String greetMessage = "";

  TextEditingController myController = TextEditingController();

  void greetUser() {
    String str = myController.text;

    setState(() {
      greetMessage = "Hello, $str";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          // margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(greetMessage),
              TextField(
                controller: myController,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Type your name",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(onPressed: greetUser, child: Text("Tap")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
