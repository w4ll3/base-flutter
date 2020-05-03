import 'package:baseproject/core/error/dialog_info.dart';
import 'package:baseproject/core/usecases/usecase.dart';
import 'package:baseproject/features/retrieve_password/domain/datasources/retrieve_password_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class RetrievePassword implements UseCase<String> {
  const RetrievePassword(this._retrievePasswordRemoteDataSource);

  final RetrievePasswordRemote _retrievePasswordRemoteDataSource;

  @override
  Future<Either<DialogInfo, String>> call({
    @required String newPassword,
    @required String token,
  }) async {
    final result = await _retrievePasswordRemoteDataSource.retrievePassword(
      newPassword: newPassword,
      token: token,
    );
    return result.fold(
      (failure) => Left(DialogInfo.handleFailure(failure)),
      (result) {
        return Right(result);
      },
    );
  }
}
