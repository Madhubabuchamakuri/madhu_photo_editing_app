import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editing_app/main.dart';
import 'package:photo_editing_app/widget/floating_button.dart';
import 'package:image_picker/image_picker.dart';

import 'editScreen.dart';

class PredefinedPage extends StatefulWidget {



  @override
  _PredefinedPageState createState() => _PredefinedPageState();
}

class _PredefinedPageState extends State<PredefinedPage> {
  List<File> imageFiles = [];
  File _image;
  final picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageFiles = [...[]];
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Platform.isIOS
              ? Text("Images")
              : Container(
            child: Text(
              "Images",
              textAlign: TextAlign.center,
              
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
                              padding: EdgeInsets.all(15),

          child: GridView.builder(
            itemCount: imageFiles.length + 1,
            itemBuilder: (context, index) =>
                
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 250.0,
                    width: 90,
                      child: index==0 ? FloatingButtonWidget(onClicked: getImage) : Image.file(imageFiles[index-1]),),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
        ),
      );



  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        imageFiles = imageFilesList;
      });
   await Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => EditPhotoScreen(
              arguments: [_image],
            ),
          ),
        
      );
      setState(() {
        imageFiles = imageFilesList;
      });
    }
  }
 
}
