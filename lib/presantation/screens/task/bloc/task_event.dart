part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class InitData extends TaskEvent {
}

class LoadData extends TaskEvent {
}

class SearchData extends TaskEvent {
  final String text;
  SearchData(this.text) ;
}

class ClickData extends TaskEvent {
  final String text ;
  ClickData(this.text) ;
}