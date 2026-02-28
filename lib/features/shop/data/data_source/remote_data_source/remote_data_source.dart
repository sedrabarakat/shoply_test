import 'package:dartz/dartz.dart';
import '../../../../../core/network/exceptions_service/network_exceptions.dart';
import '../../models/shop_model.dart';

abstract class ShopRemoteDataSource {

  Future<Either<NetworkExceptions, List<ShopModel>>> getShops();
}