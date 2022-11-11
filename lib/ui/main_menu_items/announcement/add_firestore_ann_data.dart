import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';
import '../../../utils/utils.dart';
import 'ann_welcome_screen.dart';
import 'package:intl/intl.dart';

class AddFirestoreAnn extends StatefulWidget {
  const AddFirestoreAnn({Key? key}) : super(key: key);

  @override
  State<AddFirestoreAnn> createState() => _AddFirestoreAnnState();
}

class _AddFirestoreAnnState extends State<AddFirestoreAnn> {

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  String tdata = DateFormat("hh:mm:ss a").format(DateTime.now());

  final postController =TextEditingController();
  bool loading = false ;
  final fireStore = FirebaseFirestore.instance.collection('announcement');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Announcement'),
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
                  hintText: 'Add announcement here' ,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreScreenAnn()));
                  String id = formatted.toString() + ' - ' + tdata.toString();
                  fireStore.doc(id).set({
                    'title': postController.text.toString(),
                    'id': id,
                  }).then((value){
                    setState(() {
                      loading = false ;
                    });
                    Utils().toastMessage('Announcement added');
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
