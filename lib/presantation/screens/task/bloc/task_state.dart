part of 'task_bloc.dart';

class TaskState {

  List<DemoModel>? list ;
  bool? loadingFirstData ;
  bool? loading ;
  int count = 1 ;
  List<String>? imageList ;
  List<DemoModel>? clickData;
  
  TaskState({this.list , this.loadingFirstData , this.loading , this.imageList , this.clickData}) ;
  
  TaskState copyWith({List<DemoModel>? list, bool? loadingFirstData , bool? loading , List<String>? imageList , List<DemoModel>? clickData}) => TaskState(
      list : list ?? this.list, 
      loadingFirstData : loadingFirstData ?? this.loadingFirstData, 
      loading : loading ?? this.loading ,
      imageList: imageList ?? this.imageList ,
      clickData: clickData ?? this.clickData
  ) ;

}
