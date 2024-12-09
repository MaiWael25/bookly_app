import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String errMessae;

  const Failure(this.errMessae);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessae);
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('recieve timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate received from the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('Bad certificate received from the server');
      case DioExceptionType.unknown:
        return ServerFailure(
            'An unknown error occurred. Please try again later');
      default:
        return ServerFailure('Opps There was an Error , Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found,  Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error , Please ry again latter!');
    } else {
      return ServerFailure('Opps There was an Error , Please try again');
    }
  }
}
