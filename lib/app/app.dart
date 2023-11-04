import 'package:flutter/material.dart';

import '../features/list_products/presentation/pages/product_list_page.dart';
import '../features/providers/app_blocs_provider.dart';

class App extends MaterialApp {
  const App({super.key})
      : super(home: const AppBlocsProvider(child: ProductListPage()));
}
