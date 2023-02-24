import 'package:blog/frontend/readmore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../backend/controller.dart';
import '../backend/model.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  BlogController blogController = BlogController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BlogModel>>(
      stream: healthNews(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong $snapshot.error');
        } else if (snapshot.hasData) {
          return ListView(
              children: snapshot.data!.map<Widget>((blog) {
            return 
            
            
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const ReadMore()));
              },
              child: SizedBox(
                  height: 120,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 90,
                            height: 112,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                image: DecorationImage(
                                    image: NetworkImage(blog.image.toString(),scale: 1 ,)))),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${blog.headline}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(Icons.timer_outlined,
                                                color: Colors.grey),
                                            Text('4 hours ago',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.remove_red_eye,
                                                color: Colors.grey),
                                            Text('View',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        )
                      ])),
            );
          }).toList());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Stream<List<BlogModel>> healthNews() => FirebaseFirestore.instance
      .collection('politic')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => BlogModel.fromJson(doc.data())).toList());
}
