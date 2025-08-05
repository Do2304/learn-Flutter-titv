import 'package:flutter/material.dart';

class myColumnAndRow extends StatelessWidget {
  const myColumnAndRow({super.key});

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
      backgroundColor: Colors.grey,

      body: Center(
        // learn Column
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(height: 50),
                const Icon(Icons.access_alarm),
                const Icon(Icons.baby_changing_station),
                const Icon(Icons.accessibility_outlined),
              ],
            ),
            Row(
              children: [
                Text("Luli 1"),
                Text("Luli 2"),
                Text("Luli 3"),
                Text("Luli 4"),
              ],
            ),
          ],
        ),
      ),

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
