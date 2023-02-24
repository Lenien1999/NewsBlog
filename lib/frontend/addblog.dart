import 'dart:io';

import 'package:blog/backend/controller.dart';
import 'package:blog/backend/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _formKey = GlobalKey<FormState>();
  var _category = 'politic';
  File? image;
  final BlogController _blogController = BlogController();
  final content=TextEditingController();
   final headline=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 165, 28, 28),
        title: const Text("Add Blog",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _category,
                  
                  decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 167, 21, 21)),
                      labelText: 'Category',
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  items: <String>[
                    'politic',
                    'Art',
                    'Finance',
                    'Fashion',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: headline,
                  decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 167, 21, 21)),
                      labelText: 'Headline',
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Headline';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  maxLines: 8,
                  controller: content,
                  decoration: const InputDecoration(
                      labelText: 'Content',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 167, 21, 21)),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some content';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Container(
                    child: image == null
                        ? Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                pickImage();
                              },
                              child: const Text("PICK FROM GALLERY"),
                            ))
                        : SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.file(
                              image!,
                              fit: BoxFit.contain,
                            ))),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final blogdata =BlogModel (
                        cartegory: _category,
                        headline:headline.text,
                        content:content.text,
                        image:image.toString(),
                      );
                      _blogController.insertBlog(blogdata, context);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add Blog',
                      style:
                          TextStyle(color: Color.fromARGB(255, 167, 21, 21))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
