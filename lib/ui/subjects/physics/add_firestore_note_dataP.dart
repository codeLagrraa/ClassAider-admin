import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../../../utils/utils.dart';
import 'physics_welcome_screen.dart';
import 'firestore_note_list_screenP.dart';
import 'package:intl/intl.dart';

class AddFirestoreDataScreenP extends StatefulWidget {
  const AddFirestoreDataScreenP({Key? key}) : super(key: key);

  @override
  State<AddFirestoreDataScreenP> createState() => _AddFirestoreDataScreenPState();
}

class _AddFirestoreDataScreenPState extends State<AddFirestoreDataScreenP> {

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  String tdata = DateFormat("hh:mm:ss a").format(DateTime.now());

  final postController =TextEditingController();
  bool loading = false ;
  final fireStore = FirebaseFirestore.instance.collection('phy_notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),

            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'What is in your mind?' ,
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                title: 'Add',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true ;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => physicsWelcomeScreen()));
                  String id = formatted.toString() + ' - ' + tdata.toString();
                  fireStore.doc(id).set({
                    'title': postController.text.toString(),
                    'id': id,
                  }).then((value){
                    setState(() {
                      loading = false ;
                    });
                    Utils().toastMessage('Post added');
                  }).onError((error, stackTrace){
                    setState(() {
                      loading = false ;
                    });
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }

}
