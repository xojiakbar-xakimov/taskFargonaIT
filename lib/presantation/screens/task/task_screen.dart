import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/DemoData.dart';
import '../../widgets/Image_custom.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/task_screen_film_wg.dart';
import '../filter/filter_screen.dart';
import 'bloc/task_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  final block = TaskBloc();
  final scrollController = ScrollController() ;


  @override
  void initState() {

    block.add(InitData()) ;
    scrollController.addListener(() {
        if(scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          block.add(LoadData());
          }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width ;
    return BlocProvider.value(
      value: block,
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (context, state) {

        },
        builder: (context, state) {

          if(state.loadingFirstData??false) {
           return const Center(
              child: CircularProgressIndicator(),
            );
          }else {
            return  SafeArea(
              child: Scaffold(
                backgroundColor: Color(0xff141927),
                body: OrientationBuilder(
                  builder: (context , orientation) {
                    if(orientation == Orientation.portrait) {
                      return Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Task for Fargona IT",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              onChanged: (text) {
                                block.add(SearchData(text));
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "Search",
                                prefixIcon: Icon(Icons.search_rounded),
                                filled: true,
                                fillColor: Color(0xff21283F),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(9)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  CustomCarouselWidget(imgList: state.imageList ?? [], click: (data) {
                                    DemoData demo = DemoData() ;
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen(list: DemoData().getDataByJanr(data))));

                                  } , ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        mainAxisExtent: 250,
                                      ),
                                      itemBuilder: (_, index) {
                                        if (index < (state.list ?? []).length) {
                                          return GridContainerPortrait(
                                            state.list?[index].imgUri ?? "",
                                            state.list?[index].filmName ?? "",
                                            state.list?[index].filmTime ?? "",
                                            state.list?[index].janr ?? "",
                                            size,
                                          );
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                      itemCount: (state.loading ?? false)
                                          ? (state.list ?? []).length + 1
                                          : (state.list ?? []).length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }else {
                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      "Task for Fargona IT",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15) ,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                                    child: Container(
                                      height: 50,
                                      child: TextField(
                                        onChanged: (text) {
                                          block.add(SearchData(text));
                                        },
                                        style: const TextStyle(color: Colors.white),
                                        decoration: const InputDecoration(
                                          hintText: "Search",
                                          prefixIcon: Icon(Icons.search_rounded),
                                          filled: true,
                                          fillColor: Color(0xff21283F),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(9)),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15) ,
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      mainAxisExtent: 150,
                                    ),
                                    itemBuilder: (_, index) {
                                      if (index < (state.list ?? []).length) {
                                        return GridContainerLandscape(
                                          state.list?[index].imgUri ?? "",
                                          state.list?[index].filmName ?? "",
                                          state.list?[index].filmTime ?? "",
                                          state.list?[index].janr ?? "",
                                          size,
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                    itemCount: (state.loading ?? false)
                                        ? (state.list ?? []).length + 1
                                        : (state.list ?? []).length,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );


                    //
                    }
                  },

                ),
              ),
            );
          }
        },
      ),
    );
  }
}