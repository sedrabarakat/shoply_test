import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_text_from_field.dart';
import '../bloc/shop_bloc.dart';
import '../bloc/shop_events.dart';

Widget searchField({required BuildContext context,required TextEditingController controller}) {
  Timer? _debounce;

  return CustomTextFormField(
    prefix: Icon(CupertinoIcons.search),
    hintText: 'Search',
    controller: controller,
    onChanged: (value) {
      if (_debounce?.isActive ?? false) _debounce!.cancel();
      _debounce = Timer(const Duration(milliseconds: 400), () {
        context.read<ShopBloc>().add(SearchShopsEvent(value));
      });
    },
  );
}
