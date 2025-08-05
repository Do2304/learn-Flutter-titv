import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  const myButton({super.key});

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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                print('ElevatedButton');
              },
              child: Text('ElevatedButton', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 234, 143, 173),
                foregroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                elevation: 15,
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                print("TextButton");
              },
              child: Text("TextButton", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                print("OutlinedButton");
              },
              child: Text("OutlinedButton", style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                print("IconButton");
              },
              icon: const Icon(Icons.ad_units_rounded),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                print("FloatingActionButton");
              },
              child: Icon(Icons.zoom_out_rounded),
            ),
            SizedBox(height: 20),

            // learn Inkwell
            InkWell(
              onTap: () {
                print("InkWell pressed");
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                child: Text("Button tuỳ chỉnh với InkWell"),
              ),
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
