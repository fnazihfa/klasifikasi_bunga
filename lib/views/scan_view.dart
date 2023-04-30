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
      body: Image.file(File(path)),
    );
  }
}