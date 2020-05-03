import 'package:baseproject/core/error/dialog_info.dart';
import 'package:baseproject/core/usecases/usecase.dart';
import 'package:baseproject/features/auth/domain/datasources/auth_remote.dart';
import 'package:baseproject/features/secure_storage/domain/datasources/secure_data_source.dart';
import 'package:dartz/dartz.dart';

class Logout implements UseCase<bool> {
  const Logout(
    final this._authDataSource,
    final this._secureDataSource,
  );

  final AuthRemote _authDataSource;
  final SecureDataSource _secureDataSource;

  @override
  Future<Either<DialogInfo, bool>> call() async {
    final response = await _authDataSource.logout();

    if (response.isRight()) {
      await _secureDataSource.purge();
    }

    return response.fold(
      (failure) => Left(DialogInfo.handleFailure(failure)),
      (_) => const Right(true),
    );
  }
}
