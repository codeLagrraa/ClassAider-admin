import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../../../utils/utils.dart';
import '../../auth/login_screen.dart';
import '../../subject_selector.dart';
import 'firestore_note_list_screenC.dart';
import '../../posts/post_screen.dart';
import 'complete_list_pageC.dart';
import 'package:firebase_storage/firebase_storage.dart';

class cheWelcomeScreen extends StatefulWidget {
  const cheWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<cheWelcomeScreen> createState() => _cheWelcomeScreenState();
}

class _cheWelcomeScreenState extends State<cheWelcomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Quick Notes',),
                  Tab(text: 'Files',),
                ],
              ),
              centerTitle: true,
              actions: [
                SizedBox(width: 10.0,),
                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> subjectSelector()));
                }, icon: Icon(Icons.bookmarks_outlined),),
                SizedBox(width: 10.0,),

              ],
              title: Text('Chemistry'),
            ),
            body: TabBarView(
              children: [
                const FireStoreScreenC(),
                CompleteListPageC(),
              ],
            ),
          ),
        );
  }
}
