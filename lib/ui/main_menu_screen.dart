
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/splash_screen.dart';
import 'package:ucscprojectmad/ui/subjects/chemistry/che_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/maths_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/englishh/en_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/git/git_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/physics/physics_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects_selecting_screen.dart';
import 'package:ucscprojectmad/widgets/round_button.dart';

import '../utils/utils.dart';
import 'auth/login_screen.dart';
import 'dash.dart';
import 'drawerPages/aboutApp.dart';
import 'drawerPages/error_reporting/err_welcome_screen.dart';
import 'drawerPages/techSupp.dart';
import 'main_menu_items/admin_details.dart';
import 'main_menu_items/announcement/ann_welcome_screen.dart';
import 'main_menu_items/assignment/assignment_welcome_screen.dart';
import 'main_menu_items/exam_results/exam_results_welcome_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        // actions: [
        //   SizedBox(width: 10.0,),
        //   IconButton(onPressed: (){
        //     auth.signOut().then((value){
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context)=> LoginScreen()));
        //     }).onError((error, stackTrace){
        //       Utils().toastMessage(error.toString());
        //     });
        //   }, icon: Icon(Icons.logout_outlined),),
        //   SizedBox(width: 10.0,),
        //
        // ],
        title: Text('Main Menu'),
        backgroundColor: Colors.blue.shade700,
      ),

      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.blueAccent

                  ]
              )
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
               DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("./assets/virtual-class.png", width: 78.0,),
                      SizedBox(height: 10.0,),
                      Text('ClassAider - ADMIN', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text('version - 1.0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white, fontStyle: FontStyle.italic),),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.newspaper,
                ),
                title: const Text('Error Reporting'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> FireStoreScreenError()));
                },
              ),
              Divider(
                  color: Colors.black
              ),
              ListTile(
                leading: Icon(
                  Icons.circle,
                ),
                title: const Text('About App'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> AboutApp()));
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.circle,
              //   ),
              //   title: const Text('Admin List'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              ListTile(
                leading: Icon(
                  Icons.circle,
                ),
                title: const Text('Contact Us'),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> TechSup()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: (){
                  auth.signOut().then((value){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> LoginScreen()));
                  }).onError((error, stackTrace){
                    Utils().toastMessage(error.toString());
                  });
                },
              ),
            ],
          ),
        ),
      ),
      //drawer end
      backgroundColor: Colors.black,
      body:
      SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.blue

                  ]
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.0,),
                Center(
                  child: Wrap(
                    spacing: 25.0,
                    runSpacing: 30.0,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            // primary: Colors.purpleAccent.shade700,
                            padding: EdgeInsets.all(0)
                        ),
                        child: Container(
                          child: SizedBox(
                            width: 140.0,
                            height: 140.0,
                            child: Card(
                              color: Colors.blue.shade200,
                              //color: Color.fromARGB(200, 20, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15.0),
                                      Image.asset("./assets/tutorial.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("Lesson Page", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectSelector()));
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            // primary: Colors.purpleAccent.shade700,
                            padding: EdgeInsets.all(0)
                        ),
                        child: Container(
                          child: SizedBox(
                            width: 140.0,
                            height: 140.0,
                            child: Card(
                              color: Colors.blue.shade200,
                              //color: Color.fromARGB(200, 20, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15.0),
                                      Image.asset("./assets/exam.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("Exam Results", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ExamWelcomeScreen()));
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            // primary: Colors.purpleAccent.shade700,
                            padding: EdgeInsets.all(0)
                        ),
                        child: Container(
                          child: SizedBox(
                            width: 140.0,
                            height: 140.0,
                            child: Card(
                              color: Colors.blue.shade200,
                              //color: Color.fromARGB(200, 20, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15.0),
                                      Image.asset("./assets/loudspeaker.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("Announcement", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreScreenAnn()));
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            // primary: Colors.purpleAccent.shade700,
                            padding: EdgeInsets.all(0)
                        ),
                        child: Container(
                          child: SizedBox(
                            width: 140.0,
                            height: 140.0,
                            child: Card(
                              color: Colors.blue.shade200,
                              //color: Color.fromARGB(200, 20, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15.0),
                                      Image.asset("./assets/assignment.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("Assignments", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AssignmentWelcomeScreen();
                            }),
                          );
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            // primary: Colors.purpleAccent.shade700,
                            padding: EdgeInsets.all(0)
                        ),
                        child: Container(
                          child: SizedBox(
                            width: 140.0,
                            height: 140.0,
                            child: Card(
                              color: Colors.blue.shade200,
                              //color: Color.fromARGB(200, 20, 21, 21),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15.0),
                                      Image.asset("./assets/admin.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("Admin Details", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AdminList();
                            }),
                          );
                        },
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      //       // primary: Colors.purpleAccent.shade700,
                      //       padding: EdgeInsets.all(0)
                      //   ),
                      //   child: Container(
                      //     child: SizedBox(
                      //       width: 140.0,
                      //       height: 140.0,
                      //       child: Card(
                      //         color: Colors.blue.shade200,
                      //         //color: Color.fromARGB(200, 20, 21, 21),
                      //         elevation: 2.0,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10.0),
                      //         ),
                      //         child: Center(
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Column(
                      //               children: [
                      //                 SizedBox(height: 15.0),
                      //                 Image.asset("./assets/english.png", width: 58.0,),
                      //                 SizedBox(height: 15.0),
                      //                 Text("G.ENGLISH", style: TextStyle(
                      //                     color: Colors.blue.shade900,
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 20.0
                      //                 ),),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   onPressed: (){
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(builder: (context) {
                      //     //     return MyProfile();
                      //     //   }),
                      //     // );
                      //   },
                      // ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
