import 'dart:convert';

import 'package:baseproject/core/error/dialog_info.dart';
import 'package:baseproject/core/serializers.dart';
import 'package:baseproject/core/usecases/usecase.dart';
import 'package:baseproject/features/auth/data/entities/login_response.dart';
import 'package:baseproject/features/auth/domain/datasources/auth_remote.dart';
import 'package:baseproject/features/secure_storage/domain/datasources/secure_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login implements UseCase<LoginResponse> {
  const Login(
    this._dioClient,
    this._authDataSource,
    this._secureDataSource,
  );

  final Dio _dioClient;
  final AuthRemote _authDataSource;
  final SecureDataSource _secureDataSource;

  @override
  Future<Either<DialogInfo, LoginResponse>> call({
    @required String username,
    @required String password,
  }) async {
    final response = await _authDataSource.login(
      username: username,
      password: password,
    );

    return response.fold(
      (failure) => Left(DialogInfo.handleFailure(failure)),
      (loginResponse) {
        _secureDataSource.save(
          SecureDataSource.TOKEN_KEY,
          jsonEncode(serializers.serializeWith<LoginResponse>(
            serializers.serializerForType(LoginResponse),
            loginResponse,
          )),
        );

        _dioClient.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            options.headers.addAll(
                {'Authorization': 'Bearer ${loginResponse.token.accessToken}'});
            return options;
          },
        ));
        return Right(loginResponse);
      },
    );
  }
}
