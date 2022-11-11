import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/auth/login_screen.dart';
import 'package:ucscprojectmad/ui/posts/add_posts.dart';
import 'package:ucscprojectmad/utils/utils.dart';

import 'physics_welcome_screen.dart';
import 'add_firestore_note_dataP.dart';

class FireStoreScreenP extends StatefulWidget {
  const FireStoreScreenP({Key? key}) : super(key: key);

  @override
  State<FireStoreScreenP> createState() => _FireStoreScreenPState();
}

class _FireStoreScreenPState extends State<FireStoreScreenP> {


  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('phy_notes').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('phy_notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                if(snapshot.hasError)
                  return Text('Some Error');
                return  Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(snapshot.data!.docs[index]['title'].toString()),
                          subtitle: Text(snapshot.data!.docs[index]['id'].toString()),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (context)=>[
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    showMyDialog(snapshot.data!.docs[index]['title'].toString(), snapshot.data!.docs[index]['id'].toString());
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text('Edit'),
                                ),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: ListTile(
                                  onTap: (){
                                    Navigator.pop(context);
                                    ref.doc(snapshot.data!.docs[index]['id'].toString()).delete();
                                    Utils().toastMessage('Post Deleted!');
                                  },
                                  leading: Icon(Icons.delete_outline),
                                  title: Text('Delete'),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFirestoreDataScreenP()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Future<void> showMyDialog(String title, String id)async{
    editController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: editController,
                decoration: InputDecoration(
                    hintText: 'Edit'
                ),
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancel')),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => physicsWelcomeScreen()));
                // Navigator.pop(context);
                ref.doc(id).update({
                  'title' : editController.text
                }).then((value){
                  Utils().toastMessage('Post Updated!');
                }).onError((error, stackTrace){
                  Utils().toastMessage(error.toString());
                });
              }, child: Text('Update'))
            ],
          );
        }
    );
  }
}
