import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_editing_app/page/predefined_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Image Cropper';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 

      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(253, 253, 253, 0.9),
        primaryColor: Colors.grey,
        cursorColor: Colors.grey,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: (isAuthenticated == true) ? TabBarContainer() : WelcomePage(),
      home: PredefinedPage(),
    );
  }
}

  List<File> imageFilesList = [];
