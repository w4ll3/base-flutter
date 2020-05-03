import 'package:baseproject/core/error/dialog_info.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T> {
  Future<Either<DialogInfo, T>> call();
}
