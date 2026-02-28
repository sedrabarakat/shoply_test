import 'package:dartz/dartz.dart';
import 'package:shoply/core/network/exceptions_service/network_exceptions.dart';
import 'package:shoply/features/shop/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:shoply/features/shop/data/models/shop_model.dart';
import 'package:shoply/features/shop/domain/entities/shop_entity.dart';
import 'package:shoply/features/shop/domain/repository/shop_repository.dart';

class ShopRepositoryImpl extends ShopRepository {
  ShopRemoteDataSource remoteSource;

  ShopRepositoryImpl(this.remoteSource);

  @override
  Future<Either<NetworkExceptions, List<ShopEntity>>> getShops() async {
    final result = await remoteSource.getShops();

    return result.fold(
          (error) => left(error),
          (list) {
        final List<ShopEntity> shopEntities = ShopEntity.fromModelList(list);
        return right(shopEntities);
      },
    );
  }
}
