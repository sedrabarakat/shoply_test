import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/features/shop/domain/entities/shop_entity.dart';
import 'package:shoply/features/shop/domain/usecase/shop_usecase.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_events.dart';
import 'package:shoply/features/shop/presentation/bloc/shop_states.dart';
import '../../../../core/enums/sort_type.dart';
import '../../../../core/network/exceptions_service/network_exceptions.dart';

class ShopBloc extends Bloc<ShopEvents, ShopStates> {
  final ShopUsecase shopUsecase;

  ShopBloc(this.shopUsecase) : super(InitShopStates()) {
    on<GetShopsListEvent>(_getShops);
    on<SearchShopsEvent>(_onSearch);
    on<ToggleOpenOnlyEvent>(_onToggleOpenOnly);
    on<SortShopsEvent>(_onSort);
    on<ClearFiltersEvent>(_onClearFilters);
  }

  List<ShopEntity> allShops = [];
  List<ShopEntity> visibleShops = [];

  String query = '';
  bool openOnly = false;
  SortType? sortType;


  Future<void> _getShops(
      GetShopsListEvent event,
      Emitter<ShopStates> emit,
      ) async {
    emit(LoadingGetShopsList());

    final result = await shopUsecase.getShops();

    result.fold(
          (failure) {
        emit(ErrorGetShopsList(
            NetworkExceptions.getErrorMessage(failure)));
      },
          (shops) {
        allShops = shops;
        _applyFilters();
        emit(SuccessGetShopsList(visibleShops));
      },
    );
  }


  void _onSearch(
      SearchShopsEvent event,
      Emitter<ShopStates> emit,
      ) {
    query = event.query;
    _applyFilters();
    emit(SuccessGetShopsList(visibleShops));
  }


  void _onToggleOpenOnly(
      ToggleOpenOnlyEvent event,
      Emitter<ShopStates> emit,
      ) {
    openOnly = event.openOnly;
    _applyFilters();
    emit(SuccessGetShopsList(visibleShops));
  }


  void _onSort(
      SortShopsEvent event,
      Emitter<ShopStates> emit,
      ) {
    sortType = event.sortType;
    _applyFilters();
    emit(SuccessGetShopsList(visibleShops));
  }


  void _onClearFilters(
      ClearFiltersEvent event,
      Emitter<ShopStates> emit,
      ) {
    query = '';
    openOnly = false;
    sortType = null;
    _applyFilters();
    emit(SuccessGetShopsList(visibleShops));
  }


  void _applyFilters() {
    visibleShops = List.from(allShops);

    if (query.isNotEmpty) {
      visibleShops = visibleShops.where((shop) {
        final name = shop.shopName.toLowerCase();
        final desc = shop.description.toLowerCase();

        return name.contains(query.toLowerCase()) ||
            desc.contains(query.toLowerCase());
      }).toList();
    }

    if (openOnly) {
      visibleShops =
          visibleShops.where((shop) => shop.availability).toList();
    }

    if (sortType == SortType.eta) {
      visibleShops.sort(
            (a, b) =>
            a.estimatedDeliveryTime.compareTo(b.estimatedDeliveryTime),
      );
    } else if (sortType == SortType.minimumOrder) {
      visibleShops.sort(
            (a, b) => a.minimumOrder.compareTo(b.minimumOrder),
      );
    }
  }
}