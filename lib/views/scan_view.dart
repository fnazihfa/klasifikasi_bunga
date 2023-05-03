import 'dart:io';

import 'package:flutter/material.dart';

class ScanView extends StatelessWidget {
  const ScanView({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Klasifikasi Bunga"), backgroundColor: Color(0xFF00A659),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(File(path)),
            SizedBox(height: 50,),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.all(24),
                child: Text("Dandelion",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}