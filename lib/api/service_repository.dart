import 'dart:core';

import 'package:hune_webs_store/model/base_response_model.dart';

import '../common/result.dart';
import '../model/request_model.dart';
import 'dio_network.dart';
import 'repository/repository.dart';


class ServiceRepository extends BaseRepository {
  final DioNetwork _dioNetwork = DioNetwork();

  Future<Result<BaseResponseModel<T>>>requestApi<T>(String actionName,Map<String,dynamic> param ,{String serviceCode = ''}) {
    Map<String ,dynamic> baseParam = {
      'OS':'Android',
      'HardwareIds':'',
      'Take':20,
    };
    baseParam.addAll(param);
    final map = {
      'ClientName':'',
      'ActionName':actionName,
      'ServiceCode':serviceCode,
      'Parameter':baseParam,
    } ;
    return safeApiCall(_post<T>(param: map));
  }

  Future<BaseResponseModel<T>> _post<T>({ String path = "/home/1.0", Map<String, dynamic>? param }) async {
    final response = await _dioNetwork.getDio().post(
        path, queryParameters: param);
    BaseResponseModel<T>  responseData = BaseResponseModel.fromJson(response.data);
    return responseData;
  }
}