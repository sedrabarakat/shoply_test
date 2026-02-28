import 'package:dartz/dartz.dart';
import 'package:shoply/core/network/api_services/api_service.dart';
import 'package:shoply/core/network/api_urls/api_config.dart';
import 'package:shoply/core/network/exceptions_service/network_exceptions.dart';
import 'package:shoply/features/shop/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:shoply/features/shop/data/models/shop_model.dart';

import '../../../../../core/data/models/api_request.dart';

class ShopRemoteDataSourceImpl extends ShopRemoteDataSource {
  ApiServices apiServices;

  ShopRemoteDataSourceImpl(this.apiServices);

  @override
  Future<Either<NetworkExceptions, List<ShopModel>>> getShops() async {
    try {
      final request = ApiRequest(
        url: ApiConfig.getShops,
        params: {'deviceKind': 'android'},
      );
      final response = await apiServices.get<List<ShopModel>>(
        request,
        (json) => ShopModel.getList(json as List),
      );

      return right(response.result ?? []);
    } on NetworkExceptions catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
