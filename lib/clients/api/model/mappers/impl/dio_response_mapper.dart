import 'package:app_template/clients/api/model/mappers/response_mappers.dart';
import 'package:app_template/clients/api/model/response_model.dart';
import 'package:dio/dio.dart';

class DioResponseMapper implements ResponseMappers<Response> {
  @override
  ResponseModel mapResponseModel(Response response) {
    return ResponseModel(
      statusCode: response.statusCode ?? 0,
      data: response.data,
    );
  }
}
