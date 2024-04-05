
import 'package:flutter/material.dart';
import 'package:task_fargona_it/presantation/widgets/Image_custom.dart';

import '../../../data/models/DemoModel.dart';

class FilterScreen extends StatefulWidget {
  List<DemoModel> list ;
  FilterScreen({required this.list ,super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: () {
            Navigator.pop(context) ;
          },
        ),
        backgroundColor: const Color(0xff141927),
        title: const Text(
          "FILTER" ,
          style: TextStyle(
            color: Colors.white ,
            fontSize: 18
          ),
        ),
      ),
      backgroundColor: const Color(0xff141927),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 250,
          ),
          itemBuilder: (_, index) {
            return GridContainerPortrait(
                widget.list[index].imgUri,
                widget.list[index].filmName,
                widget.list[index].filmTime,
                widget.list[index].janr,
                12
            );
          },
          itemCount: widget.list.length,
        ),
      ) ,
    );
  }
}
