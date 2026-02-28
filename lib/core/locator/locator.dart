import 'package:get_it/get_it.dart';
import 'package:shoply/core/network/dio_service/dio_service.dart';
import 'package:shoply/features/shop/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:shoply/features/shop/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:shoply/features/shop/data/repository_impl/shop_repo_impl.dart';
import 'package:shoply/features/shop/domain/repository/shop_repository.dart';
import 'package:shoply/features/shop/domain/usecase/shop_usecase.dart';

import '../network/api_services/api_service.dart';
import '../network/api_services/api_services_impl.dart';

final GetIt di = GetIt.instance;

Future<void> locatorSetUp() async {

  //api services
  di.registerLazySingleton<ApiServices>(()=>ApiServicesImp(DioService().dio));

  //>>>>>>>>>>>>>>>>>>>>>>>Shop<<<<<<<<<<<<<<<<<<<<<<<<
  di.registerLazySingleton<ShopRemoteDataSource>(()=>ShopRemoteDataSourceImpl(di<ApiServices>()));

  di.registerLazySingleton<ShopRepository>(()=>ShopRepositoryImpl(di<ShopRemoteDataSource>()));

  di.registerLazySingleton<ShopUsecase>(()=>ShopUsecase(di<ShopRepository>()));



}