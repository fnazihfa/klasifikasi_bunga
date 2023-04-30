import 'package:fleur/views/about_view.dart';
import 'package:fleur/views/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  List<Widget> screen = [
    HomeView(),
    AboutView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color(0xFF00A659),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xFFB6CCB8),
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: 'Scan',
                icon: Icon(Icons.camera),
              ),
              BottomNavigationBarItem(
                label: 'Tentang',
                icon: Icon(Icons.info_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
