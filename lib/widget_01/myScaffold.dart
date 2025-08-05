import 'package:flutter/material.dart';

class myScaffold extends StatelessWidget {
  const myScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("learn scaffold")),
      backgroundColor: Colors.grey,
      body: Center(child: Text("Nội dung chính")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Pressed");
        },
        child: const Icon(Icons.add_ic_call),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.percent), label: "Cá nhân"),
        ],
      ),
    );
  }
}
