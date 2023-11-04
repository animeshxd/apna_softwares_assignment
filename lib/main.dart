import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app/app.dart';
import 'injector/injector.dart';

void main() {
  configureDependencies();
  Logger.root.level = Level.ALL;
  // Logger.root.onRecord.listen(print);
  
  runApp(const App());
}
