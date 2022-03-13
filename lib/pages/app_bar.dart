// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 182, 230, 252),
          borderRadius: BorderRadius.circular(46),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.16),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/dl.png",
              height: 25,
              alignment: Alignment.topCenter,
            ),
            SizedBox(width: 5),
            Text(
              "Spendings Tracker".toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Spacer(),
            MenuItem(
              title: "Home",
              press: () {},
            ),
            MenuItem(
              title: "About",
              press: () {},
            ),
            MenuItem(
              title: "Contact",
              press: () {},
            ),
            DefaultButton(text: "Login", press: () {}),
          ],
        ));
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;
  const MenuItem({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}


class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({
    Key? key, 
    required this.text, 
    required this.press,
  }) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        color: Color.fromARGB(255, 161, 217, 255),
        textColor: Colors.white,
        onPressed: () => press,
        child: Text(
          text.toUpperCase(),
        ),
      ),
    );
  }
}