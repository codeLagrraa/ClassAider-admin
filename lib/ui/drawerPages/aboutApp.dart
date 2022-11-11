import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("About App", style: TextStyle(
        color: Colors.white70,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),),
      centerTitle: true,
    ),
      backgroundColor: Colors.blue.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child:  Text("Introduction",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blue.shade900,
                fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                fontSize: 20.0
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Text(
              "This android app \"ClassAider\" is designed for make easy your academic activities. By this app you can make a complete note including images for different subjects. This app can use in single class room of a school or set of classes who following same subjects set (Physical subjects - Combined Maths, Chemistry, Physics). "
                  "And also this app includes modules for general subjects (GIT Exam- General Information Technology Examination and) General English.",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.0
              ),
            ),
          ),

          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child:  Text("Features of Class Aider - Version 1.0",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Text(
              "Create complete notes for lessons and add related images. So you can create notes anytime. Anywhere. In a clear manner. And also students can access them in a easy manner.",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: Text(
              "People who has access to admin app, can create/ edit or delete items",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Text(
              "You can add images by file manager or can take photos directly.\nAnd this is summary of facilities\n\nSubject notes management\nMake Announcements\nPublish Exam results\nPublish Assignments",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child:  Text("Upcoming version (Class Aider - Version 1.1)",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Text(
              "In the next version of Class Aider you will be able to save pdfs, docx files and images seperately. For more information, please stay tuned with us. Visit www.nimeshappsucsc.lk",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}
