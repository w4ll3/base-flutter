import 'package:baseproject/core/error/failures.dart';
import 'package:baseproject/core/network/network_info.dart';
import 'package:baseproject/features/retrieve_password/domain/datasources/retrieve_password_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RetrievePasswordRemoteImpl implements RetrievePasswordRemote {
  const RetrievePasswordRemoteImpl(
    final this._client,
    final this._networkInfo,
  );

  final Dio _client;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, String>> sendToken({
    final String document,
    final String email,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        _client.unlock();
        return const Right('');
      } catch (err) {
        return Left(Failure.getFailure(err));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> validateToken({
    final String token,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        return const Right('');
      } catch (err) {
        return Left(Failure.getFailure(err));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> retrievePassword({
    final String newPassword,
    final String token,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        return const Right('');
      } catch (err) {
        return Left(Failure.getFailure(err));
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
}
