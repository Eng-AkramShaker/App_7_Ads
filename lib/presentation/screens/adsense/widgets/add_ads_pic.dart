import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:uuid/uuid.dart';


import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:todotask/utils/constants/ColorManager.dart';

class AddAdsPicture extends StatefulWidget {
  const AddAdsPicture({super.key});

  @override
  _AddAdsPictureState createState() => _AddAdsPictureState();
}

class _AddAdsPictureState extends State<AddAdsPicture> {
  List<File> _images = [];

  Future<void> _getImages() async {
    List<Asset> pickedImages = [];
    try {
      pickedImages = await MultiImagePicker.pickImages();
    } catch (e) {
      print('Error picking images: $e');
    }

    if (pickedImages.isNotEmpty) {
      List<File> images = [];
      for (var pickedImage in pickedImages) {
        try {
          final ByteData byteData = await pickedImage.getByteData();
          final List<int> imageData = byteData.buffer.asUint8List();
          final tempDir = await getTemporaryDirectory();
          final tempFile = File('${tempDir.path}/${pickedImage.name}');
          await tempFile.writeAsBytes(imageData);
          images.add(tempFile);
        } catch (e) {
          print('Error converting asset to file: $e');
        }
      }
      setState(() {
        _images = images;
      });
    }
  }

  Future<void> _uploadImagesToFirebase(List<File> images) async {
    try {
      final firebase_storage.Reference storageRef =
          firebase_storage.FirebaseStorage.instance.ref('advImages');

      for (int i = 0; i < images.length; i++) {
        final File image = images[i];
         // Generate a unique name for each image using UUID
      final String uuid = Uuid().v4();
      final firebase_storage.Reference ref =
          storageRef.child('image_$uuid.jpg');// Use a unique name for each image
        await ref.putFile(image);
        print('Image $i uploaded to Firebase Storage');
      }
    } catch (e) {
      print('Error uploading images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.primary, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: _images.isNotEmpty
            ? Image.file(_images.first)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'أضف صورة الاعلان',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () async {
                        await _getImages();
                        await _uploadImagesToFirebase(_images);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
