import 'package:blog/frontend/login.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UserMenuHolder extends StatelessWidget {
  const UserMenuHolder({
    Key? key,
   
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FocusedMenuHolder(
        menuWidth: MediaQuery.of(context).size.width * 0.5,
        menuOffset: -10,
        menuItems: [
          FocusedMenuItem(
              title: const Text('My Profile'),
              trailingIcon: const Icon(
                FontAwesomeIcons.user,
                size: 12,
              ),
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                //   return null;
                // }));
              }),
          FocusedMenuItem(
              title: const Text('logout'),
              trailingIcon: const Icon(
                FontAwesomeIcons.rightFromBracket,
                size: 12,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              })
        ],
        openWithTap: true,
        onPressed: () {},
        child: SizedBox(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(
                  'assets/profile1.jpg',
                  width: 30.0,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const Expanded(
                child:     Text(
                  "Name",
                  style:   TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
