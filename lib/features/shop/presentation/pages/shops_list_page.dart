import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/core/pages/empty_page.dart';
import 'package:shoply/core/pages/error_page.dart';
import 'package:shoply/core/pages/loading_page.dart';
import 'package:shoply/core/theme/app_colors.dart';
import 'package:shoply/core/theme/app_paddings.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_bloc.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_events.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_states.dart';
import 'package:shoply/features/shop/presentation/widgets/shops_list.dart';
import '../widgets/filter_field.dart';
import '../widgets/search_field.dart';
import '../widgets/shops_app_bar.dart';

class ShopsListPage extends StatelessWidget {
  ShopsListPage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: shopsAppbar(),
      body: BlocConsumer<ShopBloc, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) => _buildBody(context, state),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ShopStates state) {
    return RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async {
        context.read<ShopBloc>().add(GetShopsListEvent());
        await Future.delayed(const Duration(milliseconds: 500));
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.defaultScreen,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: searchField(context: context,controller: searchController)),
                  filterDropdown(context),
                ],
              ),
              SizedBox(height: 20.h),
              _buildList(context, state),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, ShopStates state) {
    if (state is LoadingGetShopsList) {
      return LoadingPage();
    } else if (state is ErrorGetShopsList) {
      return ErrorPage(message: state.error);
    } else if (state is SuccessGetShopsList) {
      if (state.shopsList.isEmpty) {
        return EmptyPage(emptyMessage: 'No results found');
      }
      return shopsList(shops: state.shopsList);
    }
    return const SizedBox();
  }
}
