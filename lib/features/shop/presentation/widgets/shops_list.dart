import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/features/shop/domain/entities/shop_entity.dart';
import 'package:shoply/features/shop/presentation/widgets/shop_cell.dart';

Widget shopsList({required List<ShopEntity> shops}) {
  return ListView.separated(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return shopCell(shop: shops[index]);
    },
    separatorBuilder: (context, index) => SizedBox(height: 10.h),
    itemCount: shops.length,
  );
}


