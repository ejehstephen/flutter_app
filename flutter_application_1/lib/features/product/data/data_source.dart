
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/errors/exception.dart';
import 'package:flutter_application_1/features/product/data/model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<String>> getCategories();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts() async {
    const url = 'https://fakestoreapi.com/products';
    
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<String>> getCategories() async {
    const url = 'https://fakestoreapi.com/products/categories';
    
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((category) => category.toString()).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
