import 'package:equatable/equatable.dart';

import '../../../../core/enums/sort_type.dart';


abstract class ShopEvents extends Equatable{}

class GetShopsListEvent extends ShopEvents{

  @override
  List<Object?> get props => [];
}

class SearchShopsEvent extends ShopEvents {
  final String query;
  SearchShopsEvent(this.query);
  @override
  List<Object?> get props => [query];
}

class SortShopsEvent extends ShopEvents {
  final SortType sortType;
  SortShopsEvent(this.sortType);
  @override
  List<Object?> get props => [sortType];
}

class ToggleOpenOnlyEvent extends ShopEvents {
  final bool openOnly;
  ToggleOpenOnlyEvent(this.openOnly);
  @override
  List<Object?> get props => [openOnly];
}

class ClearFiltersEvent extends ShopEvents {
  @override
  List<Object?> get props => [];
}

