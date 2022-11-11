import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'image_list_component_exam_results.dart';
import 'result_add.dart';

class CompleteListPageExam extends StatelessWidget {
  CompleteListPageExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ImageListComponentExam(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ItemAddExam()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}