import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CustomCashedImage extends StatelessWidget{
  String url;
  Icon ? errorIcon;
  CustomCashedImage({super.key,required this.url,this.errorIcon});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(color: AppColors.primary,),
      ),
      errorWidget: (context, url, error) => errorIcon ?? const Icon(Icons.broken_image),
    );

  }

}