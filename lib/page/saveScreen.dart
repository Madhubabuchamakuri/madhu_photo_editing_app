import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../main.dart';

class SaveImageScreen extends StatefulWidget {
  final List arguments;
  SaveImageScreen({this.arguments});
  @override
  _SaveImageScreenState createState() => _SaveImageScreenState();
}

class _SaveImageScreenState extends State<SaveImageScreen> {
  File image;
  bool savedImage;
  @override
  void initState() {
    super.initState();
    image = widget.arguments[0];
    imageFilesList.add(image);
    savedImage = false;
  }

  Future saveImage() async {
    renameImage();
    await GallerySaver.saveImage(image.path, albumName: "PhotoEditor");
    setState(() {
      savedImage = true;
    });
  }

  void renameImage() {
    String ogPath = image.path;
    List<String> ogPathList = ogPath.split('/');
    String ogExt = ogPathList[ogPathList.length - 1].split('.')[1];
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.day.toString().padLeft(2, '0')}-${today.month.toString().padLeft(2, '0')}-${today.year.toString()}_${today.hour.toString().padLeft(2, '0')}-${today.minute.toString().padLeft(2, '0')}-${today.second.toString().padLeft(2, '0')}";
    image = image.renameSync(
        "${ogPath.split('/image')[0]}/PhotoEditor_$dateSlug.$ogExt");
    print(image.path);
  }

  // void shareImage() {
    // final RenderBox box = context.findRenderObject();
    // if (Platform.isAndroid) {
    //   Share.shareFile(image,
    //       subject: 'Image edited by Photo Editor',
    //       text:
    //           'Hey, Look what I edited with this amazing app called Photo Editor.',
    //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    // } else {
    //   Share.share(
    //       'Hey, Look what I edited with this amazing app called Photo Editor.',
    //       subject: 'Image edited by Photo Editor',
    //       sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "Export Photo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Container(
                color: Theme.of(context).hintColor,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.9,
                child: PhotoView(
                  imageProvider: FileImage(image),
                  backgroundDecoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
            ),
            //
            Spacer(),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                      disabledElevation: 0,
                      heroTag: "SAVE",
                      label: savedImage ? Text("SAVED") : Text("SAVE"),
                      backgroundColor: savedImage
                          ? Colors.grey
                          : Theme.of(context).primaryColor,
                      onPressed: savedImage
                          ? null
                          : () {
                              saveImage();
                            }),
                ),
               SizedBox(
                 height: 80,
               )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
