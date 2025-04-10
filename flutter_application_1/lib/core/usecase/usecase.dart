
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Params> { 
   Future<Either<Failure, dynamic>> call(Params params);
}