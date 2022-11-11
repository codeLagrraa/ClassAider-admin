import 'package:flutter/material.dart';

class AdminList extends StatelessWidget {
  const AdminList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Admin List", style: TextStyle(
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
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk",
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
            child:  Text("Teachers",
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
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),

          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
            child:  Text("Class Leaders",
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
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk\nClass: A",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk\nClass: B",
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Text(
              "Name: Ranatunge H A N T\nMobile: 0702222327\nE-mail: 2018cs131@stu.ucsc.cmb.ac.lk\nClass: C",
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
