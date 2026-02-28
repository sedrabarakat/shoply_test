import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/sort_type.dart';
import '../bloc/shop_bloc.dart';
import '../bloc/shop_events.dart';

Widget filterDropdown(BuildContext context) {
  return PopupMenuButton<String>(
    icon: const Icon(Icons.filter_list),
    onSelected: (value) {
      final bloc = context.read<ShopBloc>();

      switch (value) {
        case 'open':
          bloc.add(ToggleOpenOnlyEvent(!bloc.openOnly));
          break;

        case 'eta':
          bloc.add(SortShopsEvent(SortType.eta));
          break;

        case 'min':
          bloc.add(SortShopsEvent(SortType.minimumOrder));
          break;

        case 'clear':
          bloc.add(ClearFiltersEvent());
          break;
      }
    },
    itemBuilder: (context) => [
      const PopupMenuItem(
        value: 'open',
        child: Text('Toggle Open Only'),
      ),

      const PopupMenuItem(
        value: 'eta',
        child: Text('Sort by ETA'),
      ),

      const PopupMenuItem(
        value: 'min',
        child: Text('Sort by Min Order'),
      ),

      const PopupMenuDivider(),

      const PopupMenuItem(
        value: 'clear',
        child: Text('Clear Filters'),
      ),
    ],
  );
}