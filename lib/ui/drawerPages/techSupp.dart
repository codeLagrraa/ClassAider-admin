import 'package:flutter/material.dart';

class TechSup extends StatelessWidget {
  const TechSup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Contact Us", style: TextStyle(
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
            child:  Text("Developer",
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
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              "Smart Solutions (PVT) Ltd.\nCall/ Whatsapp : 0702222327\nAddress: 128/A, Galahitiyawa, Ganemulla (Main Branch)\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18.0
              ),
            ),
          ),


        ],
      ),
    );
  }
}
