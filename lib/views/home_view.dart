import 'package:fleur/views/scan_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/gambar.png"),
                      fit: BoxFit.cover)),
              height: 100,
              width: double.maxFinite,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Klasifikasi Bunga',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () => logicButtonPickImage(
                context: context,
                isCamera: true,
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    ClipOval(
                      child: Container(
                        color: Color(0xFF00A659),
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
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () => logicButtonPickImage(
                context: context,
                isCamera: false,
              ),
              child: SizedBox(
                child: Column(
                  children: [
                    ClipOval(
                      child: Container(
                        color: Color(0xFF00A659),
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
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logicButtonPickImage(
      {required BuildContext context, required bool isCamera}) async {
    final ImagePicker picker = ImagePicker();
    String path = '';
    try {
      final getImage = await picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery);
      if (getImage != null) {
        path = getImage.path;
      } else {
        path = '';
      }
    } catch (e) {
      e.toString();
    }
    if (path != '') {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScanView(
          path: path,
        ),
      ));
    }
  }
}
