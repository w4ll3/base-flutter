import 'dart:async';
import 'dart:convert';

import 'package:baseproject/core/error/failures.dart';
import 'package:baseproject/core/network/network_info.dart';
import 'package:baseproject/features/auth/data/entities/login_response.dart';
import 'package:baseproject/features/auth/domain/datasources/auth_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRemoteImpl implements AuthRemote {
  const AuthRemoteImpl(
    final this._client,
    final this._networkInfo,
  );

  final Dio _client;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      _client.unlock();
      return const Right(true);
    } catch (err) {
      return Left(Failure.getFailure(err));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login({
    String username,
    String password,
    String deviceId,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(
          LoginResponse.fromJson(jsonEncode({
            "token": {
              "accessToken":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsidGVjZmluLWV4dGVuZC1wYXltZW50IiwidGVjZmluLWJhY2tvZmZpY2UiLCJ0ZWNmaW4tY3VzdG9tZXIiLCJ0ZWNmaW4tdXNlci1kb21haW4iLCJ0ZWNmaW4tY29udHJhY3QiXSwidXNlcl9pZCI6NSwidXNlcl9uYW1lIjoidXN1YXJpbyIsImxhc3RfbG9naW4iOiIyMDIwLTAxLTE2VDEwOjQ4OjMxLjMwNTg1MiIsInNjb3BlIjpbInJvbGVfdXNlciJdLCJleHAiOjE1NzkzNTE3MTEsImN1c3RvbWVyX2lkIjpudWxsLCJhdXRob3JpdGllcyI6WyJST0xFX1VTRVIiXSwianRpIjoiY2ZlMDFkYzYtYzIzNC00YTAyLWI5YTAtZTZhY2U4ZDY1MjhiIiwiZW1haWwiOiJlbWFpbEB1c3VhcmlvLmNvbSIsImNsaWVudF9pZCI6InRlY2ZpbiIsInVzZXJuYW1lIjoidXN1YXJpbyJ9.Ec2Cpy2PkcqIu-896zinjwjNvWY0wYirVaGkheflQho",
              "tokenType": "bearer",
              "refreshType": 'null',
              "expiresIn": 151486,
              "scope": "role_user",
              "lastLogin": "2020-01-16T10:48:31.305852"
            },
            "additionalInformation": {
              "login": "17786468080",
              "email": "usuario@dominio.com",
              "nome": "Roberto Alves",
              "usuarioId": 1,
              "clienteId": 1,
              "isPrimeiroAcesso": false,
              "pinCriado": false,
              "isDadosConfirmados": false,
              "isDeviceIdValido": true,
              "dadosConfirmados": true,
              "deviceId": 'null',
              "tokenAutenticacaoDTO": 'null',
              "isPinCriado": false,
              "statusAceiteTermosDeUsoVigente": "ACEITO"
            }
          })),
        );
      } catch (err) {
        print(err);
        return Left(Failure.getFailure(err));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
