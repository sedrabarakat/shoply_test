import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shoply/shop_app.dart';

import 'core/bloc/bloc_observer.dart';
import 'core/locator/locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await locatorSetUp();

  await dotenv.load(fileName: ".env");

  runApp(const ShopApp());
}

