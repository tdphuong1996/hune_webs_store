

import 'base_response_model.dart';

class ProperData {
  static E getProperDataValue<E extends JsonConvertible>(
      Map<String, dynamic> jsonData) {
    switch (E) {
      case Error:
      default:
        throw UnsupportedError('Not Supported Type');
    }
  }
}
