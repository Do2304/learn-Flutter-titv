import 'package:flutter/material.dart';

class formBasic extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => formBasicState();
}

class formBasicState extends State<formBasic> {
  final _formkey = GlobalKey<FormState>();
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Basic")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  hintText: "Nhập họ và tên",
                  border: OutlineInputBorder(),
                ),
                onSaved: (newValue) {
                  _name = newValue;
                },
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Xin chào $_name")),
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formkey.currentState!.reset();
                      setState(() {
                        _name = null;
                      });
                    },
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
