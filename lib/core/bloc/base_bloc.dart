
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hune_webs_store/api/service_repository.dart';
import 'package:hune_webs_store/common/result.dart';
import 'package:hune_webs_store/core/bloc/state.dart';

import '../../common/error_type.dart';
import 'event.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {

  ServiceRepository get serviceRepository => ServiceRepository();

  BaseBloc(BaseState state) : super(state) {
    on<BaseEvent>((event, emit) async {
      if (event is InitialEvent) {
        await onInit(emit);
      } else {
        await handleEvent(event, emit);
      }
    });
  }

  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit);

  Future<void> onInit(Emitter<BaseState> emit) async {}

  Future<void> safeDataCall<T>(
    Emitter<BaseState> emit, {
    Future<Result<T>>? callToHost,
    Function(Emitter<BaseState> emit, T? data)? success,
    Function(Emitter<BaseState> emit)? loading,
    Function(Emitter<BaseState> emit, String message)? error,
  }) async {
    assert(callToHost != null,
        "at least callToHost or callToDb must be non-null ");
    loading != null ? loading.call(emit) : emit(LoadingDialogState(true));

    // call data from host.
    if (callToHost != null) {
      (await callToHost).when(success: (data) async {
        if (success == null) {
          hideDialogState(emit);
          emit(SuccessState(data));
        } else {
          success.call(emit, data);
        }
      }, error: (type, message) async {
        if (error == null) {
          hideDialogState(emit);
        }
        if (type == ErrorType.TOKEN_EXPIRED) {
          error != null
              ? error.call(emit, message)
              : emit(ErrorDialogState(message: message));
        } else {
          error != null
              ? error.call(emit, message)
              : emit(ErrorDialogState(message: message));
        }
      });
    }
  }

  void hideDialogState(Emitter<BaseState> emit) {
    if (state is DialogState) {
      emit(LoadingDialogState(false));
    }
  }
}
