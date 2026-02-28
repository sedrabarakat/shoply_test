import 'package:dartz/dartz.dart';
import 'package:shoply/features/shop/domain/repository/shop_repository.dart';

import '../../../../core/network/exceptions_service/network_exceptions.dart';
import '../entities/shop_entity.dart';

class ShopUsecase {

  ShopRepository shopRepository;

  ShopUsecase(this.shopRepository);

  Future<Either<NetworkExceptions, List<ShopEntity>>> getShops()=>shopRepository.getShops();
}