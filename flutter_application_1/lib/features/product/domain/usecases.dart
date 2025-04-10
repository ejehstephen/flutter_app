import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/core/usecase/usecase.dart';
import 'package:flutter_application_1/features/product/domain/entities.dart';
import 'package:flutter_application_1/features/product/domain/repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProducts implements UseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call(NoParams params) async {
    return await repository.getProducts();
  }
}

class GetCategories implements UseCase<List<String>, NoParams> {
  final ProductRepository repository;

  GetCategories(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}

class NoParams {
  const NoParams();
}