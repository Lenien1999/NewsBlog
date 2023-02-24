import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model.dart';


class BlogController{

  Future insertBlog(BlogModel blogdata, BuildContext context) async {
    CollectionReference blog =
        FirebaseFirestore.instance.collection('${blogdata.cartegory}') ;
           return blog.doc(blog.id).set(
          blogdata.toJson())
          .then((value) => Navigator.pop(context)).
          catchError((error) => Get.showSnackbar(
                      GetSnackBar(
                          backgroundColor: const Color.fromARGB(255, 143, 21, 13),
                    title: 'Alart!',
                    message: "Failed to add ${blogdata.cartegory} : $error",
                    icon: const Icon(Icons.refresh),
                    duration: const Duration(seconds: 3),
                  ),
                ) );
    
  }

  Future<void> deleteBlog() {
    CollectionReference blog =
        FirebaseFirestore.instance.collection('Popular');
    return blog
        .doc(blog.id)
        .delete()
        .then((value) =>  Get.showSnackbar(
                    const GetSnackBar(
                        backgroundColor:   Color.fromARGB(255, 143, 21, 13),
                    title: 'Alart!',
                    message: "Blog Deleted",
                    icon: Icon(Icons.refresh),
                    duration: Duration(seconds: 3),
                  ),
                ))
        .catchError((error) =>
         Get.showSnackbar(
                     GetSnackBar(
                      backgroundColor: const Color.fromARGB(255, 143, 21, 13),
                    title: 'Alart!',
                    message: "Failed to delete Blog: $error",
                    icon:const Icon(Icons.refresh),
                    duration: const Duration(seconds: 3),
                  ),
                )
        
         );
  }

  Future<void> updateBlog(BlogModel blogdata, BuildContext context) {
    CollectionReference blog =
        FirebaseFirestore.instance.collection('Popular');
    return blog
        .doc(blog.id)
        .update(blogdata.toJson()
          
        )
        .then((value) =>  Get.showSnackbar(
                    const GetSnackBar(
                        backgroundColor:   Color.fromARGB(255, 143, 21, 13),
                    title: 'Alart!',
                    message: "Blog Deleted",
                    icon: Icon(Icons.refresh),
                    duration: Duration(seconds: 3),
                  ),
                ) )
        // ignore: invalid_return_type_for_catch_error
        .catchError((error) =>     GetSnackBar(
            backgroundColor: const Color.fromARGB(255, 143, 21, 13),
                    title: 'Alart!',
                    message: "Failed to delete Blog: $error",
                    icon: const Icon(Icons.refresh),
                    duration: const Duration(seconds: 3),
                  ),
        
        
         );
  }



    
}