import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injector/injector.dart';
import '../bookmark/presentation/bloc/bookmark_bloc.dart';
import '../list_products/presentation/bloc/list_products_bloc.dart';

class AppBlocsProvider extends StatelessWidget {
  const AppBlocsProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<BookmarkBloc>()),
        BlocProvider.value(value: getIt<ListProductsBloc>()),
      ],
      child: child,
    );
  }
}
