import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UseProfile extends StatefulWidget {
  const UseProfile({Key? key}) : super(key: key);

  @override
  State<UseProfile> createState() => _UseProfileState();
}

class _UseProfileState extends State<UseProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference user = _firebaseFirestore.collection('users');
    String userid = _auth.currentUser!.uid;
    return SafeArea(
        child: FutureBuilder<DocumentSnapshot>(
            future:user.doc(userid).get(),
            builder: ((context, snapshot) {
            final   data =
              snapshot.data!.data();
              if (snapshot.hasError) {
                return Center(
                  child: Text("The Error is $snapshot.error "),
                );
              } else if (snapshot.hasData) {
                
                return ListView(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                  height: 200,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/profile1.jpg'),
                                          fit: BoxFit.cover))),
                              const Positioned(
                                left: 0,
                                right: 0,
                                bottom: -40,
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/profile1.jpg'),
                                    radius: 38,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Text("${snapshot.data!['firstname'] + " " + snapshot.data!['othername']}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          const Text("Flutter Engineer",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 155, 138, 138),
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  child: Icon(
                                    Icons.whatsapp,
                                    color: Colors.white,
                                  )),
                              SizedBox(width: 10),
                              CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                  )),
                              SizedBox(width: 10),
                              CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  child: Icon(
                                    Icons.telegram,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ]),
                    descriptioncont(label: "First Name"),
                    descriptioncont(label: "Last Name"),
                    descriptioncont(label: "Job Description")
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            })));
  }

  Padding descriptioncont({
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 42, 151, 151),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Center(
          child: ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Center(
              child: Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.normal)),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
   Future<void> _getUserDetails() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
Map<String,dynamic> userData = doc as Map<String,dynamic>;
    
   
  