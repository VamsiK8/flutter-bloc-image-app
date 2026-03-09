import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_bloc_app/features/products/domain/usecases/get_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<FetchProducts>(_onFetch);
    on<RefreshProducts>(_onRefresh);
  }

  Future<void> _onFetch(FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());

    try {
      final products = await getProducts();

      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onRefresh(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final products = await getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Refresh failed: ${e.toString()}"));
    }
  }
}
