import 'package:ham_qrg/clients/api/model/response_model/response_model.dart';

abstract interface class ResponseMappers<T> {
  ResponseModel mapResponseModel(T response);
}
