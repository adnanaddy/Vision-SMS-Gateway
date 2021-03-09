import 'package:flutter/material.dart';

Drawer buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.asset(
                  "images/icon.jpg",
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Rest SMS Gateway',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Row(
            children: [
              Icon(
                Icons.question_answer,
                color: Colors.blue,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Documentation',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          title: Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Settings',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          title: Row(
            children: [
              Icon(
                Icons.edit,
                color: Colors.blue,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Licence',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          onTap: () {},
        ),
        ListTile(
          title: Row(
            children: [
              Icon(
                Icons.insert_emoticon,
                color: Colors.blue,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'About',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}
