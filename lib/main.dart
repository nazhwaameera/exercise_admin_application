import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:exercise_admin_application/data/datasources/user_local_datasource.dart';
import 'package:exercise_admin_application/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(UserLocalDatasourceImpl.boxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: appRouter.router,
    );
  }
}
