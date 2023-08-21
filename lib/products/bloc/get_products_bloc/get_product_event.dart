part of 'get_product_bloc.dart';

@immutable
abstract class ProductDetailEvent{

}
class GetProductDetailEvent extends ProductDetailEvent{

}
class GetIndividualProductEvent extends ProductDetailEvent{
  final int id;
  GetIndividualProductEvent(
  {
    required this.id,
  }
      );
}
class AddNewProductEvent extends ProductDetailEvent{

}
class SearchProductEvent extends ProductDetailEvent{
  final String query;
  SearchProductEvent({
    required this.query
});
}

