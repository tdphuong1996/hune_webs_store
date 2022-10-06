import 'package:hune_webs_store/model/parser_model.dart';

class BaseResponseModel<T> extends JsonConvertible {
  int? resultCode;
  String? messageInfo;
  T? data;

  BaseResponseModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    resultCode = json['ResultCode'];
    messageInfo = json['MessageInfo'];
    data = ProperData.getProperDataValue(json);
  }

  bool isSuccess() {
    return resultCode == 1;
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

abstract class JsonConvertible {
  Map<String, dynamic> toJson();

  JsonConvertible.fromJson(Map<String, dynamic> json);
}
