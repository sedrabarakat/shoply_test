import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/core/theme/app_colors.dart';
import 'package:shoply/core/theme/app_text_styles.dart';
import 'package:shoply/core/widgets/custom_cashed_image.dart';
import 'package:shoply/features/shop/domain/entities/shop_entity.dart';

Widget shopCell({required ShopEntity shop}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 125.h,
          width: 400.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r)),
          child: CustomCashedImage(url: shop.coverPhoto),
        ),
        SizedBox(height: 10.h),
        nameMinimumOrderRow(shop.shopName,shop.availability),
        SizedBox(height: 10.h),
        iconTextRow(label: "${shop.minimumOrder} ${shop.currency}",icon: Icons.money),
        SizedBox(height: 10.h),
        iconTextRow(label: shop.location,icon: CupertinoIcons.location_solid),
        SizedBox(height: 10.h),
        iconTextRow(label: shop.estimatedDeliveryTime,icon: CupertinoIcons.timer_fill),
        SizedBox(height: 10.h),
        SizedBox(
          height: 50.h,
          child: Text(
            shop.description,
            style: AppTextStyles.getMediumStyle(fontSize: 12.sp),
            maxLines: 4,
            overflow: TextOverflow.visible,
          ),
        ),

      ],
    ),
  );
}

Widget nameMinimumOrderRow(String shopName,bool isOpen){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Text(
          shopName,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.getBoldStyle(fontSize: 15.sp),
        ),
      ),
      CircleAvatar(
        radius: 5.r,
        backgroundColor: isOpen ? AppColors.primary : AppColors.lightFont,
      ),
      SizedBox(width: 5.w,),
      Text(
        isOpen ? "open" : "Closed",
        style: AppTextStyles.getRegularStyle(
          fontSize: 15.sp,
          color: isOpen ? AppColors.primary : AppColors.lightFont,
        ),
      ),
    ],
  );
}

Widget iconTextRow({required IconData icon,required String label}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(icon,color: AppColors.primary,size: 20.r,),
      SizedBox(width: 10.w,),
      Expanded(
        child: Text(
          label,
          style: AppTextStyles.getRegularStyle(
              fontSize: 12.sp
          ),
          maxLines: 5,
          overflow: TextOverflow.visible,
        ),
      ),
    ],);
}