import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flos Aquae",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0), // Atur padding di sini
            child: Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: Container(
          
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              label: "Discovery",
              icon: Icon(Icons.location_city)
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Icon(Icons.bookmark)
            ),
            BottomNavigationBarItem(
              label: "Top Foodie",
              icon: Icon(Icons.favorite)
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person)
            )
          ],
        selectedLabelStyle: TextStyle(color: Colors.amber),
        unselectedLabelStyle: TextStyle(color: Colors.blueGrey),
        ),
      ),
    );
  }
}
