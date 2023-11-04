import 'package:flutter/material.dart';

import '../features/list_products/presentation/pages/product_list_page.dart';

class App extends MaterialApp {
  const App({super.key}) : super(home: const ProductListPage());
}
