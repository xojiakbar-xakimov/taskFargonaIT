import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridContainerPortrait extends StatelessWidget {
  final String imgUri;

  final String filmName;

  final String filmTime;

  final String rejissor;
  final double size;

  const GridContainerPortrait(
      this.imgUri, this.filmName, this.filmTime, this.rejissor, this.size,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                imgUri,
                height: 170,
                fit: BoxFit.cover,
                width: double.infinity,
              )),
          const SizedBox(height: 10) ,
          Text(
            filmName ,
            style: const TextStyle(
                color: Colors.white  ,
                fontSize: 16
            ),
          ),
          const SizedBox(height: 5) ,
          Text(
            filmTime ,
            style: const TextStyle(
                color: Color(0xff9597A3) ,
                fontSize: 14
            ),
          )
        ],
      ),
    );
  }
}