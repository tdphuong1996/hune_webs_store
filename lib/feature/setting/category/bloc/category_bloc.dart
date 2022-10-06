import 'package:bloc/src/bloc.dart';
import 'package:hune_webs_store/core/bloc/base_bloc.dart';
import 'package:hune_webs_store/core/bloc/event.dart';
import 'package:hune_webs_store/core/bloc/state.dart';

class CategoryBloc extends BaseBloc {
  CategoryBloc() : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {

  }
}
