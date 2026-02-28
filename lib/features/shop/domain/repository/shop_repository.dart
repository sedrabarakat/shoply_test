import 'package:dartz/dartz.dart';
import '../../../../core/network/exceptions_service/network_exceptions.dart';
import '../entities/shop_entity.dart';

abstract class ShopRepository {

  Future<Either<NetworkExceptions, List<ShopEntity>>> getShops();
}