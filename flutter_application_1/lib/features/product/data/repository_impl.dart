import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/features/product/data/data_source.dart';

import 'package:flutter_application_1/features/product/domain/entities.dart' as entity;
import 'package:flutter_application_1/features/product/domain/repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<entity.Product>>> getProducts() async {
    try {
      final productModels = await remoteDataSource.getProducts();
      final products = productModels.map((model) => entity.Product(
            id: model.id,
            title: model.title,
            price: model.price,
            description: model.description,
            category: model.category,
            image: model.image,
            rating: entity.Rating(
              rate: model.rating.rate,
              count: model.rating.count,
            ),
          )).toList();
      return Right(products);
    } on ServerException {
      return Left(ServerFailure("Failed to load products"));
    } on NetworkException {
      return Left(ServerFailure("Network error occurred"));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on ServerException {
      return Left(ServerFailure("Failed to load categories"));
    } on NetworkException {
      return Left(ServerFailure("Network error occurred"));
    }
  }
}
