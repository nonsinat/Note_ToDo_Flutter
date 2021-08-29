import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final String title = '';
  late String? _priority = 'Low';
  final String btnText = 'Add note';
  final String titleText = 'Add note';

  final _formkey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  DateTime _date = DateTime.now();

  _handledatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormat.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            Text("Title"),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 10.0),
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(fontSize: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: TextFormField(
                      style: TextStyle(fontSize: 10.0),
                      readOnly: true,
                      controller: _dateController,
                      onTap: _handledatePicker,
                      decoration: InputDecoration(
                        labelText: "Date",
                        labelStyle: TextStyle(fontSize: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: DropdownButtonFormField(
                      items: _priorities.map((String _priority) {
                        return DropdownMenuItem(
                          value: _priority,
                          child: Text(
                            _priority,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      style: TextStyle(fontSize: 10.0),
                      decoration: InputDecoration(
                        labelText: "Priority",
                        labelStyle: TextStyle(fontSize: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _priority = value.toString();
                        });
                      },
                      value: _priority,
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(btnText),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Updat"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
