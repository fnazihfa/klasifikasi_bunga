import 'package:fleur/views/scan_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    loadModel();
    super.initState();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
      res = (await Tflite.loadModel(
      model: "assets/klasifikasi_model.tflite",
      labels: "assets/labels.txt",
    ))!;
    print(res);
  }

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
      String result = await imageClasification(path);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ScanView(
          path: path,
          result: result,
        ),
      ));
      
    }
  }

  Future <String> imageClasification(String path) async {
    List recognitions;
    recognitions = (await Tflite.runModelOnImage(
      path: path,   // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 2,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true      // defaults to true
    ))!;
    return recognitions[0]["label"];
  }
}
