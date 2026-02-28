import 'package:shoply/features/shop/data/models/shop_model.dart';
import 'package:shoply/features/shop/domain/entities/shop_entity.dart';

abstract class ShopStates {}

class InitShopStates extends ShopStates {}

class LoadingGetShopsList extends ShopStates {}

class ErrorGetShopsList extends ShopStates {
  String error;
  ErrorGetShopsList(this.error);
}

class SuccessGetShopsList extends ShopStates {
  List<ShopEntity> shopsList;

  SuccessGetShopsList(this.shopsList);
}

