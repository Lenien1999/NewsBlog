 
import 'package:blog/frontend/addblog.dart';
import 'package:blog/frontend/health.dart';
import 'package:blog/frontend/userpopmenu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
     static const List<Widget> _tabs = [
      Center(child:   Text('Health')),
     Center(child:   Text('Politics')),
      Center(child:   Text('Art')),
      Center(child:   Text('Finance')),
  ];

   static const List<Widget> _views = [
     Health(),
     Center(child:   Text('Politics')),
      Center(child:   Text('Art')),
      Center(child:   Text('Finance')),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
      length: 4,
      child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:const Color.fromARGB(255, 167, 25, 25),
        onPressed: () { 
Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>const AddBlog())));
         },
        child: const Icon(Icons.add,color:Colors.white ),
      ),
        appBar: AppBar(
          
           backgroundColor:const Color.fromARGB(255, 167, 25, 25),
          actions: const [
             UserMenuHolder(),
          ],
          elevation:0,
           
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.white, )),
        ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
  const Text('Discover', style: TextStyle(color: Colors.black,fontSize: 26 ,fontWeight: FontWeight.bold),),
  const Text("News from all over the world",style: TextStyle(color: Color.fromARGB(255, 78, 75, 75),fontSize: 18 ,fontWeight: FontWeight.w400),),
         Container(
          margin: const EdgeInsets.symmetric(
            vertical: 30
          ),
           child: TextFormField(
            decoration: const InputDecoration(
               filled: true,
                      border : OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          
                        ),

            hintText: 'Search',
            suffixIcon:   Icon(Icons.search, color: Colors.grey, )
            ),
           ),
         ),
          TabBar(
             
         indicator: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
             isScrollable: true,
    labelColor: Colors.black,
    unselectedLabelColor: Colors.grey,
    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
    unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
    overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return const Color.fromARGB(255, 19, 19, 202);
      } if (states.contains(MaterialState.focused)) {
        return Colors.orange;
      } else if (states.contains(MaterialState.hovered)) {
        return Colors.pinkAccent;
      }
 
      return Colors.transparent;
    }),
    tabs: _tabs,
  ),    
  const SizedBox(height: 30,),
            const Flexible(
              child: TabBarView(
                
                  physics:   BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
                children:_views,
                
                ),
            ),
         
          ],
        ),
      ),
      ),
    );
  }
}
