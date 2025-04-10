import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/errors/failure.dart';
import 'package:flutter_application_1/features/product/domain/usecases.dart';
import 'package:flutter_application_1/features/product/presentation/bloc/product_event.dart';
import 'package:flutter_application_1/features/product/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final GetCategories getCategories;

  ProductBloc({
    required this.getProducts,
    required this.getCategories,
  }) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchCategories>(_onFetchCategories);
  }

  Future<void> _onFetchProducts(
    FetchProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    
    final result = await getProducts(const NoParams());
    
    result.fold(
      (failure) => emit(ProductError(message: _mapFailureToMessage(failure))),
      (products) => emit(ProductsLoaded(products: products)),
    );
  }

  Future<void> _onFetchCategories(
    FetchCategories event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    
    final result = await getCategories(const NoParams());
    
    result.fold(
      (failure) => emit(ProductError(message: _mapFailureToMessage(failure))),
      (categories) => emit(CategoriesLoaded(categories: categories)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    }
    return 'Unexpected error';
  }
}
