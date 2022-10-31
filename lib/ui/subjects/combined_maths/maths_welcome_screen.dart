import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../../../utils/utils.dart';
import '../../auth/login_screen.dart';
import '../../subject_selector.dart';
import 'firestore_note_list_screen.dart';
import '../../posts/post_screen.dart';
import 'complete_list_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class mathsWelcomeScreen extends StatefulWidget {
  const mathsWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<mathsWelcomeScreen> createState() => _mathsWelcomeScreenState();
}

class _mathsWelcomeScreenState extends State<mathsWelcomeScreen> {
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
              title: Text('Combined Maths'),
            ),
            body: TabBarView(
              children: [
                const FireStoreScreen(),
                CompleteListPage(),
              ],
            ),
          ),
        );
  }
}
