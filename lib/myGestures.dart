import 'package:flutter/material.dart';

class myGestures extends StatelessWidget {
  const myGestures({super.key});

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
            //learn gestureDetector - bắt sự kiện
            GestureDetector(
              onTap: () {
                print("Nội dung được Tap");
              },
              onDoubleTap: () {
                print("Nội dung được Tap 2 lần");
              },
              onPanUpdate: (details) => {print("di chuyển: ${details.delta}")},
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                child: Center(child: Text("chạm vào tôi")),
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
