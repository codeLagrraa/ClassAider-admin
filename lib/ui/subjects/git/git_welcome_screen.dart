import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../../../utils/utils.dart';
import '../../auth/login_screen.dart';
import '../../main_menu_screen.dart';
import 'firestore_note_list_screen_git.dart';
import '../../posts/post_screen.dart';
import 'complete_list_page_git.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GitWelcomeScreen extends StatefulWidget {
  const GitWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<GitWelcomeScreen> createState() => _GitWelcomeScreenState();
}

class _GitWelcomeScreenState extends State<GitWelcomeScreen> {
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
                      MaterialPageRoute(builder: (context)=> MainMenuScreen()));
                }, icon: Icon(Icons.home),),
                SizedBox(width: 10.0,),

              ],
              title: Text('GIT Exam'),
            ),
            body: TabBarView(
              children: [
                const FireStoreScreenG(),
                CompleteListPageG(),
              ],
            ),
          ),
        );
  }
}
