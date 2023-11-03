part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState(this.favourites);
  final Set<int> favourites;

  @override
  List<Object> get props => favourites.toList();
}

class BookmarkInitial extends BookmarkState {
  const BookmarkInitial([super.favourites = const {}]);
}
class BookmarksLoading extends BookmarkState {
  const BookmarksLoading(super.favourites);
}
class BookmarksLoadFailed extends BookmarkState {
  const BookmarksLoadFailed(super.favourites);
}
class BookmarksLoaded extends BookmarkState {
  const BookmarksLoaded(super.favourites);
}
