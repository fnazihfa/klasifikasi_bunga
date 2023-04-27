import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.maxFinite,
              color: Color(0XFF00A659),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Klasifikasi Bunga',
            style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      color: Color(0XFF00A659),
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.camera_alt,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text('Kamera'),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              child: Column(
                children: [
                  ClipOval(
                    child: Container(
                      color: Color(0XFF00A659),
                      height: 80,
                      width: 80,
                      child: Icon(
                        Icons.photo,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text('Galeri'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}