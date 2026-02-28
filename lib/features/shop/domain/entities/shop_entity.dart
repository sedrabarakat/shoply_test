import '../../data/models/shop_model.dart';

class ShopEntity {
  final String coverPhoto;
  final String shopName;
  final String description;
  final String estimatedDeliveryTime;
  final double minimumOrder;
  final String currency;
  final String location;
  final bool availability;

  ShopEntity({
    required this.coverPhoto,
    required this.shopName,
    required this.description,
    required this.estimatedDeliveryTime,
    required this.minimumOrder,
    required this.location,
    required this.availability,
    required this.currency
  });


  factory ShopEntity.fromModel(ShopModel model) {
    return ShopEntity(
      coverPhoto: model.coverPhoto,
      shopName: model.shopName['en'] ?? '',
      description: model.description['en'] ??'',
      estimatedDeliveryTime: model.estimatedDeliveryTime,
      minimumOrder: model.minimumOrder.amount,
      currency: model.minimumOrder.currency,
      location: model.address.fullAddress,
      availability: model.availability,
    );
  }

  static List<ShopEntity> fromModelList(List<ShopModel> models) {
    return models.map((model) => ShopEntity.fromModel(model)).toList();
  }

}