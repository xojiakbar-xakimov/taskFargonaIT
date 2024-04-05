
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/local/DemoData.dart';
import '../../../../data/models/DemoModel.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  TaskBloc() : super(TaskState()) {

    final DemoData demoData = DemoData() ;

    on<InitData>((event, emit) async {
      emit(state.copyWith(loadingFirstData: true)) ;
      List<DemoModel> list = await demoData.getAllData(1) ;
      emit(state.copyWith(list: list , loadingFirstData: false , imageList: demoData.getAllJanrs())) ;
    });

    on<LoadData>((event , emit) async {
      emit(state.copyWith(loading: true)) ;
      List<DemoModel> list = await demoData.getAllData(state.count++) ;
      list.addAll(state.list??[]) ;
      emit(state.copyWith(list: list , loading: false));
    });

    on<SearchData>((event , emit) {
      emit(state.copyWith(list : demoData.getDataByText(event.text)));
    });

    on<ClickData>((event , emit) {
      emit(state.copyWith(clickData: demoData.getDataByJanr(event.text))) ;
    });

  }
}
