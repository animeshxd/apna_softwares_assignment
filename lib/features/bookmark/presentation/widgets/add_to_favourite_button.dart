import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bookmark_bloc.dart';

class AddToFavouriteButton extends StatefulWidget {
  const AddToFavouriteButton({super.key, required this.productId});
  final int productId;

  @override
  State<AddToFavouriteButton> createState() => _AddToFavouriteButtonState();
}

class _AddToFavouriteButtonState extends State<AddToFavouriteButton> {
  bool isFavourite = false;

  Set<int> favouriteProducts = {};

  @override
  void initState() {
    super.initState();
    var bookmarkCubit = context.read<BookmarkCubit>();
    var state = bookmarkCubit.state;
    if (state is BookmarkInitial) {
      bookmarkCubit.add(GetFavouriteProducts());
    }
    favouriteProducts = state.favourites;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkCubit, BookmarkState>(
      builder: (context, state) {
        isFavourite = state.favourites.contains(widget.productId);
        return IconButton(
          onPressed: () => isFavourite
              ? _onRemoveToFavourite(context) //
              : _onAddToFavourite(context),
          icon: Icon(
            Icons.favorite,
            color: isFavourite ? Colors.pink : null,
          ),
        );
      },
    );
  }

  _onAddToFavourite(BuildContext context) {
    context.read<BookmarkCubit>().add(AddProductToFavorites(productId: widget.productId));
  }

  _onRemoveToFavourite(BuildContext context) {
    context.read<BookmarkCubit>().add(RemoveProductFromFavourites(productId: widget.productId));
  }
}
