
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/chemistry/che_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/maths_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/physics/physics_welcome_screen.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../utils/utils.dart';
import 'auth/login_screen.dart';

class subjectSelector extends StatefulWidget {
  const subjectSelector({Key? key}) : super(key: key);

  @override
  State<subjectSelector> createState() => _subjectSelectorState();
}

class _subjectSelectorState extends State<subjectSelector> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //remove back button cuz it will come to splash again
        title: Text('Select Subject'),
        actions: [
          SizedBox(width: 10.0,),
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> LoginScreen()));
            }).onError((error, stackTrace){
              Utils().toastMessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined),),
          SizedBox(width: 10.0,),

        ],
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => mathsWelcomeScreen()));
              },
              icon: const Icon(Icons.cast_for_education,color: Colors.white,),
              label: const Text('Combined Maths',style: TextStyle(color: Colors.white),),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                elevation: 10,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => physicsWelcomeScreen()));
              },
              icon: const Icon(Icons.construction,color: Colors.white,),
              label: const Text('Physics', style: TextStyle(color: Colors.white),),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                elevation: 10,
                backgroundColor: Colors.deepPurple,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => cheWelcomeScreen()));
              },
              icon: const Icon(Icons.science, color: Colors.white,),
              label: const Text('Chemistry',style: TextStyle(color: Colors.white),),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
                elevation: 10,
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
