import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../api/firebase_api.dart';
import '../../../model/firebase_file.dart';
import '../../../page/image_page.dart';


class ImageListComponentAssignment extends StatefulWidget {
  @override
  _ImageListComponentAssignmentState createState() => _ImageListComponentAssignmentState();
}

class _ImageListComponentAssignmentState extends State<ImageListComponentAssignment> {
  FirebaseStorage storage = FirebaseStorage.instance;
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();

    futureFiles = FirebaseApi.listAll('images_assignment/');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<FirebaseFile>>(
      future: futureFiles,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text('Some error occurred!'));
            } else {
              final files = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // buildHeader(files.length),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return buildFile(context, file);
                      },
                    ),
                  ),
                ],
              );
            }
        }
      },
    ),
  );


  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(

      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
        },
      ),

      leading: ClipOval(
        child: Image.network(
          file.url,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
        ),
      ),

      title: Text(
        file.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: Colors.black54,
        ),
      ),
      subtitle: Text(
        'Image',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: Colors.black54,
        ),
      ),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
  builder: (context) => ImagePage(file: file),
  )),
  );

  Widget buildHeader(int length) => ListTile(
    tileColor: Colors.deepPurple,
    leading: Container(
      width: 52,
      height: 52,
      child: Icon(
        Icons.file_copy,
        color: Colors.white,
      ),
    ),
    title: Text(
      '$length Images',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}

