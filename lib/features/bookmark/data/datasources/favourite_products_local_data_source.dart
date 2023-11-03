abstract class FavouriteProductsLocalDataSource {
  Set<int> markAsFavorite(int productId);
  Set<int> removeFromFavourite(int productId);
  Set<int> getFavorites();
}

class FavouriteProductsLocalDataSourceImpl
    implements FavouriteProductsLocalDataSource {
  final favouriteProducts = <int>{};

  @override
  Set<int> markAsFavorite(int productId) {
    favouriteProducts.add(productId);
    return getFavorites();
  }

  @override
  Set<int> removeFromFavourite(int productId) {
    favouriteProducts.remove(productId);
    return getFavorites();
  }

  @override
  Set<int> getFavorites() {
    return favouriteProducts;
  }
}
