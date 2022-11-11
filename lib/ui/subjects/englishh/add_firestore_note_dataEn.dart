import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../../../utils/utils.dart';
import 'en_welcome_screen.dart';
import 'firestore_note_list_screenEn.dart';
import 'package:intl/intl.dart';

class AddFirestoreDataScreenEn extends StatefulWidget {
  const AddFirestoreDataScreenEn({Key? key}) : super(key: key);

  @override
  State<AddFirestoreDataScreenEn> createState() => _AddFirestoreDataScreenEnState();
}

class _AddFirestoreDataScreenEnState extends State<AddFirestoreDataScreenEn> {

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  String tdata = DateFormat("hh:mm:ss a").format(DateTime.now());

  final postController =TextEditingController();
  bool loading = false ;
  final fireStore = FirebaseFirestore.instance.collection('eng_note');

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
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: postController,
              decoration: InputDecoration(
                  hintText: 'Add note here' ,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnWelcomeScreen()));
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
