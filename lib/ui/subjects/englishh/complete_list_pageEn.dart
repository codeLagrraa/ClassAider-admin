import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'image_list_componentEn.dart';
import 'item_addEn.dart';

class CompleteListPageEn extends StatelessWidget {
  CompleteListPageEn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ImageListComponentEn(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ItemAddEn()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}