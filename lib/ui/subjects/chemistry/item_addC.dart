import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../utils/utils.dart';
import 'che_welcome_screen.dart';

class ItemAddC extends StatefulWidget {
  const ItemAddC({Key? key}) : super(key: key);

  @override
  State<ItemAddC> createState() => _ItemAddCState();
}

class _ItemAddCState extends State<ItemAddC> {
  GlobalKey<FormState> key = GlobalKey();
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Capture image', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file =
                      await imagePicker.pickImage(source: ImageSource.camera);
                      print('${file?.path}');

                      if (file == null) return;
                      //Import dart:core
                      String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';

                      /*Step 2: Upload to Firebase storage*/
                      //Install firebase_storage
                      //Import the library

                      //Get a reference to storage root
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                      referenceRoot.child('images_che');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        //Success: get the download URL
                        imageUrl = await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                      }
                    },
                    icon: Icon(Icons.camera_alt)),
                ElevatedButton(
                    onPressed: () async {
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Please upload an image')));
                        return;
                      };
                      Utils().toastMessage('Image added');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> cheWelcomeScreen()));
                    },
                    child: Text('Submit')),

          SizedBox(height: 40.0,),

                Text('Select image from gallery', style: TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                      print('${file?.path}');

                      if (file == null) return;
                      //Import dart:core
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';

                      /*Step 2: Upload to Firebase storage*/
                      //Install firebase_storage
                      //Import the library

                      //Get a reference to storage root
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                      referenceRoot.child('images_che');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file!.path));
                        //Success: get the download URL
                        imageUrl = await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                      }
                    },
                    icon: Icon(Icons.sd_storage_rounded)),
                ElevatedButton(
                    onPressed: () async {
                      if (imageUrl.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Please upload an image')));
                        return;
                      };
                      Utils().toastMessage('Image added');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> cheWelcomeScreen()));
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
