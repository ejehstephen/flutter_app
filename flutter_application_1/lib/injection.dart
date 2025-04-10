import 'package:dio/dio.dart';
import 'package:flutter_application_1/features/product/data/data_source.dart';
import 'package:flutter_application_1/features/product/domain/repository.dart';
import 'package:flutter_application_1/features/product/data/repository_impl.dart';
import 'package:flutter_application_1/features/product/domain/usecases.dart';
import 'package:flutter_application_1/features/product/presentation/bloc/productBloc.dart';
import 'package:flutter_application_1/features/product/presentation/navigationbar/nav_bar.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupDependencies() {
  // External
  sl.registerLazySingleton(() => Dio());
  
  // Data Sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(dio: sl<Dio>()),
  );
  
  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl<ProductRemoteDataSource>()),
  );
  
  // Use Cases
  sl.registerLazySingleton(() => GetCategories(sl<ProductRepository>()));
  sl.registerLazySingleton(() => GetProducts(sl<ProductRepository>()));
  
  // BLoCs
  sl.registerFactory(() => NavigationCubit());
  sl.registerFactory(() => ProductBloc(
        getCategories: sl<GetCategories>(),
        getProducts: sl<GetProducts>(),
      ));
}