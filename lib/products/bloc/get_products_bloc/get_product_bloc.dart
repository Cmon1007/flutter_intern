import 'dart:async';
import 'package:e_commerce/products/repository/adding_new_product.dart';
import 'package:e_commerce/products/repository/product_api.dart';
import 'package:e_commerce/products/repository/search_product.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/product_model.dart';
part 'get_product_event.dart';
part 'get_product_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductInitialState()) {
    on<GetProductDetailEvent>(getProductDetailEvent);
    on<GetIndividualProductEvent>(getIndividualPrductEvent);
    on<AddNewProductEvent>(addNewProductEvent);
    on<SearchProductEvent>(searchProductEvent);
  }

  FutureOr<void> getProductDetailEvent(GetProductDetailEvent event, Emitter<ProductDetailState> emit) async{
    emit(ProductLoadingState());
    List<ProductModel> products= await ProductRepo.fetchProducts();
            emit(ProductSuccessState(productList: products));
            // List<dynamic> productsData = responseData["products"];
            // print(productsData);
          }


  FutureOr<void> getIndividualPrductEvent(GetIndividualProductEvent event, Emitter<ProductDetailState> emit) async{
    emit(ProductLoadingState());
    List<Product> detail=await ProductRepo().fetchProductDetail(event.id);
    emit(ProductDetailSuccessState(detail: detail));
  }

  FutureOr<void> addNewProductEvent(AddNewProductEvent event, Emitter<ProductDetailState> emit) async{
        ProductModel? succes=await AddNewProduct.addProduct();
        print(succes);
  }

  FutureOr<void> searchProductEvent(SearchProductEvent event, Emitter<ProductDetailState> emit) async{
    emit(ProductLoadingState());
    List<ProductModel> products=await SearchProduct.searchProduct(event.query);
    emit(ProductSuccessState(productList: products));

  }
}

