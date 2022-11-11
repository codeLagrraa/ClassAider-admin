import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';
import '../../main_menu_screen.dart';
import 'firestore_assignment_list_screen.dart';
import 'complete_list_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AssignmentWelcomeScreen extends StatefulWidget {
  const AssignmentWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentWelcomeScreen> createState() => _AssignmentWelcomeScreenState();
}

class _AssignmentWelcomeScreenState extends State<AssignmentWelcomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Texts',),
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
              title: Text('Assignments'),
            ),
            body: TabBarView(
              children: [
                const FireStoreScreenAssignment(),
                CompleteListPageAssignment(),
              ],
            ),
          ),
        );
  }
}
