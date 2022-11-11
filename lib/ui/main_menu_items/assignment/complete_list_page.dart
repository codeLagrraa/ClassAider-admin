import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'image_list_component.dart';
import 'item_add.dart';

class CompleteListPageAssignment extends StatelessWidget {
  CompleteListPageAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ImageListComponentAssignment(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ItemAddAssignment()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}