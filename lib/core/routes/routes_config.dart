import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply/core/routes/routes_path.dart';
import 'package:shoply/features/shop/domain/usecase/shop_usecase.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_bloc.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_events.dart';
import 'package:shoply/features/shop/presentation/pages/shops_list_page.dart';

import '../locator/locator.dart';


class AppRoutes {
  AppRoutes._();

  static GoRouter configs = GoRouter(

    initialLocation: RoutesPath.shopsList,

    routes: <RouteBase>[

      GoRoute(
        path: RoutesPath.shopsList,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (_) => ShopBloc(di<ShopUsecase>())..add(GetShopsListEvent()),
            child:  ShopsListPage(),
          );
        },
      ),

    ]
  );
}
