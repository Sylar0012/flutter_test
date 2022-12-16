import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageUploader(),
    );
  }
}

class ImageUploader extends StatefulWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

XFile? _pickedFile;

class _ImageUploaderState extends State<ImageUploader> {
  // 갤러리에 있는 사진 업로드
  _getPhotoLibraryImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  // 카메라로 사진 업로드
  _getCameraImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _pickedFile = pickedFile;
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택안함');
      }
    }
  }

  Uint8List fdsa = new Uint8List(0);

  // 이미지 base64로 전환
  postRequest(_pickedFile) async {
    File imageFile = File(_pickedFile.path);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);

    fsda(base64Image);
    print(fdsa);
  }

  fsda(base64Image) {
    fdsa = base64Decode(base64Image);
  }

  @override
  Widget build(BuildContext context) {
    final _imageSize = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 8),
          SizedBox(
            width: 400,
            height: 200,
            child: Column(
              children: [
                if (_pickedFile == null)
                  Container(
                    constraints: BoxConstraints(
                      minHeight: _imageSize,
                      minWidth: _imageSize,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _showBottomSheet();
                      },
                      child: Center(
                        child: Icon(
                          Icons.account_circle,
                          size: _imageSize,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    width: _imageSize,
                    height: _imageSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
                      image: DecorationImage(image: FileImage(File(_pickedFile!.path)), fit: BoxFit.cover),
                    ),
                  ),
              ],
            ),
          ),
          fdsa.isEmpty ? Text("사진을 업로드 하세요") : Container(child: Image.memory(fdsa)),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(221, 221, 221, 0.7)),
            child: TextButton(
              onPressed: () {
                _showBottomSheet();
              },
              child: Text(
                "편집",
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _getCameraImage();
              },
              child: const Text('사진찍기'),
            ),
            TextButton(
              onPressed: () {
                _getPhotoLibraryImage();
              },
              child: const Text('라이브러리에서 불러오기'),
            ),
            TextButton(
              onPressed: () {
                postRequest(_pickedFile);
              },
              child: const Text('이미지 base64로 파싱'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
