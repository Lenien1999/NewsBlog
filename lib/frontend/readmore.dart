// ignore_for_file: unnecessary_const

import 'package:auto_size_text/auto_size_text.dart';
import 'package:blog/frontend/bottomnavigation.dart';
import 'package:flutter/material.dart';

 

class ReadMore extends StatefulWidget {
  const ReadMore({Key? key}) : super(key: key);

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
      bool _isExpandable=false;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 28, 28),
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BuildBottomNavigation()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 243, 234, 234),
            )),
        actions: const [
          Icon(
            Icons.share,
            color: Color.fromARGB(255, 235, 230, 230),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Stack(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BREAKING NEWS: fresh trouble loomn for Atiku and Obasanjo"
                                .toUpperCase(),
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 15),
                          RichText(
                            text: const TextSpan(
                              text: 'Legit   ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Feb., 28th 2023',
                                    style: TextStyle(
                                        height: 1.2,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: '''    Read Original!''',
                                    style: TextStyle(
                                        height: 1.2,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const Divider(height: 1),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const AutoSizeText(
                                  '''Did you mean: blog web application dribbble
Blog designs, themes, templates and downloadable ... - Dribbblehttps://dribbble.com › tags › blog
Blog. 36,156 inspirational designs, illustrations, and graphic elements from the world's best designers. Want more inspiration? Browse our search results.
You visited this page on 2/15/23.

Blog App designs, themes, templates and ... - Dribbblehttps://dribbble.com › tags › blog_app
Blog App. 206 inspirational designs, illustrations, and graphic elements from the world's best designers. Want more inspiration? Browse our search results.
You visited this page on 2/19/23.
Blog App designs, themes, templates and ... - Dribbblehttps://dribbble.com › tags › blog_app
Blog App. 206 inspirational designs, illustrations, and graphic elements from the world's best designers. Want more inspiration? Browse our search results.
You visited this page on 2/19/23.
''',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: const DecorationImage(
                                          image:
                                              AssetImage("assets/blog1.jpg"))),
                                ),
                                const Text(
                                    ''' Blog App designs, themes, templates and ... - Dribbblehttps://dribbble.com › tags › blog_app
Blog App. 206 inspirational designs, illustrations, and graphic elements from the world's best designers. Want more inspiration? Browse our search results.
You visited this page on 2/19/23.
Blog App designs, themes, templates and ... - Dribbblehttps://dribbble.com › tags › blog_app
Blog App. 206 inspirational designs, illustrations, and graphic elements from the world's best designers. Want more inspiration? Browse our search results.
You visited this page on 2/19/23.Blog App designs, themes, templates and ... - Dribbblehttps://dribbble.com › tags › blog_app
Blog App. 206 inspirational designs, illustrations, and graphic elements from the world's best designers. Want more inspiration? Browse our search results.
You visited this page on 2/19/23''')
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            height: 2,
                          ),
                          const Text(
                            "You may like",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.black),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'First make the strings first letter to uppercase using its index then concate the'
                                                  .toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 199, 193, 193)),
                                              textAlign: TextAlign.justify,
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: const [
                                                      Icon(Icons.timer_outlined,size: 12,
                                                          color: Colors.white),
                                                      Text('4 hours ago',
                                                          style: TextStyle(

                                                            fontSize: 12,
                                                              color: Colors
                                                                  .white)),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: const [
                                                      Icon(Icons.remove_red_eye,size: 12,
                                                          color: Color.fromARGB(
                                                              255,
                                                              204,
                                                              191,
                                                              191)),
                                                      Text('244',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      202,
                                                                      189,
                                                                      189))),
                                                    ],
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: 90,
                                        height: 112,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(17),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/blog1.jpg")))),
                                  ]),
                            ),
                          ),
                          const Divider(height: 20),
                          const Text("All Comment",
                          
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),  const Padding(
                            padding:   EdgeInsets.only(bottom: 40.0, top: 5),
                            child: ListTile(
                                leading:   CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text("A"),
                                ),
                                title: const Text(
                                  'Aminu Azeez',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                trailing: Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                ),
                                subtitle: Text(
                                    "We are voting for Tinubu not Atikuj")),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 40.0, top: 5),
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text("A"),
                                ),
                                title: Text(
                                  'Aminu Azeez',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                trailing: Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                ),
                                subtitle: Text(
                                    "We are voting for Tinubu not Atikuj")),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child:   Container(
                    color: const Color.fromARGB(255, 165, 28, 28),
                   height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 170,
                           height: 30.0,
                          child:  GestureDetector(
                                        onTap: () {
        setState(() {
          _isExpandable =!_isExpandable;
        });
      },
                            child:_isExpandable? Container(
                                                   
                                                    decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(30.0),
                                                    ),
                                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                    child: Row(
                                                    children: const[
                             Icon(Icons.person ,color:Color.fromARGB(255, 165, 28, 28) ),
                                                     
                            Expanded(
                              child: TextField(
                                // maxLines: 5,
                                decoration: InputDecoration(
                                              hintText: "Let's talk about it...",
                                              border: InputBorder.none,
                                ),
                              ),
                            ),
                                                    ],
                                                    ),
                                                  ):Container(),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Icon(Icons.comment, color: Colors.white),
                        const SizedBox(width: 15),
                        const Icon(Icons.favorite, color: Colors.white),
                        const SizedBox(width: 15),
                        const Icon(Icons.share, color: Colors.white),
                        const SizedBox(width: 15),
                        const Icon(Icons.whatsapp, color: Colors.white)
                      ],
                    ),
                  )
               
               
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
