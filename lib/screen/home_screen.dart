import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_todo_app_flutter/screen/add_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, CupertinoPageRoute(builder: (context) => AddNoteScreen())),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Notes",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("0 - 10"),
                ],
              ),
            );
          }
          return _buildNote();
        },
      ),
    );
  }

  Widget _buildNote() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTile(
            title: Text("data"),
            subtitle: Text("Aug 16, 2021 - 2021"),
            trailing: Checkbox(
              value: _check,
              onChanged: (value) {
                print(value);
              },
              activeColor: Colors.red,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
