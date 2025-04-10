import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/features/product/domain/entities.dart' as entity;
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<entity.Product>>> getProducts();
  Future<Either<Failure, List<String>>> getCategories();
}
