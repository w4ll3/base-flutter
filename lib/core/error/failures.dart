import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.response);
  final Response response;

  static Failure getFailure(dynamic error) {
    Response response;
    if (error is DioError) {
      response = error.response;
      switch (response.statusCode) {
        case 400:
          return BadRequest(response);
        case 401:
          return Unauthorized(response);
        case 403:
          return Forbidden(response);
        case 404:
          return NotFoundFailure(response);
        case 408:
          return RequestTimeout(response);
        case 422:
          return UnprocessableEntity(response);
        default:
          if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
              error.type == DioErrorType.CONNECT_TIMEOUT) {
            return RequestTimeout(response);
          }
          return InternalServerError(response);
      }
    }
    response = Response(statusCode: -1, data: error.toString());
    return InternalServerError(response);
  }
}

class NoConnectionFailure extends Failure {
  NoConnectionFailure() : super(Response(statusCode: -1));

  @override
  List<Object> get props => [response];
}

class BadRequest extends Failure {
  const BadRequest(Response response) : super(response);

  @override
  List<Object> get props => [response];
}

class Unauthorized extends Failure {
  const Unauthorized(Response response) : super(response);

  @override
  List<Object> get props => [response];
}

class Forbidden extends Failure {
  const Forbidden(Response response) : super(response);

  @override
  List<Object> get props => [response];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(Response response) : super(response);

  @override
  List<Object> get props => [response];
}

class RequestTimeout extends Failure {
  const RequestTimeout(Response response) : super(response);

  @override
  List<Object> get props => [response];
}

class UnprocessableEntity extends Failure {
  const UnprocessableEntity(Response response) : super(response);

  @override
  List<Object> get props => [response];
}

class InternalServerError extends Failure {
  const InternalServerError(Response response) : super(response);

  @override
  List<Object> get props => [response];
}
