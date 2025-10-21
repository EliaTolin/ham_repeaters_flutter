import 'package:app_template/clients/api/model/response_model.dart';

abstract interface class ResponseMappers<T> {
  ResponseModel mapResponseModel(T response);
}
