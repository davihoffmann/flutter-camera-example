import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_camera_exemple/upload_service.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Exemple"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.file_upload),
            onPressed: _onClickUpload,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tire uma foto',
              style: TextStyle(fontSize: 25),
            ),
            this._file != null
                ? Image.file(this._file)
                : Image.asset(
                    'assets/images/camera_icon.png',
                    width: 140,
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onClickCamera,
        child: Icon(Icons.camera),
      ),
    );
  }

  void _onClickCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      this._file = image;
    });
  }

  void _onClickUpload() {
    if(_file != null) {
      UploadService.upload(_file);
    }
  }
}
