import 'package:flutter/material.dart';

class myTextField_2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _myTextField_2State();
}

class _myTextField_2State extends State<myTextField_2> {
  final _textController = TextEditingController();
  String _inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("learn flutter"),
        backgroundColor: Colors.blue,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              print("b1");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("b2");
            },
            icon: Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              print("b3");
            },
            icon: Icon(Icons.more_vert_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Nhập thông tin",
                  hintText: "Nhập",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("Bạn đã nhập: $_inputText", style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
