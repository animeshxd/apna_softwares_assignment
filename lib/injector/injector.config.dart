// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:apna_softwares_assignment/features/bookmark/data/datasources/favourite_products_local_data_source.dart'
    as _i4;
import 'package:apna_softwares_assignment/features/bookmark/data/repositories/favourite_products_repository.dart'
    as _i6;
import 'package:apna_softwares_assignment/features/bookmark/domain/repositories/favourite_products_repository.dart'
    as _i5;
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/get_favorites_products.dart'
    as _i7;
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/mark_as_favorite.dart'
    as _i8;
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/remove_from_favourites.dart'
    as _i12;
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/usecases.dart'
    as _i14;
import 'package:apna_softwares_assignment/features/bookmark/presentation/bloc/bookmark_bloc.dart'
    as _i13;
import 'package:apna_softwares_assignment/features/list_products/data/datasources/products_remote_data_source.dart'
    as _i9;
import 'package:apna_softwares_assignment/features/list_products/data/repositories/product_repository.dart'
    as _i11;
import 'package:apna_softwares_assignment/features/list_products/domain/repositories/product_repository.dart'
    as _i10;
import 'package:apna_softwares_assignment/features/list_products/domain/usecases/get_products.dart'
    as _i15;
import 'package:apna_softwares_assignment/features/list_products/presentation/bloc/list_products_bloc.dart'
    as _i16;
import 'package:apna_softwares_assignment/injector/injector.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Client>(() => registerModule.client);
    gh.lazySingleton<_i4.FavouriteProductsLocalDataSource>(
        () => _i4.FavouriteProductsLocalDataSourceImpl());
    gh.lazySingleton<_i5.FavouriteProductsRepository>(() =>
        _i6.FavouriteProductsRepositoryImpl(
            favouriteProductsLocalDataSource:
                gh<_i4.FavouriteProductsLocalDataSource>()));
    gh.lazySingleton<_i7.GetFavoritesProducts>(() => _i7.GetFavoritesProducts(
        repository: gh<_i5.FavouriteProductsRepository>()));
    gh.lazySingleton<_i8.MarkProductAsFavorite>(() => _i8.MarkProductAsFavorite(
        repository: gh<_i5.FavouriteProductsRepository>()));
    gh.lazySingleton<_i9.ProductsRemoteDataSource>(
        () => _i9.ProductsRemoteDataSourceImpl(client: gh<_i3.Client>()));
    gh.lazySingleton<_i10.ProductsRepository>(() => _i11.ProductRepositoryImpl(
        productsRemoteDataSource: gh<_i9.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i12.RemoveProductFromFavourites>(() =>
        _i12.RemoveProductFromFavourites(
            repository: gh<_i5.FavouriteProductsRepository>()));
    gh.lazySingleton<_i13.BookmarkBloc>(() => _i13.BookmarkBloc(
          gh<_i14.GetFavoritesProducts>(),
          gh<_i14.RemoveProductFromFavourites>(),
          gh<_i14.MarkProductAsFavorite>(),
        ));
    gh.lazySingleton<_i15.GetProducts>(
        () => _i15.GetProducts(repository: gh<_i10.ProductsRepository>()));
    gh.lazySingleton<_i16.ListProductsBloc>(
        () => _i16.ListProductsBloc(gh<_i15.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
