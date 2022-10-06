import 'package:dio/dio.dart';
import 'package:hune_webs_store/common/error_type.dart';
import 'package:hune_webs_store/common/result.dart';


import '../../model/base_response_model.dart';


typedef EntityToModelMapper<Entity, Data> = Data? Function(Entity? entity);
typedef SaveResult<Data> = Future Function(Data? data);

abstract class BaseRepository {

  Future<Result<BaseResponseModel<T>>>
  safeApiCall<T>(
      Future<BaseResponseModel<T>> call) async {
    try {
      var response = await call;
      if (response.isSuccess()) {
        return Success(response);
      } else {
        return Error(ErrorType.GENERIC, response.messageInfo ?? 'Có lỗi trong quá trình xử lý');
      }
    } on Exception catch (exception) {
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Error(ErrorType.POOR_NETWORK, exception.message);
          case DioErrorType.other:
            return Error(ErrorType.NO_NETWORK, exception.message);

          case DioErrorType.response:
            return Error(ErrorType.GENERIC, exception.message);
        }
      }
      return Error(ErrorType.GENERIC, "Unknown API error");
    }
  }
}
