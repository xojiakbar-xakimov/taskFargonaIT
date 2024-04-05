import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridContainerLandscape extends StatelessWidget {
  final String imgUri;

  final String filmName;

  final String filmTime;

  final String rejissor;
  final double size;

  const GridContainerLandscape(
      this.imgUri, this.filmName, this.filmTime, this.rejissor, this.size,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                imgUri,
                height: 150,
                fit: BoxFit.cover,
                width: 150,
              )),
          const SizedBox(width: 10) ,
          Column(

            children: [
              Spacer() ,
              Text(
                filmName ,
                style: const TextStyle(
                    color: Colors.white  ,
                    fontSize: 16
                ),
              ),
              const SizedBox(width: 5) ,
              Text(
                filmTime ,
                style: const TextStyle(
                    color: Color(0xff9597A3) ,
                    fontSize: 14
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
