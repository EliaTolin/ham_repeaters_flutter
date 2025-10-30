import 'package:quiz_radioamatori/clients/api/model/response_model/response_model.dart';

abstract interface class ResponseMappers<T> {
  ResponseModel mapResponseModel(T response);
}
