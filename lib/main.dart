import 'package:exercise_admin_application/data/datasources/user_local_datasource.dart';
import 'package:exercise_admin_application/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'application/pages/userlist/user_list_page.dart';
import 'application/pages/homepage/cubit/home_cubit.dart';
import 'application/pages/homepage/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(UserLocalDatasourceImpl.boxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: routes.router,
    );
  }
}
