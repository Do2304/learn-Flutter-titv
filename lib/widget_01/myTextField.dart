import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  const myTextField({super.key});

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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              TextField(
                decoration: InputDecoration(
                  labelText: "Họ và Tên",
                  hintText: "Nhập họ và tên",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Example luli@gmail.com",
                  helperText: "Nhập vào email cá nhân",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.clear),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.teal,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Sđt",
                  hintText: "Nhập vào số điện thoại",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ngày sinh",
                  hintText: "Nhập vào ngày sinh",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),

              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
                obscureText: true,
                // obscuringCharacter: '*',
              ),

              SizedBox(height: 30),
              TextField(
                onChanged: (value) => {print("Đang nhập $value")},
                onSubmitted: (value) {
                  print("Đã submit: $value");
                },
                decoration: InputDecoration(
                  labelText: "Câu hỏi bí mật",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
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
