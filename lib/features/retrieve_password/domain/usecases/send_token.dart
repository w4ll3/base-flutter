import 'package:baseproject/core/error/dialog_info.dart';
import 'package:baseproject/core/usecases/usecase.dart';
import 'package:baseproject/features/retrieve_password/domain/datasources/retrieve_password_remote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SendToken implements UseCase<String> {
  const SendToken(this._retrievePasswordRemoteDataSource);

  final RetrievePasswordRemote _retrievePasswordRemoteDataSource;

  @override
  Future<Either<DialogInfo, String>> call({
    @required String document,
    @required String email,
  }) async {
    final result = await _retrievePasswordRemoteDataSource.sendToken(
      document: document,
      email: email,
    );
    return result.fold(
      (failure) => Left(DialogInfo.handleFailure(failure)),
      (result) {
        return Right(result);
      },
    );
  }
}
