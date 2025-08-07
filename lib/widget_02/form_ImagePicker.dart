import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class form_ImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => form_ImagePickerState();
}

class form_ImagePickerState extends State<form_ImagePicker> {
  final _formkey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  bool _obscurePassword = true;
  String? _name;
  String? _selectedCity;
  String? _gender;
  bool _isAgreed = false;
  DateTime? _dateOfBirth = null;
  final List<String> _cities = ["Hà Nội", "HCM", "Quảng Ngãi", "Đà Nẵng"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Basic")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                FormField<File>(
                  validator: (value) {
                    if (value == null) {
                      return "Vui lòng chọn ảnh";
                    }
                  },
                  builder: (FormFieldState<File> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ảnh đại diện",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text("Chọn nguồn"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.photo_library),
                                        title: Text("Thư viện"),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.gallery,
                                            ),
                                          );
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt),
                                        title: Text("Máy tính"),
                                        onTap: () async {
                                          Navigator.pop(
                                            context,
                                            await _picker.pickImage(
                                              source: ImageSource.camera,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              if (image != null) {
                                setState(() {
                                  _profileImage = File(image.path);
                                  state.didChange(_profileImage);
                                });
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: state.hasError
                                      ? Colors.red
                                      : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child: _profileImage != null
                                  ? ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(60),
                                      child: Image.file(
                                        _profileImage!,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Icon(
                                      Icons.add_a_photo,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                        ),
                        if (state.hasError)
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(
                                state.errorText!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: _fullnameController,
                  decoration: InputDecoration(
                    labelText: "Họ và tên",
                    hintText: "Nhập họ và tên",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (newValue) {
                    _name = newValue;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập họ và tên";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                FormField<String>(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn giới tính";
                    }

                    return null;
                  },
                  initialValue: _gender,
                  builder: (FormFieldState<String> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: Text("Nam"),
                                value: 'male',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                    state.didChange(value);
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: Text("Nữ"),
                                value: 'female',
                                groupValue: _gender,
                                onChanged: (value) {
                                  setState(() {
                                    _gender = value;
                                    state.didChange(value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(
                    labelText: "Ngày sinh",
                    hintText: "Chọn ngày sinh",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2025),
                    );
                    if (pickedDate != null) {
                      String formatedDate = DateFormat(
                        "dd/MM/yyyy",
                      ).format(pickedDate);
                      setState(() {
                        _dateOfBirthController.text = formatedDate;
                        _dateOfBirth = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn ngày sinh";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Nhập email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập Email";
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );

                    if (!emailRegex.hasMatch(value)) {
                      return 'Email không hợp lệ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    hintText: "Nhập mật khẩu",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập mật khẩu";
                    }
                    if (value.length < 6) {
                      return "Mật khẩu ít nhất phải có 6 kí tự";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Thành phố",
                    border: OutlineInputBorder(),
                  ),
                  items: _cities.map((city) {
                    return DropdownMenuItem(child: Text(city), value: city);
                  }).toList(),
                  value: _selectedCity,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng chọn thành phố";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                CheckboxListTile(
                  title: Text("Đồng ý với các điều kiện ở trên ko"),
                  value: _isAgreed,
                  onChanged: (value) {
                    setState(() {
                      _isAgreed = value!;
                      print("Đồng ý: $_isAgreed");
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
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
                        _fullnameController.clear();
                        _emailController.clear();
                        _passwordController.clear();

                        setState(() {
                          _name = null;
                          _dateOfBirthController.text = '';
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
      ),
    );
  }
}
