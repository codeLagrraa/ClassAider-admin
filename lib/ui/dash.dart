import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucscprojectmad/ui/subjects/chemistry/che_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/maths_welcome_screen.dart';
import 'package:ucscprojectmad/ui/subjects/physics/physics_welcome_screen.dart';
class Dashboard extends StatelessWidget {
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
        title: Text('Select Subject'),
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
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                ),
                title: const Text('Page 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.train,
                ),
                title: const Text('Page 2'),
                onTap: () {
                  Navigator.pop(context);
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
                                      Image.asset("./assets/maths.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("CO.MATHS", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => mathsWelcomeScreen()));
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
                                      Image.asset("./assets/relativity.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("PHYSICS", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => physicsWelcomeScreen()));
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
                                      Image.asset("./assets/chemistry.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("CHEMISTRY", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => cheWelcomeScreen()));
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
                                      Image.asset("./assets/english.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("G.ENGLISH", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return MyProfile();
                          //   }),
                          // );
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
                                      Image.asset("./assets/computer.png", width: 58.0,),
                                      SizedBox(height: 15.0),
                                      Text("GIT EXAM", style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return MyProfile();
                          //   }),
                          // );
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

