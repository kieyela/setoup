import 'package:appflutter/duration.dart';
import 'package:appflutter/maps.dart';
import 'package:appflutter/notifications.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => __NavbarState();
}

class __NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.blue,unselectedLabelColor: Colors.grey
        )
      ),
      home: const DefaultTabController(
        length: 3,
        child: Scaffold(
           bottomNavigationBar: BottomAppBar(
              child: TabBar(
                tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.location_on),
                ),
                Tab(
                  icon: Icon(Icons.notifications_none)
                ),
                ]
              ),
            ),
            body: TabBarView(
              children: [
                Center(child: Acceuil()),
                Center(child: MapSample()),
                Center(child: NotificationPage())
              ],
            ),
        ),
      ),
      
    );
  }
}