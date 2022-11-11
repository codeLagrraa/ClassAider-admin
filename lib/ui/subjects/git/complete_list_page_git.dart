import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ucscprojectmad/ui/subjects/combined_maths/image_list_component.dart';
import 'image_list_component_git.dart';
import 'item_add_git.dart';

class CompleteListPageG extends StatelessWidget {
  CompleteListPageG({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ImageListComponentG(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ItemAddG()));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}