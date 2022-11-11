import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';
import '../../main_menu_screen.dart';
import 'firestore_exam_results_list_screenC.dart';
import 'complete_list_page_exam_results.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ExamWelcomeScreen extends StatefulWidget {
  const ExamWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<ExamWelcomeScreen> createState() => _ExamWelcomeScreenState();
}

class _ExamWelcomeScreenState extends State<ExamWelcomeScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Results lists',),
                  Tab(text: 'Result sheet photos',),
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
              title: Text('Examination Results'),
            ),
            body: TabBarView(
              children: [
                const FireStoreScreenExam(),
                CompleteListPageExam(),
              ],
            ),
          ),
        );
  }
}
