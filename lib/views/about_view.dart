import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(border: Border.all()),
          child: Text('Fleur adalah aplikasi yang dapat membantu dalam mengklasifikasikan jenis bunga. Jenis bunga yang dapat diklasifikasikan yaitu daisy, dandelion, rose, sunflower, dan tulip. Aplikasi ini dibuat untuk tujuan pembelajaran dan sebagai syarat penyelesaian tugas akhir sarjana.'),
        ),
      ),
    );
  }
}