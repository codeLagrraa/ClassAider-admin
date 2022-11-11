import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/auth/login_screen.dart';
import 'package:ucscprojectmad/ui/posts/add_posts.dart';
import 'package:ucscprojectmad/utils/utils.dart';
import '../../main_menu_screen.dart';
import 'add_firestore_ann_data.dart';

class FireStoreScreenAnn extends StatefulWidget {
  const FireStoreScreenAnn({Key? key}) : super(key: key);

  @override
  State<FireStoreScreenAnn> createState() => _FireStoreScreenAnnState();
}

class _FireStoreScreenAnnState extends State<FireStoreScreenAnn> {


  final auth = FirebaseAuth.instance;
  final editController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('announcement').snapshots();

  CollectionReference ref = FirebaseFirestore.instance.collection('announcement');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Announcement'),
        centerTitle: true,
        actions: [
          SizedBox(width: 10.0,),
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> MainMenuScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.home),),
          SizedBox(width: 10.0,),

        ],
      ),

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
                                    Utils().toastMessage('Announcement Deleted!');
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFirestoreAnn()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreScreenAnn()));
                // Navigator.pop(context);
                ref.doc(id).update({
                  'title' : editController.text
                }).then((value){
                  Utils().toastMessage('Announcement Updated!');
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
