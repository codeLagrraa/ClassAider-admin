import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'image_list_componentC.dart';
import 'item_addC.dart';

class CompleteListPageC extends StatelessWidget {
  CompleteListPageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ImageListComponentC(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ItemAddC()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}