
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../api/firebase_api.dart';
import '../../../model/firebase_file.dart';
import '../../../page/image_page.dart';


class ImageListComponentEn extends StatefulWidget {
  const ImageListComponentEn({Key? key}) : super(key: key);

  @override
  _ImageListComponentEnState createState() => _ImageListComponentEnState();
}

class _ImageListComponentEnState extends State<ImageListComponentEn> {
  FirebaseStorage storage = FirebaseStorage.instance;
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('images_en/');
  }
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  String tdata = DateFormat("hh:mm:ss a").format(DateTime.now());

  // Select and image from the gallery or take a picture with the camera
  // Then upload to Firebase Storage
  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages =
      referenceRoot.child('images_en');

      //Create a reference for the image to be stored
      Reference referenceImageToUpload =
      referenceDirImages.child(fileName);

      try {
        // Uploading the selected image with some custom meta data
        await referenceImageToUpload.putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': fileName,
              'description': formatted.toString() + ' - ' + tdata.toString(),
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
    referenceRoot.child('images_en');
    final ListResult result = await referenceDirImages.list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ??
            file.name.toString(),
        "description": 'Image',
      });
    });

    return files;
  }

  // Delete the selected image
  // This function is called when a trash icon is pressed
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ElevatedButton.icon(
            //         onPressed: () => _upload('camera'),
            //         icon: const Icon(Icons.camera),
            //         label: const Text('camera')),
            //     ElevatedButton.icon(
            //         onPressed: () => _upload('gallery'),
            //         icon: const Icon(Icons.library_add),
            //         label: const Text('Gallery')),
            //   ],
            // ),
            Expanded(
              child: FutureBuilder(
                future: _loadImages(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> image =
                        snapshot.data![index];
                        final files = snapshot.data!;
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => _delete(image['path']),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}