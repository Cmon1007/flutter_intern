part of 'get_product_bloc.dart';

@immutable
abstract class ProductDetailState  {

}
abstract class ProductDetailActionState extends ProductDetailState{}
class ProductInitialState extends ProductDetailState {

}
class ProductLoadingState extends ProductDetailState {

}
class ProductSuccessState extends ProductDetailState {
  final List<ProductModel> productList;
  ProductSuccessState({
    required this.productList
});
}
class ProductFailureState extends ProductDetailState
{

}
class ProductDetailSuccessState extends ProductDetailState{
  final List<Product> detail;
  ProductDetailSuccessState(
  {
    required this.detail
}
      );
}
class ProductAddSuccessState extends ProductDetailActionState{

}
class ProductAddFailureState extends ProductDetailActionState{

}


